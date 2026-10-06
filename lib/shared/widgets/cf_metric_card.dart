import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'cf_card.dart';

/// Reusable metric card widget for Dashboard and UI Lab.
class CFMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? trend;
  final bool isTrendPositive;
  final IconData? icon;

  const CFMetricCard({
    super.key,
    required this.title,
    required this.value,
    this.trend,
    this.isTrendPositive = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CFCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.label.copyWith(color: AppColors.textSecondary),
              ),
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, size: 16, color: AppColors.primary),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: AppTypography.heading.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Icon(
                  isTrendPositive
                      ? PhosphorIcons.trendUp(PhosphorIconsStyle.bold)
                      : PhosphorIcons.trendDown(PhosphorIconsStyle.bold),
                  size: 14,
                  color: isTrendPositive ? AppColors.success : AppColors.error,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  trend!,
                  style: AppTypography.caption.copyWith(
                    color: isTrendPositive ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
