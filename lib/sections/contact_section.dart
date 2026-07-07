import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_section.dart';
import '../widgets/social_icon_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.contentPadding(context),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 120),
            child: Center(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: AppTheme.maxContentWidth),
                child: AnimatedSection(
                  child: Column(
                    children: [
                      _buildSectionHeader(),
                      const SizedBox(height: 24),
                      Text(
                        'Yeni bir proje, iş birliği veya sadece merhaba demek için\nbana ulaşabilirsiniz.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 16 : 18,
                          height: 1.8,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 48),
                      _EmailButton(
                        onTap: () =>
                            _launchUrl('mailto:contact@senasahin.dev'),
                      ),
                      const SizedBox(height: 48),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          SocialIconButton(
                            icon: Icons.code_rounded,
                            tooltip: 'GitHub',
                            onPressed: () =>
                                _launchUrl('https://github.com'),
                          ),
                          SocialIconButton(
                            icon: Icons.work_outline_rounded,
                            tooltip: 'LinkedIn',
                            onPressed: () =>
                                _launchUrl('https://linkedin.com'),
                          ),
                          SocialIconButton(
                            icon: Icons.alternate_email_rounded,
                            tooltip: 'Twitter',
                            onPressed: () =>
                                _launchUrl('https://twitter.com'),
                          ),
                          SocialIconButton(
                            icon: Icons.email_outlined,
                            tooltip: 'E-posta',
                            onPressed: () =>
                                _launchUrl('mailto:contact@senasahin.dev'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Footer - Minimalist
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.glassBorder, width: 1),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Sena Şahin ile tasarlandı.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '© 2026 Tüm hakları saklıdır.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          'İLETİŞİM',
          style: GoogleFonts.firaCode(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Birlikte Çalışalım',
          textAlign: TextAlign.center,
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
}

class _EmailButton extends StatefulWidget {
  final VoidCallback? onTap;

  const _EmailButton({this.onTap});

  @override
  State<_EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<_EmailButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.textPrimary : AppColors.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? AppColors.textPrimary
                  : AppColors.glassBorder,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.send_rounded,
                size: 16,
                color: _isHovered
                    ? AppColors.background
                    : AppColors.textPrimary,
              ),
              const SizedBox(width: 12),
              Text(
                'E-posta Gönder',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _isHovered
                      ? AppColors.background
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
