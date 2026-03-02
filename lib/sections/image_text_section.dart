import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';
import '../components/primary_button.dart';
import '../components/secondary_button.dart';

/// Section with image and text content side by side
class ImageTextSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget image;
  final bool imageOnLeft;
  final String? buttonText;
  final VoidCallback? buttonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final Color? backgroundColor;

  const ImageTextSection({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.imageOnLeft = true,
    this.buttonText,
    this.buttonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      color: backgroundColor ?? DesignSystem.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.responsivePadding.horizontal,
          vertical: responsive.sectionPadding.vertical,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.maxContentWidth,
          ),
          child: responsive.isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(DesignSystem.borderRadiusLg),
          child: image,
        ),
        
        SizedBox(height: DesignSystem.spacingXl),
        
        // Content
        _buildContent(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final children = [
      // Image
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(DesignSystem.borderRadiusXl),
          child: image,
        ),
      ),
      
      SizedBox(width: DesignSystem.spacingXxxl),
      
      // Content
      Expanded(
        child: _buildContent(context),
      ),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: imageOnLeft ? children : children.reversed.toList(),
    );
  }

  Widget _buildContent(BuildContext context) {
    final responsive = context.responsive;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Text(
          title,
          style: responsive.isMobile
              ? DesignSystem.headlineMedium.copyWith(
                  fontWeight: FontWeight.w800,
                )
              : DesignSystem.headlineLarge.copyWith(
                  fontWeight: FontWeight.w800,
                ),
        ),
        
        SizedBox(height: DesignSystem.spacingLg),
        
        // Description
        Text(
          description,
          style: DesignSystem.bodyLarge.copyWith(
            color: DesignSystem.textSecondary,
            fontSize: responsive.isMobile ? 16 : 18,
          ),
        ),
        
        if (buttonText != null && buttonOnPressed != null) ...[
          SizedBox(height: DesignSystem.spacingXl),
          
          // Buttons
          Wrap(
            spacing: DesignSystem.spacingMd,
            runSpacing: DesignSystem.spacingMd,
            children: [
              PrimaryButton(
                text: buttonText!,
                onPressed: buttonOnPressed!,
                semanticLabel: 'Learn more about $buttonText',
              ),
              if (secondaryButtonText != null && secondaryButtonOnPressed != null)
                SecondaryButton(
                  text: secondaryButtonText!,
                  onPressed: secondaryButtonOnPressed!,
                  semanticLabel: 'Explore $secondaryButtonText',
                ),
            ],
          ),
        ],
      ],
    );
  }
}