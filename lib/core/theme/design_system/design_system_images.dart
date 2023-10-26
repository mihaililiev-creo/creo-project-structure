// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

@immutable
class DesignSystemImages {
  const DesignSystemImages.dark()
      : googleLogo = '$imagePath/google_dark_icon.svg';
  const DesignSystemImages.light()
      : googleLogo = '$imagePath/google_light_icon.svg';

  static const imagePath = 'assets/images';
  final testImage = const AssetImage('$imagePath/testImage.png');

  final String googleLogo;

  final String appleLogo = '$imagePath/apple_icon.svg';

  final String facebookLogo = '$imagePath/facebook_icon.svg';
}
