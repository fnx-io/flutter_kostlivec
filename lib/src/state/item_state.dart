// This file is "item_state.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `item_state.dart` with the code generated by Freezed
part 'item_state.freezed.dart';
// optional: Since our ItemState class is serializable, we must add this line.
// But if ItemState was not serializable, we could skip it.
part 'item_state.g.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState({
    int? index,
    String? name,
    String? info,
  }) = _ItemState;

  factory ItemState.fromJson(Map<String, Object?> json) => _$ItemStateFromJson(json);
}
