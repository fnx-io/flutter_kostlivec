# flutter_kostlivec

## Packages ##

Nejprve by to chtělo se seznámit s packages:

* https://pub.dev/packages/provider
* https://pub.dev/packages/get_it
* https://pub.dev/packages/built_value
* https://pub.dev/packages/i69n

Pak asi má smysl se nořit dál.

## State management ##

StateFull widgety se v podstatě nepoužívají, maximálně pro "ephemeral" stav animovaného/chytrého widgetu. Data / aplikační / business
stav se ukládá do nemodifikovatelných objektů v adresáři [lib/src/state](). Tyto třídy jsou částečně generované pomocí package
[built_value](https://pub.dev/packages/built_value).
 
Jednotlivé stavové objekty (které si přidávejte dli libosti) pak drží objekty [StateHolder](lib/src/state/state_holder.dart). Ty modifikovatelné jsou - 
změnu stavu tedy provedete tak, že v odpovídajícím StateHolderu vyměníte jednu instanci stavu (modelu) za druhou:

      StateHolder<AppConfigState> get holder
            => getMy<StateHolder<AppConfigState>>();
    
      // zvedne counter o 1
      void incrementCounter() {
        holder.state = holder.state.rebuild((AppConfigStateBuilder b) {
          b.counter = b.counter + 1;
        });
      }
 

Současně jsou StateHoldery zaregistrované v get_it, přes které je lze získat:
      
      StateHolder<AppConfigState> get holder
            => getMy<StateHolder<AppConfigState>>();
            
To je užitečné mimo BuildContext (services apod.) ale pokud jste ve widgetu,
pravděpodobně chcete, aby se widget při změně stavu překreslil. Ke stavu proto přístoupíte
pomocí package provider:

      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text(
                  '${context.watchState<AppConfigState>().counter}',
                  style: Theme.of(context).textTheme.headline4,
            ),
          ),
        );
      }

V souboru [lib/src/util.dart]() jsou za tím účelem definované extensions třídy BuildContext:

* watchState<STATE>() - pozoruj stav, překresli se, když se změní
* readState<STATE>() - dej mi stav, změny neřeš

Sestavení jednotlivých stavů, state holderů, Provider widgetů a jejich registrace v get_it, ... to všechno
se odehrává v [lib/src/service/lifecycle_service.dart]() a spouští se při startu v [lib/launcher.dart]().

### Business logic / Services ###

Změny stavu by bylo vhodné dělat v pěkných "service" objektech,
např. [AppConfigService](lib/src/service/app_config_service.dart). 

### Persistentní stav ###

Různá nastavení aplikace, nebo dokonce aktuální stav UI, by měla přežít restart / zabití. K tomu účelu slouží 
[lib/src/service/persistence_service.dart](), který se volá při startu (načtení stavu) a kdykoliv jde aplikace na pozadí.
Persistentní stav se napěchuje do objektu [lib/src/state/persistent_state.dart](), zeserializuje do JSON a uloží na disk.

Při načítání se zase deserializuje a hodnoty se ručně nastrkají do správných state objektů. Co chcete ukládat nadefinujte
v persistence_service.dart (_buildPersistentState a _restorePersistenState).

## Aplikace / obrazovky / navigace ##

Používá se Navigator, routes jsou uložené v `lib/src/app.dart`. Pro navigaci použijeme normálně
`Navigator.pushNamed(context, route_name);`

### Editační obrazovka ###

Jestliže potřebujete editovat novou nebo existující položku ve zvláštní obrazovce,
dá se postupovat takto:

* Uděláme nový state object, který chceme editovat (buď nový, nebo kopii existujícího, jež editujeme). Ten state object je immutable.
* Uděláme StateHolder pro tento nový state object. (StateHolder je vlastně ChangeNotifier). Celé např.:

    holder = new StateHolder(new ItemState((ItemStateBuilder b) => b
      ..v1 = 1
      ..name = "NEW"))

* Máme provider. Takže editační obrazovka bude Consumer, něco takového:

    Widget build(BuildContext context) {
      return Consumer<StateHolder<ItemState>>(builder: (context, value, child) {
        // vlastní hodnota ke zobrazení
        ItemState itemState = value.state;
        return Text("---> $itemState");
      }
    }

    // a pokud ten state object editujeme, tak protože StateHolder je ChangeNotifier,
    // tak nám tady notifikuje toho providera, a způsobí "rebuild" editovací obrazovky.
    void _editItemText(StateHolder<ItemState>value, String newText) {
      holder.state = holder.state.rebuild((ItemStateBuilder b) {
        b.replace(holder.state);
        b.name = name;
        return b;
      });
    }

* A editovatcí obrazovku vyvoláme takto:

    var ret = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => holder,
          child: EditItemScreen(),
        ),
      ),
    );
    if (null == ret) {
      return;  // back button
    }
    if ("SAVE" == ret) {
      // uložíme holder.state do našeho app state
    }


## Lokalizace ##

## Theme ##