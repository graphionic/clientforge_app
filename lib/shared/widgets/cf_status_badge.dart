import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum CFStatusType { primary, success, warning, error, info, neutral }

/// Reusable status badge / chip component.
class CFStatusBadge extends StatelessWidget {
  final String label;
  final CFStatusType type;
  final IconData? icon;

  const CFStatusBadge({
    super.key,
    required this.label,
    this.type = CFStatusType.neutral,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;

    switch (type) {
      case CFStatusType.primary:
        bg = AppColors.primaryLight;
        fg = AppColors.primary;
        break;
      case CFStatusType.success:
        bg = AppColors.successContainer;
        fg = AppColors.onSuccess;
        break;
      case CFStatusType.warning:
        bg = AppColors.warningContainer;
        fg = AppColors.onWarning;
        break;
      case CFStatusType.error:
        bg = AppColors.errorContainer;
        fg = AppColors.onError;
        break;
      case CFStatusType.info:
        bg = AppColors.infoContainer;
        fg = AppColors.onInfo;
        break;
      case CFStatusType.neutral:
        bg = AppColors.surfaceMuted;
        fg = AppColors.textSecondary;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + 2,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.borderPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: fg),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
