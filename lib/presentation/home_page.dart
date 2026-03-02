import 'package:flutter/material.dart';
import '../design_system/design_system.dart';
import '../design_system/responsive.dart';
import '../components/responsive_navbar.dart';
import '../components/modern_footer.dart';
import '../components/feature_card.dart';
import '../sections/hero_section.dart';
import '../sections/image_text_section.dart';
import '../sections/cta_section.dart';
import '../animations/scroll_animations.dart';

/// Premium home page with modern enterprise design
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _features = [
    'Enterprise Security',
    'Real-time Analytics',
    'Scalable Infrastructure',
    '24/7 Support',
    'Custom Integration',
    'Compliance Ready',
  ];

  final List<String> _featureDescriptions = [
    'Bank-level security with end-to-end encryption and zero-trust architecture',
    'Advanced analytics dashboard with real-time insights and predictive modeling',
    'Cloud-native infrastructure that scales seamlessly with your business needs',
    'Dedicated support team available around the clock for mission-critical operations',
    'Flexible API and integration options tailored to your existing workflows',
    'Industry-specific compliance frameworks including HIPAA, GDPR, and SOC2',
  ];

  final List<IconData> _featureIcons = [
    Icons.security,
    Icons.analytics,
    Icons.cloud,
    Icons.support_agent,
    Icons.integration_instructions,
    Icons.verified_user,
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Scaffold(
      backgroundColor: DesignSystem.backgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Navigation Bar
          SliverToBoxAdapter(
            child: ResponsiveNavbar(
              logoText: 'QLTech',
              navItems: [
                NavItem(label: 'Home', onPressed: _scrollToTop),
                NavItem(label: 'Features', onPressed: _scrollToFeatures),
                NavItem(label: 'Solutions', onPressed: () {}),
                NavItem(label: 'Pricing', onPressed: () {}),
                NavItem(label: 'Contact', onPressed: () {}),
              ],
              primaryButtonText: 'Get Started',
              primaryButtonOnPressed: () {},
              secondaryButtonText: 'Demo',
              secondaryButtonOnPressed: () {},
            ),
          ),
          
          // Hero Section
          SliverToBoxAdapter(
            child: HeroSection(
              title: 'Enterprise-Grade Solutions\nfor Modern Businesses',
              subtitle: 'PREMIUM PLATFORM',
              description: 'Transform your business operations with our cutting-edge technology platform. '
                  'Designed for scalability, security, and performance.',
              primaryButtonText: 'Start Free Trial',
              primaryButtonOnPressed: () {},
              secondaryButtonText: 'Schedule Demo',
              secondaryButtonOnPressed: () {},
            ),
          ),
          
          // Features Section
          SliverToBoxAdapter(
            child: Container(
              color: DesignSystem.surfaceColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.responsivePadding.horizontal,
                  vertical: responsive.sectionPadding.vertical,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: responsive.maxContentWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Section Header
                      ScrollAnimations.fadeOnScroll(
                        scrollController: _scrollController,
                        startOffset: 100,
                        endOffset: 300,
                        child: Column(
                          children: [
                            Text(
                              'Trusted by Industry Leaders',
                              style: DesignSystem.labelLarge.copyWith(
                                color: DesignSystem.accentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: DesignSystem.spacingMd),
                            Text(
                              'Comprehensive Enterprise Features',
                              style: responsive.isMobile
                                  ? DesignSystem.headlineMedium.copyWith(
                                      fontWeight: FontWeight.w800,
                                    )
                                  : DesignSystem.headlineLarge.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: DesignSystem.spacingLg),
                            SizedBox(
                              width: responsive.isMobile ? double.infinity : 600,
                              child: Text(
                                'Everything you need to power your business operations, '
                                'from security to scalability and beyond.',
                                style: DesignSystem.bodyLarge.copyWith(
                                  color: DesignSystem.textSecondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: DesignSystem.spacingXxxl),
                      
                      // Features Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: responsive.gridColumnCount,
                          crossAxisSpacing: DesignSystem.spacingLg,
                          mainAxisSpacing: DesignSystem.spacingLg,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: _features.length,
                        itemBuilder: (context, index) {
                          return ScrollAnimations.staggeredAnimation(
                            index: index,
                            child: FeatureCard(
                              icon: _featureIcons[index],
                              title: _features[index],
                              description: _featureDescriptions[index],
                              semanticLabel: '${_features[index]}: ${_featureDescriptions[index]}',
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Image + Text Section 1
          SliverToBoxAdapter(
            child: ImageTextSection(
              title: 'Advanced Analytics Platform',
              description: 'Gain deep insights into your business operations with our '
                  'powerful analytics platform. Real-time dashboards, predictive '
                  'modeling, and custom reporting tools help you make data-driven '
                  'decisions that drive growth and efficiency.',
              image: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: DesignSystem.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignSystem.borderRadiusXl),
                ),
                child: const Icon(
                  Icons.analytics_outlined,
                  size: 120,
                  color: DesignSystem.accentColor,
                ),
              ),
              imageOnLeft: true,
              buttonText: 'Explore Analytics',
              buttonOnPressed: () {},
              secondaryButtonText: 'View Case Studies',
              secondaryButtonOnPressed: () {},
            ),
          ),
          
          // Image + Text Section 2
          SliverToBoxAdapter(
            child: ImageTextSection(
              title: 'Enterprise Security Framework',
              description: 'Protect your sensitive data with our military-grade '
                  'security infrastructure. End-to-end encryption, zero-trust '
                  'architecture, and continuous monitoring ensure your business '
                  'stays secure and compliant with industry regulations.',
              image: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: DesignSystem.successColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(DesignSystem.borderRadiusXl),
                ),
                child: const Icon(
                  Icons.security_outlined,
                  size: 120,
                  color: DesignSystem.successColor,
                ),
              ),
              imageOnLeft: false,
              buttonText: 'Learn About Security',
              buttonOnPressed: () {},
              backgroundColor: DesignSystem.surfaceColor,
            ),
          ),
          
          // Statistics Section
          SliverToBoxAdapter(
            child: Container(
              color: DesignSystem.primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.responsivePadding.horizontal,
                  vertical: responsive.sectionPadding.vertical,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: responsive.maxContentWidth,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Trusted by Thousands of Enterprises',
                        style: DesignSystem.headlineMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: DesignSystem.spacingXl),
                      
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: responsive.isMobile ? 2 : 4,
                          crossAxisSpacing: DesignSystem.spacingLg,
                          mainAxisSpacing: DesignSystem.spacingLg,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final stats = [
                            {'value': '99.9%', 'label': 'Uptime'},
                            {'value': '10K+', 'label': 'Customers'},
                            {'value': '50+', 'label': 'Countries'},
                            {'value': '24/7', 'label': 'Support'},
                          ];
                          
                          return ScrollAnimations.staggeredAnimation(
                            index: index,
                            child: Container(
                              padding: const EdgeInsets.all(DesignSystem.spacingXl),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(DesignSystem.borderRadiusLg),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    stats[index]['value']!,
                                    style: DesignSystem.displaySmall.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: DesignSystem.spacingXs),
                                  Text(
                                    stats[index]['label']!,
                                    style: DesignSystem.bodyMedium.copyWith(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // CTA Section
          SliverToBoxAdapter(
            child: CTASection(
              title: 'Ready to Transform Your Business?',
              description: 'Join thousands of enterprises that trust our platform '
                  'for their mission-critical operations. Start your free trial today.',
              primaryButtonText: 'Start Free Trial',
              primaryButtonOnPressed: () {},
              secondaryButtonText: 'Contact Sales',
              secondaryButtonOnPressed: () {},
            ),
          ),
          
          // Footer
          SliverToBoxAdapter(
            child: ModernFooter(
              logoText: 'QLTech',
              description: 'Enterprise-grade solutions for modern businesses. '
                  'Transforming operations with cutting-edge technology.',
              columns: [
                FooterColumn(
                  title: 'Product',
                  links: [
                    FooterLink(label: 'Features', onPressed: () {}),
                    FooterLink(label: 'Solutions', onPressed: () {}),
                    FooterLink(label: 'Pricing', onPressed: () {}),
                    FooterLink(label: 'API', onPressed: () {}),
                  ],
                ),
                FooterColumn(
                  title: 'Company',
                  links: [
                    FooterLink(label: 'About', onPressed: () {}),
                    FooterLink(label: 'Careers', onPressed: () {}),
                    FooterLink(label: 'Press', onPressed: () {}),
                    FooterLink(label: 'Contact', onPressed: () {}),
                  ],
                ),
                FooterColumn(
                  title: 'Resources',
                  links: [
                    FooterLink(label: 'Documentation', onPressed: () {}),
                    FooterLink(label: 'Blog', onPressed: () {}),
                    FooterLink(label: 'Support', onPressed: () {}),
                    FooterLink(label: 'Status', onPressed: () {}),
                  ],
                ),
                FooterColumn(
                  title: 'Legal',
                  links: [
                    FooterLink(label: 'Privacy', onPressed: () {}),
                    FooterLink(label: 'Terms', onPressed: () {}),
                    FooterLink(label: 'Security', onPressed: () {}),
                    FooterLink(label: 'Compliance', onPressed: () {}),
                  ],
                ),
              ],
              socialLinks: [
                SocialLink(
                  icon: Icons.facebook,
                  onPressed: () {},
                  label: 'Facebook',
                ),
                SocialLink(
                  icon: Icons.twitter,
                  onPressed: () {},
                  label: 'Twitter',
                ),
                SocialLink(
                  icon: Icons.linkedin,
                  onPressed: () {},
                  label: 'LinkedIn',
                ),
                SocialLink(
                  icon: Icons.youtube_searched_for,
                  onPressed: () {},
                  label: 'YouTube',
                ),
              ],
              copyrightText: '© 2024 QLTech. All rights reserved.',
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToFeatures() {
    final position = 600.0; // Approximate position of features section
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}