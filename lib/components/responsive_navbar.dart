import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

/// Responsive navigation bar with mobile drawer
class ResponsiveNavbar extends StatefulWidget {
  final String logoText;
  final List<NavItem> navItems;
  final String? primaryButtonText;
  final VoidCallback? primaryButtonOnPressed;
  final String? secondaryButtonText;
  final VoidCallback? secondaryButtonOnPressed;
  final Color backgroundColor;
  final bool showShadow;

  const ResponsiveNavbar({
    super.key,
    required this.logoText,
    required this.navItems,
    this.primaryButtonText,
    this.primaryButtonOnPressed,
    this.secondaryButtonText,
    this.secondaryButtonOnPressed,
    this.backgroundColor = Colors.white,
    this.showShadow = true,
  });

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.showShadow ? DesignSystem.shadowSm : [],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.responsivePadding.horizontal,
          vertical: DesignSystem.spacingLg,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.maxContentWidth,
          ),
          child: responsive.isMobile
              ? _buildMobileNavbar(context)
              : _buildDesktopNavbar(context),
        ),
      ),
    );
  }

  Widget _buildMobileNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        Text(
          widget.logoText,
          style: DesignSystem.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
            color: DesignSystem.primaryColor,
          ),
        ),
        
        // Menu button
        IconButton(
          onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          icon: const Icon(Icons.menu),
          color: DesignSystem.textPrimary,
        ),
      ],
    );
  }

  Widget _buildDesktopNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        Text(
          widget.logoText,
          style: DesignSystem.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
            color: DesignSystem.primaryColor,
          ),
        ),
        
        // Navigation items
        Row(
          children: [
            for (int i = 0; i < widget.navItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spacingMd),
                child: _NavItemButton(
                  item: widget.navItems[i],
                  isSelected: i == _selectedIndex,
                  onPressed: () {
                    setState(() => _selectedIndex = i);
                    widget.navItems[i].onPressed();
                  },
                ),
              ),
          ],
        ),
        
        // Buttons
        Row(
          children: [
            if (widget.secondaryButtonText != null && widget.secondaryButtonOnPressed != null)
              Padding(
                padding: const EdgeInsets.only(right: DesignSystem.spacingMd),
                child: SecondaryButton(
                  text: widget.secondaryButtonText!,
                  onPressed: widget.secondaryButtonOnPressed!,
                  semanticLabel: 'Navigate to ${widget.secondaryButtonText}',
                ),
              ),
            if (widget.primaryButtonText != null && widget.primaryButtonOnPressed != null)
              PrimaryButton(
                text: widget.primaryButtonText!,
                onPressed: widget.primaryButtonOnPressed!,
                semanticLabel: 'Get started with ${widget.primaryButtonText}',
              ),
          ],
        ),
      ],
    );
  }
}

/// Navigation item model
class NavItem {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const NavItem({
    required this.label,
    required this.onPressed,
    this.icon,
  });
}

/// Navigation item button with hover effects
class _NavItemButton extends StatefulWidget {
  final NavItem item;
  final bool isSelected;
  final VoidCallback onPressed;

  const _NavItemButton({
    required this.item,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<_NavItemButton> createState() => __NavItemButtonState();
}

class __NavItemButtonState extends State<_NavItemButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.item.label,
      button: true,
      child: ExcludeSemantics(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: TextButton(
            onPressed: widget.onPressed,
            style: TextButton.styleFrom(
              foregroundColor: DesignSystem.textPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spacingMd,
                vertical: DesignSystem.spacingSm,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.item.label,
                  style: DesignSystem.titleMedium.copyWith(
                    fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: widget.isSelected
                        ? DesignSystem.primaryColor
                        : DesignSystem.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: DesignSystem.animationFast,
                  width: _isHovered || widget.isSelected ? 24 : 0,
                  height: 2,
                  decoration: BoxDecoration(
                    color: DesignSystem.primaryColor,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}