import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';

/// Container for sections with consistent padding and constraints
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool fullWidth;
  final bool animateEntrance;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.fullWidth = false,
    this.animateEntrance = true,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      width: double.infinity,
      color: backgroundColor ?? DesignSystem.backgroundColor,
      child: TweenAnimationBuilder<double>(
        duration: animateEntrance ? DesignSystem.animationMedium : Duration.zero,
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          );
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: fullWidth ? double.infinity : responsive.maxContentWidth,
          ),
          child: Padding(
            padding: padding ?? responsive.sectionPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}