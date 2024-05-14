import 'package:flutter/material.dart';

Map<String, String?> toJsonLocale(Locale value) => {'languageCode': value.languageCode, 'countryCode': value.countryCode};
Locale fromJsonLocale(Map<String, String?> ser) => Locale(ser['languageCode']!, ser['countryCode']);
