// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Messages implements i69n.I69nMessageBundle {
  const Messages();
  String get pushedMessage => "You have pushed the button this many times:";
  String get editNewItem => "Edit a new item";
  String get startWizard => "Wizard";
  String get save => "save";
  String get delete => "delete";
  String get next => "next";
  String get finish => "finish";
  String get nameTitle => "Name";
  String get numberTitle => "Number";
  WizardMessages get wizard => WizardMessages(this);
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
        throw Exception('Message $key doesn\'t exist in $this');
    }
  }
}

class WizardMessages implements i69n.I69nMessageBundle {
  final Messages _parent;
  const WizardMessages(this._parent);
  String get step1title => "Step 1 - Wizard";
  String get step2title => "Step 2 - Wizard";
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
        throw Exception('Message $key doesn\'t exist in $this');
    }
  }
}
