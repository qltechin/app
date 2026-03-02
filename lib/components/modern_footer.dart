import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';

/// Modern footer with multiple columns and social links
class ModernFooter extends StatelessWidget {
  final String logoText;
  final String description;
  final List<FooterColumn> columns;
  final List<SocialLink> socialLinks;
  final String copyrightText;

  const ModernFooter({
    super.key,
    required this.logoText,
    required this.description,
    required this.columns,
    required this.socialLinks,
    required this.copyrightText,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      color: DesignSystem.secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.responsivePadding.horizontal,
          vertical: DesignSystem.spacingXxxl,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.maxContentWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main footer content
              responsive.isMobile
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(),
              
              const SizedBox(height: DesignSystem.spacingXxxl),
              
              // Divider
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.1),
              ),
              
              const SizedBox(height: DesignSystem.spacingXl),
              
              // Bottom row
              responsive.isMobile
                  ? _buildMobileBottomRow()
                  : _buildDesktopBottomRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              logoText,
              style: DesignSystem.headlineSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: DesignSystem.spacingMd),
            SizedBox(
              width: 300,
              child: Text(
                description,
                style: DesignSystem.bodyMedium.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: DesignSystem.spacingXl),
        
        // Columns
        for (final column in columns)
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spacingXl),
            child: _FooterColumnWidget(column: column),
          ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and description
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logoText,
                style: DesignSystem.headlineSmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: DesignSystem.spacingMd),
              SizedBox(
                width: 300,
                child: Text(
                  description,
                  style: DesignSystem.bodyMedium.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Columns
        for (final column in columns)
          Expanded(
            child: _FooterColumnWidget(column: column),
          ),
      ],
    );
  }

  Widget _buildMobileBottomRow() {
    return Column(
      children: [
        // Social links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialLinks
              .map((link) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spacingSm),
                    child: _SocialLinkButton(link: link),
                  ))
              .toList(),
        ),
        
        const SizedBox(height: DesignSystem.spacingLg),
        
        // Copyright
        Text(
          copyrightText,
          textAlign: TextAlign.center,
          style: DesignSystem.bodySmall.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Copyright
        Text(
          copyrightText,
          style: DesignSystem.bodySmall.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        
        // Social links
        Row(
          children: socialLinks
              .map((link) => Padding(
                    padding: const EdgeInsets.only(left: DesignSystem.spacingMd),
                    child: _SocialLinkButton(link: link),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

/// Footer column model
class FooterColumn {
  final String title;
  final List<FooterLink> links;

  const FooterColumn({
    required this.title,
    required this.links,
  });
}

/// Footer link model
class FooterLink {
  final String label;
  final VoidCallback onPressed;

  const FooterLink({
    required this.label,
    required this.onPressed,
  });
}

/// Social link model
class SocialLink {
  final IconData icon;
  final VoidCallback onPressed;
  final String label;

  const SocialLink({
    required this.icon,
    required this.onPressed,
    required this.label,
  });
}

/// Footer column widget
class _FooterColumnWidget extends StatelessWidget {
  final FooterColumn column;

  const _FooterColumnWidget({required this.column});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          column.title,
          style: DesignSystem.titleSmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: DesignSystem.spacingLg),
        
        for (final link in column.links)
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spacingSm),
            child: _FooterLinkButton(link: link),
          ),
      ],
    );
  }
}

/// Footer link button
class _FooterLinkButton extends StatefulWidget {
  final FooterLink link;

  const _FooterLinkButton({required this.link});

  @override
  State<_FooterLinkButton> createState() => __FooterLinkButtonState();
}

class __FooterLinkButtonState extends State<_FooterLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.link.label,
      button: true,
      child: ExcludeSemantics(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.link.onPressed,
            child: AnimatedContainer(
              duration: DesignSystem.animationFast,
              child: Text(
                widget.link.label,
                style: DesignSystem.bodyMedium.copyWith(
                  color: _isHovered
                      ? Colors.white
                      : Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Social link button
class _SocialLinkButton extends StatefulWidget {
  final SocialLink link;

  const _SocialLinkButton({required this.link});

  @override
  State<_SocialLinkButton> createState() => __SocialLinkButtonState();
}

class __SocialLinkButtonState extends State<_SocialLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.link.label,
      button: true,
      child: ExcludeSemantics(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.link.onPressed,
            child: AnimatedContainer(
              duration: DesignSystem.animationFast,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _isHovered
                    ? Colors.white.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(DesignSystem.borderRadiusMd),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                widget.link.icon,
                size: 20,
                color: Colors.white.withOpacity(_isHovered ? 1 : 0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}