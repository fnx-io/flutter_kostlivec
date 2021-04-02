// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'messages.i69n.dart';

String get _languageCode => 'cs';
String get _localeName => 'cs';

String _plural(int count,
        {String zero,
        String one,
        String two,
        String few,
        String many,
        String other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String zero,
        String one,
        String two,
        String few,
        String many,
        String other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String zero,
        String one,
        String two,
        String few,
        String many,
        String other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Messages_cs extends Messages {
  const Messages_cs();
  String get pushedMessage => "Čudl jsi zmáčnul tolikrát:";
  String get editNewItem => "Edituj novou položku";
  String get startWizard => "Průvodce";
  String get save => "uložit";
  String get delete => "smazat";
  String get next => "další";
  String get finish => "dokončit";
  String get nameTitle => "Jméno";
  String get numberTitle => "Číslo";
  WizardMessages_cs get wizard => WizardMessages_cs(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pushedMessage':
        return pushedMessage;
      case 'editNewItem':
        return editNewItem;
      case 'startWizard':
        return startWizard;
      case 'save':
        return save;
      case 'delete':
        return delete;
      case 'next':
        return next;
      case 'finish':
        return finish;
      case 'nameTitle':
        return nameTitle;
      case 'numberTitle':
        return numberTitle;
      case 'wizard':
        return wizard;
      default:
        return super[key];
    }
  }
}

class WizardMessages_cs extends WizardMessages {
  final Messages_cs _parent;
  const WizardMessages_cs(this._parent) : super(_parent);
  String get step1title => "Krok 1 - Průvodce";
  String get step2title => "Krok 2 - Průvodce";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'step1title':
        return step1title;
      case 'step2title':
        return step2title;
      default:
        return super[key];
    }
  }
}
