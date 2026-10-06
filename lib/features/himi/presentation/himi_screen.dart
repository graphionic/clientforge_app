import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/cf_himi_bubbles.dart';

class HimiScreen extends StatelessWidget {
  const HimiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                PhosphorIcons.sparkle(PhosphorIconsStyle.bold),
                color: Colors.white,
                size: 14,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HIMI AI Assistant',
                  style: AppTypography.title.copyWith(fontSize: 16),
                ),
                Text(
                  'Your ClientForge AI operations assistant.',
                  style: AppTypography.caption,
                ),
              ],
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
      body: Column(
        children: [
          // Chat Messages Stream
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                const CFHimiUserBubble(
                  message: 'What are the top 3 high-priority leads in my pipeline today?',
                  timestamp: '10:42 AM',
                ),
                const CFHimiAssistantBubble(
                  message:
                      'Here are your top high-priority leads today:\n\n1. ABC Dental - Needs follow-up proposal\n2. Apex Health - Demo requested\n3. Metro Dental - Contract pending signature',
                  toolUsed: 'LeadPrioritizer',
                  timestamp: '10:42 AM',
                ),
                const CFHimiUserBubble(
                  message: 'Move ABC Dental to CONTACTED state.',
                  timestamp: '10:43 AM',
                ),
                CFControlledActionCard(
                  entityName: 'ABC Dental',
                  actionDescription: 'Status: NEW → CONTACTED',
                  onConfirm: () {},
                  onCancel: () {},
                ),
                const SizedBox(height: AppSpacing.md),
                const CFHimiThinkingIndicator(),
              ],
            ),
          ),

          // Message Input Bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(
                top: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceMuted,
                        borderRadius: AppRadius.borderPill,
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            PhosphorIcons.sparkle(PhosphorIconsStyle.regular),
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              'Ask HIMI anything about your CRM...',
                              style: AppTypography.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      PhosphorIcons.paperPlaneRight(PhosphorIconsStyle.bold),
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
