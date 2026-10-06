import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/config/app_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/cf_button.dart';
import '../../../shared/widgets/cf_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'agent@clientforge.io');
  final _passwordController = TextEditingController(text: '••••••••••••');
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _isLoading = false);
      context.go('/app/dashboard');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xl),
                // Minimal Sophisticated Brand Mark
                Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: AppRadius.borderLg,
                      border: Border.all(color: AppColors.primarySubtle, width: 1.2),
                    ),
                    child: Icon(
                      PhosphorIcons.squaresFour(PhosphorIconsStyle.bold),
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ).animate().fadeIn(duration: 350.ms).slideY(begin: -0.15, end: 0),
                const SizedBox(height: AppSpacing.md),
                Text(
                  AppConfig.appName,
                  style: AppTypography.display.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 80.ms, duration: 350.ms),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  AppConfig.tagline,
                  style: AppTypography.bodySmall,
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 140.ms, duration: 350.ms),
                const SizedBox(height: AppSpacing.xxl),

                // Form Container Card
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppRadius.borderLg,
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CFTextField(
                        label: 'Work Email',
                        hintText: 'name@company.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          PhosphorIcons.envelopeSimple(PhosphorIconsStyle.regular),
                          size: 18,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      CFTextField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        controller: _passwordController,
                        obscureText: true,
                        prefixIcon: Icon(
                          PhosphorIcons.lockKey(PhosphorIconsStyle.regular),
                          size: 18,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      CFPrimaryButton(
                        label: 'Sign In',
                        isLoading: _isLoading,
                        onPressed: _handleLogin,
                        icon: PhosphorIcons.arrowRight(PhosphorIconsStyle.bold),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 180.ms, duration: 350.ms).slideY(begin: 0.08, end: 0),
                const SizedBox(height: AppSpacing.xxl),

                // Footer Access Note
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.shieldCheck(PhosphorIconsStyle.bold),
                      size: 14,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      AppConfig.devModeNotice,
                      style: AppTypography.caption,
                    ),
                  ],
                ).animate().fadeIn(delay: 240.ms, duration: 350.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
