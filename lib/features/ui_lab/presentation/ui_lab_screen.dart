import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/cf_button.dart';
import '../../../shared/widgets/cf_card.dart';
import '../../../shared/widgets/cf_empty_state.dart';
import '../../../shared/widgets/cf_himi_bubbles.dart';
import '../../../shared/widgets/cf_metric_card.dart';
import '../../../shared/widgets/cf_section_header.dart';
import '../../../shared/widgets/cf_status_badge.dart';
import '../../../shared/widgets/cf_text_field.dart';

class UiLabScreen extends StatelessWidget {
  const UiLabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              PhosphorIcons.flask(PhosphorIconsStyle.bold),
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'ClientForge UI Lab',
              style: AppTypography.title.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Design System & Component QA Showcase',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: AppSpacing.lg),

            // SECTION 1: COLORS
            _buildSection(
              title: '1. Colors',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  _colorChip('Primary', AppColors.primary),
                  _colorChip('Primary Hover', AppColors.primaryHover),
                  _colorChip('Primary Light', AppColors.primaryLight),
                  _colorChip('Secondary', AppColors.secondary),
                  _colorChip('Background', AppColors.background),
                  _colorChip('Surface', AppColors.surface),
                  _colorChip('Success', AppColors.success),
                  _colorChip('Warning', AppColors.warning),
                  _colorChip('Error', AppColors.error),
                  _colorChip('Border', AppColors.border),
                ],
              ),
            ),

            // SECTION 2: TYPOGRAPHY
            _buildSection(
              title: '2. Typography',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display (24px Bold)', style: AppTypography.display),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Heading (18px SemiBold)', style: AppTypography.heading),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Title (15px SemiBold)', style: AppTypography.title),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Body (14px Regular)', style: AppTypography.body),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Body Medium (14px Medium)', style: AppTypography.bodyMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Body Small (13px Regular)', style: AppTypography.bodySmall),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Label (12px SemiBold)', style: AppTypography.label),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Caption (11px Regular)', style: AppTypography.caption),
                ],
              ),
            ),

            // SECTION 3: BUTTONS
            _buildSection(
              title: '3. Buttons',
              child: Column(
                children: [
                  CFPrimaryButton(
                    label: 'Primary Action',
                    icon: PhosphorIcons.checkCircle(PhosphorIconsStyle.bold),
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppSpacing.md),
                  CFSecondaryButton(
                    label: 'Secondary Action',
                    icon: PhosphorIcons.slidersHorizontal(PhosphorIconsStyle.bold),
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CFGhostButton(
                          label: 'Ghost Link',
                          icon: PhosphorIcons.arrowRight(PhosphorIconsStyle.bold),
                          onPressed: () {},
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        const CFPrimaryButton(
                          label: 'Disabled',
                          isDisabled: true,
                          fullWidth: false,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        const CFPrimaryButton(
                          label: 'Loading',
                          isLoading: true,
                          fullWidth: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 4: INPUTS
            _buildSection(
              title: '4. Inputs',
              child: Column(
                children: const [
                  CFTextField(
                    label: 'Default Input Field',
                    hintText: 'Enter text here...',
                  ),
                  SizedBox(height: AppSpacing.md),
                  CFTextField(
                    label: 'Input with Error State',
                    hintText: 'user@domain',
                    errorText: 'Please enter a valid email address.',
                  ),
                  SizedBox(height: AppSpacing.md),
                  CFTextField(
                    label: 'Password Input',
                    hintText: '••••••••',
                    obscureText: true,
                  ),
                ],
              ),
            ),

            // SECTION 5: CARDS
            _buildSection(
              title: '5. Cards',
              child: Column(
                children: [
                  CFCard(
                    child: Text(
                      'Standard Flat Surface Card (1px Border)',
                      style: AppTypography.body,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  CFCard(
                    hasElevation: true,
                    child: Text(
                      'Elevated Card (Restrained Soft Shadow)',
                      style: AppTypography.body,
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 6: METRICS
            _buildSection(
              title: '6. Metrics',
              child: Row(
                children: [
                  Expanded(
                    child: CFMetricCard(
                      title: 'TOTAL REVENUE',
                      value: '\$48,900',
                      trend: '+14.2%',
                      icon: PhosphorIcons.currencyDollar(PhosphorIconsStyle.bold),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: CFMetricCard(
                      title: 'LOST DEALS',
                      value: '3',
                      trend: '-2.1%',
                      isTrendPositive: false,
                      icon: PhosphorIcons.xCircle(PhosphorIconsStyle.bold),
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 7: STATUS
            _buildSection(
              title: '7. Status',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: const [
                  CFStatusBadge(label: 'Primary', type: CFStatusType.primary),
                  CFStatusBadge(label: 'Success', type: CFStatusType.success),
                  CFStatusBadge(label: 'Warning', type: CFStatusType.warning),
                  CFStatusBadge(label: 'Error', type: CFStatusType.error),
                  CFStatusBadge(label: 'Info', type: CFStatusType.info),
                  CFStatusBadge(label: 'Neutral', type: CFStatusType.neutral),
                ],
              ),
            ),

            // SECTION 8: ICONS
            _buildSection(
              title: '8. Icons',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(PhosphorIcons.squaresFour(PhosphorIconsStyle.regular), size: 24, color: AppColors.primary),
                  Icon(PhosphorIcons.sparkle(PhosphorIconsStyle.bold), size: 24, color: AppColors.primary),
                  Icon(PhosphorIcons.user(PhosphorIconsStyle.regular), size: 24, color: AppColors.textSecondary),
                  Icon(PhosphorIcons.shieldCheck(PhosphorIconsStyle.regular), size: 24, color: AppColors.success),
                  Icon(PhosphorIcons.bell(PhosphorIconsStyle.regular), size: 24, color: AppColors.warning),
                ],
              ),
            ),

            // SECTION 9: FEEDBACK STATES
            _buildSection(
              title: '9. Feedback States',
              child: Column(
                children: [
                  CFCard(
                    child: CFEmptyState(
                      title: 'No Contacts Found',
                      description: 'Search results returned empty. Try adjusting your filters.',
                      actionLabel: 'Reset Filters',
                      onAction: () {},
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.errorContainer,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(PhosphorIcons.warningCircle(PhosphorIconsStyle.bold), color: AppColors.onError, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Error: Connection interrupted while syncing pipeline.',
                            style: AppTypography.bodySmall.copyWith(color: AppColors.onError),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.successContainer,
                      borderRadius: AppRadius.borderMd,
                      border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(PhosphorIcons.checkCircle(PhosphorIconsStyle.bold), color: AppColors.onSuccess, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Success: Lead status updated to CONTACTED.',
                            style: AppTypography.bodySmall.copyWith(color: AppColors.onSuccess),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SECTION 10: HIMI COMPONENTS
            _buildSection(
              title: '10. HIMI Components',
              child: Column(
                children: [
                  const CFHimiUserBubble(
                    message: 'Show top 3 priority leads.',
                    timestamp: '11:05 AM',
                  ),
                  const CFHimiAssistantBubble(
                    message: '1. ABC Dental\n2. Apex Health\n3. Metro Dental',
                    toolUsed: 'LeadPrioritizer',
                    timestamp: '11:05 AM',
                  ),
                  const CFHimiThinkingIndicator(),
                  CFControlledActionCard(
                    entityName: 'ABC Dental',
                    actionDescription: 'Status: NEW → CONTACTED',
                    onConfirm: () {},
                    onCancel: () {},
                  ),
                ],
              ),
            ),

            // SECTION 11: NAVIGATION
            _buildSection(
              title: '11. Navigation',
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.borderMd,
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navPreviewItem('Dashboard', PhosphorIcons.squaresFour(PhosphorIconsStyle.bold), true),
                    _navPreviewItem('HIMI AI', PhosphorIcons.sparkle(PhosphorIconsStyle.regular), false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CFSectionHeader(title: title),
        const SizedBox(height: AppSpacing.sm),
        CFCard(child: child),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  Widget _colorChip(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppRadius.borderSm,
            border: Border.all(color: AppColors.border),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.caption),
      ],
    );
  }

  Widget _navPreviewItem(String label, IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? AppColors.primary : AppColors.textSecondary, size: 20),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
