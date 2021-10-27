import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/app.dart';
import 'package:flutter_kostlivec/src/build_flavor.dart';
import 'package:flutter_kostlivec/src/i69n/locales.dart';
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/preconditions.dart';
import 'package:flutter_kostlivec/src/service/config_service.dart';
import 'package:flutter_kostlivec/src/service/my_dummy_app_service.dart';
import 'package:flutter_kostlivec/src/service/persistence_service.dart';
import 'package:flutter_kostlivec/src/service/story_service.dart';
import 'package:flutter_kostlivec/src/state/config_state.dart';
import 'package:flutter_kostlivec/src/state/my_dummy_app_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';
import 'package:flutter_kostlivec/src/widget/debug_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

Logger _log = Logger("Launcher");

///
/// Nastartuje aplikaci v TEST nebo PROD modu
///
Future launch(BuildFlavor mode) async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget composedApp = await _composeApp(mode, App());

  runApp(composedApp);
}

Future<Widget> _composeApp(BuildFlavor mode, Widget appWidget) async {
// configure _logging
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name.padRight(6)}: ${rec.time}: ${rec.loggerName.padRight(20)}: ${rec.message}');
    if (rec.error != null) {
      print(rec.error);
    }
    if (rec.stackTrace != null) {
      print(rec.stackTrace);
    }
  });

  _log.info("Configuring services ...");
  await _configureServices();

  _log.info("Configuring initial state ...");
  await _configureInitialState(mode);

  _log.info("Loading previous persistent state ...");
  await getMy<PersistenceService>().loadPreviousState();

  _log.info("Registering preconditions ...");
  registerAndVerifyAllPreconditions();

  _log.info("Preparing providers ...");
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => getMyStateHolder<ConfigState>()),
      ChangeNotifierProvider(create: (_) => getMyStateHolder<MyDummyAppState>()),
      ChangeNotifierProvider(create: (_) => getMyStateHolder<Messages>()),
    ],
    child: DebugWidget(child: appWidget),
  );
}

Future _configureInitialState(BuildFlavor mode) async {
  _log.info("... ConfigState");
  var defaultConfig = getMy<ConfigService>().prepareDefaultState(mode);
  GetIt.instance.registerSingleton(StateHolder<ConfigState>(defaultConfig));

  _log.info("... MyDummyAppState");
  var defaultDummyState = getMy<MyDummyAppService>().prepareDefaultState(mode);
  GetIt.instance.registerSingleton(StateHolder<MyDummyAppState>(defaultDummyState));

  _log.info("... Messages");
  GetIt.instance.registerSingleton(StateHolder<Messages>(getMessagesByLocale(defaultConfig.locale!)));
}

Future _configureServices() async {
  GetIt.instance.registerSingleton(ConfigService());
  GetIt.instance.registerSingleton(MyDummyAppService());
  GetIt.instance.registerSingleton(PersistenceService());
  GetIt.instance.registerSingleton(StoryService());
}
