//

import 'package:flutter/material.dart';

class Pallet {
  static const primary = Color(0xFFE7A968);

  static final primarySwatch = primary.toMaterialColor();
  static const background = Color(0xFFEFEFEF);
  static const darkAppBar = Color(0xFF02030A);
  static const meduimDarkText = Color(0xFF5D5D5D);
}

extension _Material on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(
        value,
        _toSwatch(),
      );

  MaterialAccentColor toMaterialAccentColor() => MaterialAccentColor(
        value,
        _toSwatch(),
      );
}
