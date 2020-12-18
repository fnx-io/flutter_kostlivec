import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_kostlivec/src/screen/edit_item_screen.dart';
import 'package:flutter_kostlivec/src/service/app_config_service.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() => getMy<AppConfigService>().incrementCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.messages.pushedMessage),
            Text(
              context.watchState<AppConfigState>().counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                languageButton("cs", context),
                Spacer(),
                languageButton("en", context),
                Spacer(),
              ],
            ),
            RaisedButton(
                child: Text(context.messages.editNewItem),
                onPressed: () async {
                  var newItem = new StateHolder(new ItemState((ItemStateBuilder b) => b
                    ..index = 0
                    ..name = "Unknown name"));
                  final String ret = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => newItem,
                        child: EditItemScreen(),
                      ),
                    ),
                  );
                  if ("SAVE" == ret) {
                    // Editovaná položka je v newItem.state. Můžeme ji někam uložit.
                  }
                  // DELETE zde nemá smysl
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget languageButton(String langCode, BuildContext context) {
    String curLang = context.watchState<AppConfigState>().locale.languageCode;
    return FlatButton(
      child: Text(langCode),
      onPressed: langCode == curLang ? null : () => getMy<AppConfigService>().setLocale(langCode),
    );
  }
}
