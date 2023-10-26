// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

import './design_system.dart';
import './design_system/design_system_colors.dart';

class TestappTheme {
  static ThemeData buildTheme(DesignSystem designSystem) {
    final ThemeData baseTheme;
    final ColorScheme baseColorScheme;
    final designSystemColor = designSystem.colors;

    final isLightTheme = designSystemColor.brightness == Brightness.light;

    if (isLightTheme) {
      baseTheme = ThemeData.light();
    } else {
      baseTheme = ThemeData.dark();
    }

    baseColorScheme = baseTheme.colorScheme;

    final colorScheme = baseColorScheme.copyWith(
      primary: designSystemColor.primaryColor,
      background: designSystemColor.backgroundColor,
      error: designSystemColor.errorColor,
    );

    const fontName = 'WorkSans';

    return baseTheme.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: designSystemColor.scaffoldBackgroundColor,
      textTheme: baseTheme.textTheme.apply(fontFamily: fontName),
      primaryTextTheme: baseTheme.primaryTextTheme.apply(fontFamily: fontName),
      iconTheme: _buildIconTheme(baseTheme.iconTheme, designSystemColor),
      extensions: <ThemeExtension<dynamic>>[
        designSystem,
      ],
      // Override any material widget themes here if needed.
      useMaterial3: true,
    );
  }

  static IconThemeData _buildIconTheme(
          IconThemeData base, DesignSystemColors designSystemColors) =>
      base.copyWith(
        color: designSystemColors.primaryColor,
      );
}
