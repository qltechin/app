import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

/// Call-to-action section with strong visual hierarchy
class CTASection extends StatelessWidget {
  final String title;
  final String description;
  final String primaryButtonText;
  final VoidCallback primaryButtonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final Color backgroundColor;
  final Color textColor;
  final Widget? backgroundImage;

  const CTASection({
    super.key,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.backgroundColor = DesignSystem.primaryColor,
    this.textColor = Colors.white,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: (backgroundImage as Image).image,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (backgroundImage != null)
            Container(
              color: backgroundColor.withOpacity(0.9),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: responsive.isMobile
                        ? DesignSystem.headlineLarge.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w800,
                          )
                        : DesignSystem.displaySmall.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w800,
                          ),
                  ),
                  
                  SizedBox(height: DesignSystem.spacingLg),
                  
                  // Description
                  SizedBox(
                    width: responsive.isMobile ? double.infinity : 600,
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: DesignSystem.bodyLarge.copyWith(
                        color: textColor.withOpacity(0.9),
                        fontSize: responsive.isMobile ? 16 : 18,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: DesignSystem.spacingXl),
                  
                  // Buttons
                  Wrap(
                    spacing: DesignSystem.spacingMd,
                    runSpacing: DesignSystem.spacingMd,
                    alignment: WrapAlignment.center,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}