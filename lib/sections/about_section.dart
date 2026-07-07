import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_section.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
              // Section header - Minimal left-aligned
              AnimatedSection(
                child: _buildSectionHeader(),
              ),

              const SizedBox(height: 60),

              // Content
              AnimatedSection(
                delay: const Duration(milliseconds: 200),
                child: isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
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
          'HAKKIMDA',
          style: GoogleFonts.firaCode(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ben Kimim?',
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

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left — avatar / icon area
        Expanded(
          flex: 2,
          child: GlassCard(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                // Minimal Avatar
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.glassBorder, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Sena Şahin',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bilgisayar Mühendisliği Öğrencisi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 24),

                // Quick stats
                _buildStatRow(Icons.location_on_outlined, 'Türkiye'),
                const SizedBox(height: 12),
                _buildStatRow(Icons.school_outlined, 'Zonguldak BEÜ'),

              ],
            ),
          ),
        ),
        const SizedBox(width: 32),
        // Right — description
        Expanded(
          flex: 3,
          child: GlassCard(
            padding: const EdgeInsets.all(40),
            child: _buildDescription(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Avatar card
        GlassCard(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.glassBorder, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sena Şahin',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bilgisayar Mühendisliği',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GlassCard(
          padding: const EdgeInsets.all(24),
          child: _buildDescription(),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.code_rounded, color: AppColors.textSecondary, size: 18),
            const SizedBox(width: 8),
            Text(
              'about_me.txt',
              style: GoogleFonts.firaCode(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Zonguldak Bülent Ecevit Üniversitesi Bilgisayar Mühendisliği ve İstanbul Üniversitesi Web Tasarımı bölümlerinde eğitimime devam ediyorum. Akademik yolculuğumla eş zamanlı olarak, Blue Network\'te Mobil Geliştirici ve Deepreo\'da Siber Güvenlik Stajyeri olarak aktif sektörel tecrübe kazanıyorum.',
          style: GoogleFonts.inter(
            fontSize: 15,
            height: 1.7,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Flutter, Node.js ve Rust gibi teknolojilerle performanslı uygulamalar inşa ederken; diğer yandan sızma testleri ve web zafiyetleri (SQLi, IDOR vb.) üzerine yoğunlaşarak sistemlerin güvenliğini sağlamaya odaklanıyorum. Amacım hem yenilikçi projeler geliştirmek hem de bu yapıları en yüksek güvenlik standartlarıyla korumak.',
          style: GoogleFonts.inter(
            fontSize: 15,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 32),
        // Interest tags - Monokrom
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildInterestTag('Siber Güvenlik'),
            _buildInterestTag('Flutter'),
            _buildInterestTag('CTF'),
            _buildInterestTag('Low-Level'),
          ],
        ),
      ],
    );
  }

  Widget _buildInterestTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.glassBorder,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
