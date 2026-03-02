import 'package:flutter/material.dart';
import '../design_system/design_system.dart';

/// Premium primary button with hover animations
class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool fullWidth;
  final IconData? icon;
  final String? semanticLabel;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
    this.semanticLabel,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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
              color: DesignSystem.primaryColor,
              boxShadow: _isHovered ? DesignSystem.shadowLg : DesignSystem.shadowMd,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isLoading ? null : widget.onPressed,
                borderRadius: BorderRadius.circular(DesignSystem.borderRadiusMd),
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
                            color: Colors.white,
                          ),
                        ),
                      if (widget.isLoading)
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ),
                      Text(
                        widget.text,
                        style: DesignSystem.labelLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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