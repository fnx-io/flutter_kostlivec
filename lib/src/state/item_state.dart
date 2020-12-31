import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_state.g.dart';

///
/// An item made for the sake of demonstrating an edit screen (EditItemScreen).
///
abstract class ItemState implements Built<ItemState, ItemStateBuilder> {
  static Serializer<ItemState> get serializer => _$itemStateSerializer;

  int get index;

  String get name;
  ItemState._();
  factory ItemState([void Function(ItemStateBuilder) updates]) = _$ItemState;
}
