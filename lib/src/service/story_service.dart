import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kostlivec/src/screen/edit_item_screen.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

///
/// Tady zacinaji vetsi use-cases, kterym se nyni s oblibou rika stories.
///
class StoryService {
  /// Ukazka otevreni editace
  Future startItemEdit(BuildContext context, ItemState stateToEdit) async {
    var itemStateHolder = new StateHolder(stateToEdit);

    var editScreen = ChangeNotifierProvider(
      create: (_) => itemStateHolder,
      child: EditItemScreen(),
    );

    final StoryEnding ending = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editScreen),
    );
    if (ending == StoryEnding.save) {
      // Editovaná položka je v newItem.state. Můžeme ji někam uložit.
      log.info("Item saved:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
      //getMy<PersistenceService>()...
    }
  }
}

// Stories muzou mit nejaky ending.
enum StoryEnding {
  save,
  delete // pridavej podle potreby

}
