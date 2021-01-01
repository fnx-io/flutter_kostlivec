import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final getMy = GetIt.instance.get;
final getMyAsync = GetIt.instance.getAsync;

StateHolder<STATE> getMyStateHolder<STATE>() => GetIt.instance.get<StateHolder<STATE>>();

///
/// Umozni nacist state holder - pouzivejte, kdyz potrebujete vymenit *State objekt za novou instanci.
///
extension ReadContextStateHolder on BuildContext {
  StateHolder<T> getStateHolder<T extends Built<T, Builder<T, dynamic>>>() {
    return Provider.of<StateHolder<T>>(this, listen: false);
  }
}

///
/// Umozni ziskat pozadovany *State objekt, ale build context NEbude notifikovan o zmene.
///
extension ReadContextState on BuildContext {
  T readState<T extends Built<T, Builder<T, dynamic>>>() {
    return Provider.of<StateHolder<T>>(this, listen: false).state;
  }
}

///
/// Umozni ziskat pozadovany *State objekt, a build context BUDE notifikovan o zmene, lze vesmes pouzit pouze uvnitr build metod, nikoliv napr. v event handlerech apod.
///
extension WatchContextState on BuildContext {
  T watchState<T extends Built<T, Builder<T, dynamic>>>() {
    return this.watch<StateHolder<T>>().state;
  }
}

///
/// Ziskani aktuane platnych messages, bez sledovani zmen.
///
extension MessagesContext on BuildContext {
  Messages get messages {
    return Provider.of<StateHolder<Messages>>(this, listen: false).state;
  }
}

///
/// Ziskani aktuane platnych messages a pozadavek na upozorneni na zmenu (realne pouze zmena locale).
///
extension WatchMessagesContext on BuildContext {
  Messages get watchMessages {
    return this.watch<StateHolder<Messages>>().state;
  }
}

///
/// Logovani: log.info(...);
///
extension Logging on Object {
  Logger get log => Logger(this.runtimeType.toString());
}
