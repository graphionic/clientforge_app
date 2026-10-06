import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import 'cf_button.dart';
import 'cf_card.dart';
import 'cf_status_badge.dart';

/// User chat bubble for HIMI.
class CFHimiUserBubble extends StatelessWidget {
  final String message;
  final String? timestamp;

  const CFHimiUserBubble({
    super.key,
    required this.message,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: const BoxDecoration(
          color: AppColors.himiUserBubble,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.lg),
            topRight: Radius.circular(AppRadius.lg),
            bottomLeft: Radius.circular(AppRadius.lg),
            bottomRight: Radius.circular(AppRadius.xs),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: AppTypography.body.copyWith(
                color: AppColors.himiUserText,
              ),
            ),
            if (timestamp != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                timestamp!,
                style: AppTypography.caption.copyWith(
                  color: AppColors.himiUserText.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Assistant response chat bubble for HIMI.
class CFHimiAssistantBubble extends StatelessWidget {
  final String message;
  final String? toolUsed;
  final String? timestamp;

  const CFHimiAssistantBubble({
    super.key,
    required this.message,
    this.toolUsed,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.82,
        ),
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.himiAssistantBubble,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppRadius.lg),
            topRight: Radius.circular(AppRadius.lg),
            bottomLeft: Radius.circular(AppRadius.xs),
            bottomRight: Radius.circular(AppRadius.lg),
          ),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      PhosphorIcons.sparkle(PhosphorIconsStyle.bold),
                      size: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.xs + 2),
                Text(
                  'HIMI',
                  style: AppTypography.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                if (toolUsed != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  CFStatusBadge(
                    label: toolUsed!,
                    type: CFStatusType.primary,
                    icon: PhosphorIcons.wrench(PhosphorIconsStyle.bold),
                  ),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: AppTypography.body.copyWith(
                color: AppColors.himiAssistantText,
              ),
            ),
            if (timestamp != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                timestamp!,
                style: AppTypography.caption,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Thinking animation placeholder for HIMI.
class CFHimiThinkingIndicator extends StatelessWidget {
  const CFHimiThinkingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.himiAssistantBubble,
          borderRadius: AppRadius.borderLg,
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'HIMI is thinking...',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Controlled Action Confirmation Card sample.
class CFControlledActionCard extends StatelessWidget {
  final String entityName;
  final String actionDescription;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const CFControlledActionCard({
    super.key,
    required this.entityName,
    required this.actionDescription,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return CFCard(
      backgroundColor: AppColors.surface,
      border: Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.warningContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  PhosphorIcons.shieldCheck(PhosphorIconsStyle.bold),
                  size: 16,
                  color: AppColors.onWarning,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Action Approval Required',
                      style: AppTypography.label.copyWith(
                        color: AppColors.onWarning,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      entityName,
                      style: AppTypography.title.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: AppRadius.borderSm,
            ),
            child: Row(
              children: [
                Icon(
                  PhosphorIcons.arrowsLeftRight(PhosphorIconsStyle.bold),
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    actionDescription,
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: CFSecondaryButton(
                  label: 'Cancel',
                  onPressed: onCancel,
                  fullWidth: false,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: CFPrimaryButton(
                  label: 'Confirm',
                  onPressed: onConfirm,
                  fullWidth: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
