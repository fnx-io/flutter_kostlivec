import 'dart:ui';

import 'package:flutter/material.dart';

import 'messages.i69n.dart';
import 'messages_cs.i69n.dart';

Locale _en = Locale("en");
Locale _cs = Locale("cs");

List<Locale> _possibleLocales = [_en, _cs];

Locale detectLocale() {
  Locale l = WidgetsBinding.instance.window.locale;
  return findNearestLocale(l);
}

Locale findNearestLocale(Locale l) {
  Locale pl = _possibleLocales.firstWhere((lp) => lp.languageCode == l.languageCode, orElse: () => null);
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
