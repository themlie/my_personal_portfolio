import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';
import 'widgets/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const SenaPortfolioApp());
}

class SenaPortfolioApp extends StatelessWidget {
  const SenaPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sena Şahin — Mobil Geliştirici & Siber Güvenlik Araştırmacısı',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  List<GlobalKey> get _sectionKeys => [
        _aboutKey,
        _experienceKey,
        _projectsKey,
        _skillsKey,
        _contactKey,
      ];

  List<String> get _sectionLabels => [
        'Hakkımda',
        'Deneyimler',
        'Projeler',
        'Yetkinlikler',
        'İletişim',
      ];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top right blue glow
          Positioned(
            top: -200,
            right: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.brandGlow1.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          // Bottom left purple glow
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.brandGlow2.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onProjectsTap: () => _scrollToSection(_projectsKey),
                    onContactTap: () => _scrollToSection(_contactKey),
                  ),
                ),

                // About
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),

                // Experience
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),

                // Projects
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),

                // Skills
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),

                // Contact & Footer
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
              ],
            ),
          ),

          // Fixed Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
              sectionLabels: _sectionLabels,
            ),
          ),
        ],
      ),
    );
  }
}
