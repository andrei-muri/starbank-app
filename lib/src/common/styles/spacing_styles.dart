import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithApBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    left: Sizes.defaultSpace,
    bottom: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
}