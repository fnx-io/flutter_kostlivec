import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/i69n/locales.dart';
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/service/persistence_service.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';
import 'package:flutter_kostlivec/src/widget/debug_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'app_config_service.dart';

///
/// Konfigurace všeho. Výchozí stavy objektů, registrace hooků, založení instancí servis a stavů v get_it.
///
///
class LifecycleService extends WidgetsBindingObserver {
  LifecycleService._();

  static Future<Widget> configureApp(AppMode mode, Widget appWidget) async {
    // configure logging
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name.padRight(6)}: ${rec.time}: ${rec.loggerName.padRight(20)}: ${rec.message}');
      if (rec.error != null) {
        print(rec.error);
      }
      if (rec.stackTrace != null) {
        print(rec.stackTrace);
      }
    });

    var me = LifecycleService._();

    Logger log = Logger("AppLifecycleService");

    log.info("Configuring services ...");
    await me._configureServices();

    log.info("Configuring initial state ...");
    await me._configureInitialState(mode);

    log.info("Loading previous persistent state ...");
    await getMy<PersistenceService>().loadPreviousState();

    log.info("Configuring hooks ...");
    await me._configureHooks();

    log.info("Preparing providers ...");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getMyStateHolder<AppConfigState>()),
        ChangeNotifierProvider(create: (_) => getMyStateHolder<Messages>()),
      ],
      child: DebugWidget(child: appWidget),
    );
  }

  Future _configureInitialState(AppMode mode) async {
    log.info("... AppConfigState");
    var defaultAppConfig = getMy<AppConfigService>().prepareDefaultState(mode);
    GetIt.instance.registerSingleton(StateHolder<AppConfigState>(defaultAppConfig));

    log.info("... Messages");
    GetIt.instance.registerSingleton(StateHolder<Messages>(getMessagesByLocale(defaultAppConfig.locale)));
  }

  Future _configureServices() async {
    GetIt.instance.registerSingleton(this);
    GetIt.instance.registerSingleton(AppConfigService());
    GetIt.instance.registerSingleton(PersistenceService());
  }

  Future _configureHooks() async {
    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      log.info("App is paused");
      getMy<PersistenceService>().saveAppState();
    }
  }
}
