import 'package:flutter_kostlivec/launcher.dart';
import 'package:flutter_kostlivec/src/build_flavor.dart';

///
/// Start v rezimu prod / produkcni prostredi
///
void main() {
  launch(BuildFlavor.PROD);
}
