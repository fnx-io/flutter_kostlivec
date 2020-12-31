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

extension ReadContextState on BuildContext {
  T readState<T extends Built<T, Builder<T, dynamic>>>() {
    return Provider.of<StateHolder<T>>(this, listen: false).state;
  }
}

extension ReadContextStateHolder on BuildContext {
  StateHolder<T> getStateHolder<T extends Built<T, Builder<T, dynamic>>>() {
    return Provider.of<StateHolder<T>>(this, listen: false);
  }
}

extension WatchContextState on BuildContext {
  T watchState<T extends Built<T, Builder<T, dynamic>>>() {
    return this.watch<StateHolder<T>>().state;
  }
}

extension MessagesContext on BuildContext {
  Messages get messages {
    return Provider.of<StateHolder<Messages>>(this, listen: false).state;
  }
}

extension WatchMessagesContext on BuildContext {
  Messages get watchMessages {
    return this.watch<StateHolder<Messages>>().state;
  }
}

extension Logging on Object {
  Logger get log => Logger(this.runtimeType.toString());
}
