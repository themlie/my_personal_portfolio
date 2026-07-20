import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_section.dart';
import '../widgets/glass_card.dart';
import '../widgets/skill_chip.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final List<_ProjectData> _projects = [
    _ProjectData(
      title: 'Network Traffic Dashboard',
      subtitle: 'Ağ Trafiği ve Zafiyet Analizi',
      description:
          'FastAPI ve asenkron TCP port tarayıcı ile geliştirilmiş siber güvenlik arayüzü. Canlı trafik izleme, CVE sorgulama ve bağlantı analizlerini içerir.',
      technologies: ['Python', 'FastAPI', 'JavaScript', 'SQLite'],
      icon: Icons.network_check_rounded,
      githubUrl: 'https://github.com/themlie/Network_Traffic_Dashboard',
    ),
    _ProjectData(
      title: 'Stellar Escrow Marketplace',
      subtitle: 'Blockchain Tabanlı Pazar Yeri',
      description:
          'Stellar ağı üzerinde çalışan, güvenli alışveriş sağlayan akıllı kontrat destekli bir emanet (escrow) pazar yeri uygulaması.',
      technologies: ['TypeScript', 'Stellar', 'Smart Contracts', 'Web3'],
      icon: Icons.currency_bitcoin_rounded,
      githubUrl: 'https://github.com/themlie/stellar-escrow-marketplace',
    ),
    _ProjectData(
      title: 'Tolga Topalahmetoğlu Portfolyo',
      subtitle: 'Kişisel Web Sitesi',
      description:
          'Modern web teknolojileri kullanılarak geliştirilmiş, responsive ve şık bir kişisel portfolyo sitesi.',
      technologies: ['HTML', 'CSS', 'JavaScript'],
      icon: Icons.web_rounded,
      liveUrl: 'https://www.digitolmedia.com/',
    ),
  ];

  static final List<_CertificateData> _certificates = [
    _CertificateData(
      title: 'Siber Vatan 2026',
      description: 'Siber Vatan siber güvenlik programı katılım ve başarı sertifikası.',
      imageUrl: 'assets/certificates/cert3.png',
    ),
    _CertificateData(
      title: 'Cyber First 2026',
      description: 'Cyber First siber güvenlik eğitimi sertifikası.',
      imageUrl: 'assets/certificates/cert6.png',
    ),
    _CertificateData(
      title: 'Network Technician',
      description: 'Ağ teknisyenliği kariyer yolu başarı sertifikası.',
      imageUrl: 'assets/certificates/cert4.png',
    ),
    _CertificateData(
      title: 'Frontend Developer (React)',
      description: 'Modern web geliştirme ve React uzmanlık sertifikası.',
      imageUrl: 'assets/certificates/cert5.png',
    ),
    _CertificateData(
      title: 'Software Engineer',
      description: 'Yazılım mühendisliği yetkinlik sertifikası.',
      imageUrl: 'assets/certificates/cert2.png',
    ),
    _CertificateData(
      title: 'SQL Advanced',
      description: 'İleri seviye veritabanı yönetimi ve SQL sertifikası.',
      imageUrl: 'assets/certificates/cert1.png',
    ),
  ];

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
                child: _buildProjectGrid(isMobile),
              ),
              const SizedBox(height: 100),
              AnimatedSection(
                delay: const Duration(milliseconds: 400),
                child: _buildCertificates(isMobile),
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
          'PROJELER & SERTİFİKALAR',
          style: GoogleFonts.firaCode(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Neler Yaptım?',
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

  Widget _buildProjectGrid(bool isMobile) {
    if (isMobile) {
      return Column(
        children: _projects.map((p) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _ProjectCard(data: p),
          );
        }).toList(),
      );
    }

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: _projects.map((p) {
        return SizedBox(
          width: 310,
          child: _ProjectCard(data: p),
        );
      }).toList(),
    );
  }

  Widget _buildCertificates(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sertifikalar',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),
        if (isMobile)
          Column(
            children: _certificates.map((c) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _CertificateCard(data: c),
              );
            }).toList(),
          )
        else
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: _certificates.map((c) {
              return SizedBox(
                width: 310,
                child: _CertificateCard(data: c),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _ProjectData {
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String? githubUrl;
  final String? liveUrl;

  const _ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    required this.icon,
    this.githubUrl,
    this.liveUrl,
  });
}

class _CertificateData {
  final String title;
  final String description;
  final String imageUrl;

  const _CertificateData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class _ProjectCard extends StatelessWidget {
  final _ProjectData data;

  const _ProjectCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(data.icon, size: 24, color: AppColors.textPrimary),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      data.subtitle,
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
          const SizedBox(height: 24),
          Text(
            data.description,
            style: GoogleFonts.inter(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: data.technologies
                .map((tech) => SkillChip(label: tech))
                .toList(),
          ),
          if (data.githubUrl != null || data.liveUrl != null) ...[
            const SizedBox(height: 24),
            const Divider(color: AppColors.glassBorder),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                if (data.githubUrl != null)
                  _ProjectLinkButton(
                    url: data.githubUrl!,
                    title: 'Kaynak Kod',
                    iconData: Icons.code_rounded,
                  ),
                if (data.liveUrl != null)
                  _ProjectLinkButton(
                    url: data.liveUrl!,
                    title: 'Siteye Git',
                    iconData: Icons.language_rounded,
                  ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class _ProjectLinkButton extends StatefulWidget {
  final String url;
  final String title;
  final IconData iconData;

  const _ProjectLinkButton({
    required this.url,
    required this.title,
    required this.iconData,
  });

  @override
  State<_ProjectLinkButton> createState() => _ProjectLinkButtonState();
}

class _ProjectLinkButtonState extends State<_ProjectLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.inter(
            fontSize: 13,
            color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.iconData,
                size: 16,
                color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(widget.title),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: _isHovered ? AppColors.textPrimary : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertificateCard extends StatelessWidget {
  final _CertificateData data;

  const _CertificateCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.glassBorder),
              image: DecorationImage(
                image: AssetImage(data.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
