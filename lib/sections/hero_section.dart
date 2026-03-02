import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

/// Premium hero section with modern design
class HeroSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final String primaryButtonText;
  final VoidCallback primaryButtonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final Widget? backgroundImage;
  final bool showBackgroundOverlay;

  const HeroSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    required this.primaryButtonText,
    required this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.backgroundImage,
    this.showBackgroundOverlay = true,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DesignSystem.primaryColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: (backgroundImage as Image).image,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (showBackgroundOverlay && backgroundImage != null)
            Container(
              color: DesignSystem.primaryColor.withOpacity(0.85),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.responsivePadding.horizontal,
              vertical: responsive.isMobile ? DesignSystem.spacingXxxl : DesignSystem.spacingXxxxl,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: responsive.maxContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subtitle
                  TweenAnimationBuilder<double>(
                    duration: DesignSystem.animationMedium,
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      subtitle,
                      style: DesignSystem.labelLarge.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: DesignSystem.spacingMd),
                  
                  // Title
                  TweenAnimationBuilder<double>(
                    duration: DesignSystem.animationMedium,
                    delay: const Duration(milliseconds: 100),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 30 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      title,
                      style: responsive.isMobile
                          ? DesignSystem.displaySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            )
                          : DesignSystem.displayMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                    ),
                  ),
                  
                  if (description != null) ...[
                    SizedBox(height: DesignSystem.spacingLg),
                    
                    // Description
                    TweenAnimationBuilder<double>(
                      duration: DesignSystem.animationMedium,
                      delay: const Duration(milliseconds: 200),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 40 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: SizedBox(
                        width: responsive.isMobile ? double.infinity : 600,
                        child: Text(
                          description!,
                          style: DesignSystem.bodyLarge.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: responsive.isMobile ? 16 : 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                  
                  SizedBox(height: DesignSystem.spacingXl),
                  
                  // Buttons
                  TweenAnimationBuilder<double>(
                    duration: DesignSystem.animationMedium,
                    delay: const Duration(milliseconds: 300),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 50 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Wrap(
                      spacing: DesignSystem.spacingMd,
                      runSpacing: DesignSystem.spacingMd,
                      children: [
                        PrimaryButton(
                          text: primaryButtonText,
                          onPressed: primaryButtonOnPressed,
                          semanticLabel: 'Get started with $primaryButtonText',
                        ),
                        if (secondaryButtonText != null && secondaryButtonOnPressed != null)
                          SecondaryButton(
                            text: secondaryButtonText!,
                            onPressed: secondaryButtonOnPressed!,
                            semanticLabel: 'Learn more about $secondaryButtonText',
                          ),
                      ],
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