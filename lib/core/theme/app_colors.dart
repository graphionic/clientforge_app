import 'package:flutter/material.dart';

/// Centralized color tokens for ClientForge design system.
/// Premium, light-first violet/purple SaaS palette.
abstract class AppColors {
  // Brand Primary Accent (Sophisticated Violet)
  static const Color primary = Color(0xFF6E56CF);
  static const Color primaryHover = Color(0xFF5E43D8);
  static const Color primaryPressed = Color(0xFF5337C4);
  static const Color primaryLight = Color(0xFFF4F0FF);
  static const Color primarySubtle = Color(0xFFECE8FF);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Secondary Accents & Slate
  static const Color secondary = Color(0xFF3B82F6);
  static const Color secondaryLight = Color(0xFFEFF6FF);
  static const Color accentTeal = Color(0xFF0D9488);

  // Neutral Light Surfaces & Backgrounds
  static const Color background = Color(0xFFFAFAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceElevated = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF8FAFC);
  static const Color surfaceMutedDarker = Color(0xFFF1F5F9);

  // Typography Palette (Slate Scale)
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderSubtle = Color(0xFFF1F5F9);
  static const Color borderFocus = Color(0xFF6E56CF);

  // Feedback & Status Tokens
  static const Color success = Color(0xFF10B981);
  static const Color successContainer = Color(0xFFECFDF5);
  static const Color onSuccess = Color(0xFF065F46);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningContainer = Color(0xFFFFFBEB);
  static const Color onWarning = Color(0xFF92400E);

  static const Color error = Color(0xFFEF4444);
  static const Color errorContainer = Color(0xFFFEF2F2);
  static const Color onError = Color(0xFF991B1B);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoContainer = Color(0xFFEFF6FF);
  static const Color onInfo = Color(0xFF1E40AF);

  // HIMI AI Chat Specifics
  static const Color himiUserBubble = Color(0xFF6E56CF);
  static const Color himiUserText = Color(0xFFFFFFFF);
  static const Color himiAssistantBubble = Color(0xFFF8FAFC);
  static const Color himiAssistantText = Color(0xFF0F172A);
  static const Color himiToolBadge = Color(0xFFF4F0FF);
}
