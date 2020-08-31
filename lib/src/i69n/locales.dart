import 'dart:ui';

import 'package:flutter/material.dart';

Locale _en = Locale("en");
Locale _cs = Locale("cs");

List<Locale> _possibleLocales = [_en, _cs];

Locale detectLocale() {
  Locale l = WidgetsBinding.instance.window.locale;
  Locale pl = _possibleLocales.firstWhere((lp) => lp.languageCode == l.languageCode, orElse: () => null);
  if (pl != null) return pl;
  return _cs;
}
