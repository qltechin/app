import 'package:flutter/material.dart';
import '../design_system/design_system.dart';

/// Premium secondary button with hover animations
class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool fullWidth;
  final IconData? icon;
  final String? semanticLabel;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
    this.semanticLabel,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel ?? widget.text,
      button: true,
      enabled: !widget.isLoading,
      child: ExcludeSemantics(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: DesignSystem.animationFast,
            width: widget.fullWidth ? double.infinity : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DesignSystem.borderRadiusMd),
              color: Colors.transparent,
              border: Border.all(
                color: DesignSystem.primaryColor,
                width: 1.5,
              ),
              boxShadow: _isHovered ? DesignSystem.shadowSm : [],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isLoading ? null : widget.onPressed,
                borderRadius: BorderRadius.circular(DesignSystem.borderRadiusMd),
                splashColor: DesignSystem.primaryColor.withOpacity(0.1),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.spacingXl,
                    vertical: DesignSystem.spacingMd,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null && !widget.isLoading)
                        Padding(
                          padding: const EdgeInsets.only(right: DesignSystem.spacingSm),
                          child: Icon(
                            widget.icon,
                            size: 20,
                            color: DesignSystem.primaryColor,
                          ),
                        ),
                      if (widget.isLoading)
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(DesignSystem.primaryColor),
                          ),
                        ),
                      Text(
                        widget.text,
                        style: DesignSystem.labelLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: DesignSystem.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}