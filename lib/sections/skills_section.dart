import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_section.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.contentPadding(context),
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppTheme.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSection(child: _buildSectionHeader()),
              const SizedBox(height: 60),
              AnimatedSection(
                delay: const Duration(milliseconds: 200),
                child:
                    isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'YETKİNLİKLER',
          style: GoogleFonts.firaCode(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Teknik Becerilerim',
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _SkillCategory(
            title: 'Diller',
            icon: Icons.code_rounded,
            skills: const [
              _SkillItem('Rust', Icons.settings_rounded),
              _SkillItem('Go', Icons.speed_rounded),
              _SkillItem('C#', Icons.tag_rounded),
              _SkillItem('Python', Icons.data_object_rounded),
              _SkillItem('Dart', Icons.gps_fixed_rounded),
              _SkillItem('JavaScript', Icons.javascript_rounded),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _SkillCategory(
            title: 'Framework & Araçlar',
            icon: Icons.layers_rounded,
            skills: const [
              _SkillItem('Flutter', Icons.phone_android_rounded),
              _SkillItem('Node.js', Icons.dns_rounded),
              _SkillItem('Socket.io', Icons.power_rounded),
              _SkillItem('Soroban', Icons.view_in_ar_rounded),
              _SkillItem('Git', Icons.account_tree_rounded),
              _SkillItem('Linux', Icons.terminal_rounded),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _SkillCategory(
            title: 'Siber Güvenlik',
            icon: Icons.shield_rounded,
            skills: const [
              _SkillItem('Web Güvenliği', Icons.language_rounded),
              _SkillItem('Penetrasyon Testi', Icons.person_search_rounded),
              _SkillItem('CTF', Icons.flag_rounded),
              _SkillItem('OSINT', Icons.search_rounded),
              _SkillItem('Wi-Fi Güvenliği', Icons.wifi_lock_rounded),
              _SkillItem('Sosyal Müh.', Icons.people_rounded),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _SkillCategory(
          title: 'Diller',
          icon: Icons.code_rounded,
          skills: const [
            _SkillItem('Rust', Icons.settings_rounded),
            _SkillItem('Go', Icons.speed_rounded),
            _SkillItem('C#', Icons.tag_rounded),
            _SkillItem('Python', Icons.data_object_rounded),
            _SkillItem('Dart', Icons.gps_fixed_rounded),
            _SkillItem('JavaScript', Icons.javascript_rounded),
          ],
        ),
        const SizedBox(height: 24),
        _SkillCategory(
          title: 'Framework & Araçlar',
          icon: Icons.layers_rounded,
          skills: const [
            _SkillItem('Flutter', Icons.phone_android_rounded),
            _SkillItem('Node.js', Icons.dns_rounded),
            _SkillItem('Socket.io', Icons.power_rounded),
            _SkillItem('Soroban', Icons.view_in_ar_rounded),
            _SkillItem('Git', Icons.account_tree_rounded),
            _SkillItem('Linux', Icons.terminal_rounded),
          ],
        ),
        const SizedBox(height: 24),
        _SkillCategory(
          title: 'Siber Güvenlik',
          icon: Icons.shield_rounded,
          skills: const [
            _SkillItem('Web Güvenliği', Icons.language_rounded),
            _SkillItem('Penetrasyon Testi', Icons.person_search_rounded),
            _SkillItem('CTF', Icons.flag_rounded),
            _SkillItem('OSINT', Icons.search_rounded),
            _SkillItem('Wi-Fi Güvenliği', Icons.wifi_lock_rounded),
            _SkillItem('Sosyal Müh.', Icons.people_rounded),
          ],
        ),
      ],
    );
  }
}

class _SkillItem {
  final String name;
  final IconData icon;

  const _SkillItem(this.name, this.icon);
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_SkillItem> skills;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.textPrimary),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((s) => SkillChip(
                      label: s.name,
                      icon: s.icon,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
