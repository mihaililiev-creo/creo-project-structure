// Copyright (c) 2023, Prime Holding JSC
// https://www.primeholding.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

@immutable
class DesignSystemIcons {
  DesignSystemIcons();

  static const _kFontFam = 'KmpIcons';
  static const String? _kFontPkg = null;

  /// region App specific icons

  final backArrow =
      const IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final call =
      const IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final bell =
      const IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final close =
      const IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final closePreview =
      const IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final edit =
      const IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final home =
      const IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final navigationCircle =
      const IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final magnifyGlass =
      const IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final place =
      const IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final success =
      const IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final tools =
      const IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final searchTextMagnifyGlass =
      const IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final person =
      const IconData(0xe80d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final visibility =
      const IconData(0xe80e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  final screwdriverWrench =
      const IconData(0xe80f, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  /// endregion

  /// region General purpose icons

  final phone = Icons.local_phone;

  final arrowBack = Icons.arrow_back;

  final plusSign = Icons.add;

  final minusSign = Icons.remove;

  final reload = Icons.update;

  final info = Icons.info;

  final login = Icons.login;

  final avatar = Icons.person;

  final message = Icons.message;

  final Icon calculateIcon = _getIcon(Icons.calculate);

  final Icon widgetIcon = _getIcon(Icons.widgets);

  final Icon listIcon = _getIcon(Icons.list);

  final Icon accountIcon = _getIcon(Icons.account_box);

  final Icon logoutIcon = _getIcon(Icons.logout);

  final Icon linkIcon = _getIcon(Icons.link);

  final Icon dashboard = _getIcon(Icons.dashboard);

  final Icon pin = _getIcon(Icons.pin);

  static Icon _getIcon(IconData iconData) => Icon(iconData);

  /// endregion
}
