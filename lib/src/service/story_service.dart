import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kostlivec/src/screen/edit_item_screen.dart';
import 'package:flutter_kostlivec/src/screen/wizard1_screen.dart';
import 'package:flutter_kostlivec/src/state/item_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

///
/// Tady zacinaji vetsi use-cases, kterym se nyni s oblibou rika stories.
///
class StoryService {
  /// Ukazka otevreni editace
  /// Pokud delame novy stateToEdit, volajici vytvoril default
  /// Pokud editujeme, tak sem volajici posle existujici stateToEdit. V datech aplikace se nezmeni, protoze StateHolder
  Future startItemEdit(BuildContext context, ItemState stateToEdit) async {
    var itemStateHolder = new StateHolder(stateToEdit);

    var editScreen = itemStateHolder.provideFor(EditItemScreen());

    final StoryEnding? ending = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editScreen),
    );
    if (ending == StoryEnding.save) {
      // Editovaná položka je v itemStateHolder.state. Můžeme ji někam uložit.
      log.info("Item saved:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
      //getMy<PersistenceService>()...
    } else if (ending == StoryEnding.delete) {
      // Pokud jsme editovali existujici polozku, tady ji smazeme
      log.info("Item deleted:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
    } else if (ending == null) {
      log.info("Button back pressed:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
    }
  }

  // Ukazka vicekrokoveho wizarda
  /// Pokud delame novy stateToEdit, volajici vytvoril default
  /// Pokud editujeme, tak sem volajici posle existujici stateToEdit. V datech aplikace se nezmeni, protoze StateHolder
  ///
  /// Jestli se chcete wizarda zbavit, smazte soubory wizard[12]_screen.dart,
  /// funkci startWizard, a volani startWizard v home_screen.
  Future startWizard(BuildContext context, ItemState stateToEdit) async {
    var itemStateHolder = new StateHolder(stateToEdit);

    // Poskyteme obrazovce provider naseho docasneho state holderu, protoze ta hodnota bude pouzita do dalsich provideru wizarda
    var wizardScreen1 = itemStateHolder.provideFor(Wizard1Screen());

    final StoryEnding? ending = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => wizardScreen1),
    );
    if (ending == StoryEnding.save) {
      // Editovaná položka je v itemStateHolder.state. Můžeme ji někam uložit.
      log.info("Item saved:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
      //getMy<PersistenceService>()...
    } else if (ending == StoryEnding.delete) {
      // Pokud jsme editovali existujici polozku, tady ji smazeme
      log.info("Item deleted:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
    } else if (ending == null) {
      log.info("Button back pressed:  ${itemStateHolder.state.index}/${itemStateHolder.state.name}");
    }
  }
}

// Stories muzou mit nejaky ending.
enum StoryEnding {
  save,
  delete // pridavej podle potreby
}
