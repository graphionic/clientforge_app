import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/cf_card.dart';
import '../../../shared/widgets/cf_empty_state.dart';
import '../../../shared/widgets/cf_metric_card.dart';
import '../../../shared/widgets/cf_section_header.dart';
import '../../../shared/widgets/cf_status_badge.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              PhosphorIcons.squaresFour(PhosphorIconsStyle.bold),
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Dashboard',
              style: AppTypography.title.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Open UI Lab',
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                PhosphorIcons.flask(PhosphorIconsStyle.bold),
                size: 16,
                color: AppColors.primary,
              ),
            ),
            onPressed: () => context.push('/dev/ui-lab'),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Welcome
            CFCard(
              backgroundColor: AppColors.surface,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CFStatusBadge(
                          label: 'V1 Foundation Ready',
                          type: CFStatusType.primary,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'ClientForge Overview',
                          style: AppTypography.title,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'ClientForge overview is coming next.',
                          style: AppTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Preview Metrics Grid
            Row(
              children: [
                Expanded(
                  child: CFMetricCard(
                    title: 'ACTIVE DEALS',
                    value: '18',
                    trend: '+12% this week',
                    icon: PhosphorIcons.briefcase(PhosphorIconsStyle.bold),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: CFMetricCard(
                    title: 'PIPELINE',
                    value: '\$124.5k',
                    trend: '+8% vs last mo',
                    icon: PhosphorIcons.currencyDollar(PhosphorIconsStyle.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),

            // Section Header & Placeholder Empty State
            const CFSectionHeader(
              title: 'Recent Activity',
            ),
            const SizedBox(height: AppSpacing.md),
            CFCard(
              child: CFEmptyState(
                icon: PhosphorIcons.chartLineUp(PhosphorIconsStyle.regular),
                title: 'Activity Stream Initializing',
                description:
                    'Real-time pipeline metrics, lead activity, and daily AI summaries will appear here in the next phase.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
