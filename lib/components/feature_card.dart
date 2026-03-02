import 'package:flutter/material.dart';
import '../design_system/design_system.dart';

/// Premium feature card with hover animations
class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final String? semanticLabel;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
    this.semanticLabel,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel ?? '${widget.title} feature: ${widget.description}',
      button: widget.onTap != null,
      enabled: widget.onTap != null,
      child: ExcludeSemantics(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: DesignSystem.animationMedium,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? DesignSystem.surfaceColor,
                borderRadius: BorderRadius.circular(DesignSystem.borderRadiusLg),
                border: Border.all(
                  color: DesignSystem.borderColor,
                  width: 1,
                ),
                boxShadow: _isHovered ? DesignSystem.shadowLg : DesignSystem.shadowMd,
              ),
              child: Padding(
                padding: const EdgeInsets.all(DesignSystem.spacingXl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: (widget.iconColor ?? DesignSystem.accentColor)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(DesignSystem.borderRadiusMd),
                      ),
                      child: Icon(
                        widget.icon,
                        size: 28,
                        color: widget.iconColor ?? DesignSystem.accentColor,
                      ),
                    ),
                    
                    SizedBox(height: DesignSystem.spacingLg),
                    
                    // Title
                    Text(
                      widget.title,
                      style: DesignSystem.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    SizedBox(height: DesignSystem.spacingSm),
                    
                    // Description
                    Text(
                      widget.description,
                      style: DesignSystem.bodyMedium.copyWith(
                        color: DesignSystem.textSecondary,
                      ),
                    ),
                    
                    if (widget.onTap != null) ...[
                      SizedBox(height: DesignSystem.spacingLg),
                      
                      // Learn more link
                      Row(
                        children: [
                          Text(
                            'Learn more',
                            style: DesignSystem.labelMedium.copyWith(
                              color: DesignSystem.accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: DesignSystem.spacingXs),
                          AnimatedContainer(
                            duration: DesignSystem.animationFast,
                            width: _isHovered ? 16 : 12,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: DesignSystem.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}