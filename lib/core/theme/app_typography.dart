import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized typography definitions for ClientForge.
/// Uses Plus Jakarta Sans as the primary font family with disciplined hierarchy.
abstract class AppTypography {
  static TextStyle get display => GoogleFonts.plusJakartaSans(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.25,
        letterSpacing: -0.4,
      );

  static TextStyle get heading => GoogleFonts.plusJakartaSans(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
        letterSpacing: -0.3,
      );

  static TextStyle get title => GoogleFonts.plusJakartaSans(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.35,
        letterSpacing: -0.2,
      );

  static TextStyle get body => GoogleFonts.plusJakartaSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.45,
      );

  static TextStyle get bodyMedium => GoogleFonts.plusJakartaSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.45,
      );

  static TextStyle get bodySmall => GoogleFonts.plusJakartaSans(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get label => GoogleFonts.plusJakartaSans(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 0.2,
      );

  static TextStyle get caption => GoogleFonts.plusJakartaSans(
        fontSize: 11.0,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.3,
      );
}
