import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getMy = GetIt.instance.get;
final getMyAsync = GetIt.instance.getAsync;

StateHolder<STATE> getMyState<STATE extends Built<dynamic, dynamic>>() => GetIt.instance.get<StateHolder<STATE>>();

extension FindContextState on BuildContext {
  StateHolder<T> findStateHolder<T extends Built<T, Builder<T, dynamic>>>() {
    return this.read<StateHolder<T>>();
  }
}

extension ReadContextState on BuildContext {
  T readState<T extends Built<T, Builder<T, dynamic>>>() {
    return this.read<StateHolder<T>>().state;
  }
}

extension WatchContextState on BuildContext {
  T watchState<T extends Built<T, Builder<T, dynamic>>>() {
    return this.watch<StateHolder<T>>().state;
  }
}
