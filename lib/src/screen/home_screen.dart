import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/service/config_service.dart';
import 'package:flutter_kostlivec/src/service/my_dummy_app_service.dart';
import 'package:flutter_kostlivec/src/service/story_service.dart';
import 'package:flutter_kostlivec/src/state/config_state.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/state/my_dummy_app_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() => getMy<MyDummyAppService>().incrementCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.messages.pushedMessage),
            Text(
              context.watchState<MyDummyAppState>().counter.toString(),
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
            ElevatedButton(
                child: Text(context.messages.editNewItem),
                onPressed: () async {
                  var someItemToEdit = ItemState(index: 0, name: "Položka Vlastička", info: "Zatím nic");
                  await getMy<StoryService>().startItemEdit(context, someItemToEdit);
                }),
            ElevatedButton(
                child: Text(context.messages.startWizard),
                onPressed: () async {
                  var someItemToEdit = ItemState(index: 1, name: "Průvodkyně Vlastička", info: "Info o průvodci");
                  await getMy<StoryService>().startWizard(context, someItemToEdit);
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
    String curLang = context.watchState<ConfigState>().locale!.languageCode;
    return TextButton(
      child: Text(langCode),
      onPressed: langCode == curLang ? null : () => getMy<ConfigService>().setLocale(langCode),
    );
  }
}
