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

      StateHolder<ConfigState> get holder
            => getMy<StateHolder<ConfigState>>();
    
      // zvedne counter o 1
      void incrementCounter() {
        holder.state = holder.state.rebuild((ConfigStateBuilder b) {
          b.counter = b.counter + 1;
        });
      }
 

Současně jsou StateHoldery zaregistrované v get_it, přes které je lze získat:
      
      StateHolder<ConfigState> get holder
            => getMy<StateHolder<ConfigState>>();
            
To je užitečné mimo BuildContext (services apod.) ale pokud jste ve widgetu,
pravděpodobně chcete, aby se widget při změně stavu překreslil. Ke stavu proto přístoupíte
pomocí package provider:

      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text(
                  '${context.watchState<ConfigState>().counter}',
                  style: Theme.of(context).textTheme.headline4,
            ),
          ),
        );
      }

V souboru [lib/src/util.dart](lib/src/util.dart) jsou za tím účelem definované extensions třídy BuildContext:

* watchState<STATE>() - pozoruj stav, překresli se, když se změní
* readState<STATE>() - dej mi stav, změny neřeš

Sestavení jednotlivých stavů, state holderů, Provider widgetů a jejich registrace v get_it, ... to všechno
se odehrává při startu v [lib/launcher.dart](lib/launcher.dart).

### Business logic / Services ###

Změny stavu by bylo vhodné dělat v pěkných "service" objektech,
např. [ConfigService](lib/src/service/config_service.dart). 

### Persistentní stav ###

Různá nastavení aplikace, nebo dokonce aktuální stav UI, by měla přežít restart / zabití. K tomu účelu slouží 
[lib/src/service/persistence_service.dart](lib/src/service/persistence_service.dart), který se volá při startu (načtení stavu) a kdykoliv jde aplikace na pozadí.
Persistentní stav se napěchuje do objektu [lib/src/state/persistent_state.dart](lib/src/state/persistent_state.dart), zeserializuje do JSON a uloží na disk.

Při načítání se zase deserializuje a hodnoty se ručně nastrkají do správných state objektů. Co chcete ukládat nadefinujte
v persistence_service.dart (_buildPersistentState a _restorePersistenState).

Do této služby si připište ukládání vašich aplikačních dat a volejte dle libosti.

### Editační obrazovka ###

Jestliže potřebujete editovat novou nebo existující položku ve zvláštní obrazovce,
dá se postupovat takto:

* Uděláme nový state object, který chceme editovat (buď nový, nebo kopii existujícího, jež editujeme). Ten state object je immutable.
* Uděláme `StateHolder` pro tento nový state object. (`StateHolder` je vlastně `ChangeNotifier`).
* Používáme `provider`. Takže editační obrazovka bude volat `context.watch<StateHolder<ItemState>>()` a tím dostane holder editovaného objektu.

Pro tuto přípravu významného use-cases aplikace slouží [lib/src/service/story_service.dart](lib/src/service/story_service.dart), sem přidávejte metody
pro jednotlivé user stories. (Z toho plyne, ze kostlivec je agile-ready).

Ukázka je použitá v [lib/src/screen/home_screen.dart](lib/src/screen/home_screen.dart) v obsluze tlačítka *editNewItem*.

## utils.dart ##

Utils obsahují pár užitečných funkcí a extensions. Takže importnutím:

    import 'package:flutter_kostlivec/src/util.dart'; 
 
dostanete k dispozici:

* Object.log - logger (nakonfigurováno v launcher.dart)
* BuildContext.messages - messages pro aktuální jazyk
* BuildContext.watchState, BuildContext.readState, BuildContext.findStateHolder
* getMy, getMyAsync - 

## Lokalizace ##

## Theme ##