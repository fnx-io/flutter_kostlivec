import 'dart:ui';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';

import 'messages.i69n.dart';
import 'messages_cs.i69n.dart';

Locale _en = Locale("en");
Locale _cs = Locale("cs");

List<Locale> _possibleLocales = [_en, _cs];

Locale detectLocale() {
  Locale l = WidgetsBinding.instance!.window.locale;
  return findNearestLocale(l);
}

Locale findNearestLocale(Locale l) {
  Locale? pl = _possibleLocales.firstWhereOrNull((lp) => lp.languageCode == l.languageCode);
  if (pl != null) return pl;
  return _possibleLocales.first;
}

Messages getMessagesByLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'cs':
      return Messages_cs();
    default:
      return Messages();
  }
}
