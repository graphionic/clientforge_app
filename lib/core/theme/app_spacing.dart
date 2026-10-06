import 'package:flutter/material.dart';

/// Centralized spacing scale for ClientForge design system.
/// Scale: 4 / 8 / 12 / 16 / 20 / 24 / 32 / 40
abstract class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double huge = 40.0;

  // EdgeInsets Helpers
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  // SizedBox Spacers
  static const SizedBox spaceXs = SizedBox(width: xs, height: xs);
  static const SizedBox spaceSm = SizedBox(width: sm, height: sm);
  static const SizedBox spaceMd = SizedBox(width: md, height: md);
  static const SizedBox spaceLg = SizedBox(width: lg, height: lg);
  static const SizedBox spaceXl = SizedBox(width: xl, height: xl);
  static const SizedBox spaceXxl = SizedBox(width: xxl, height: xxl);
  static const SizedBox spaceXxxl = SizedBox(width: xxxl, height: xxxl);
  static const SizedBox spaceHuge = SizedBox(width: huge, height: huge);
}
