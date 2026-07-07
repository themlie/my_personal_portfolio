import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static final List<_ExperienceData> _experiences = [
    _ExperienceData(
      company: 'Blue Network',
      role: 'Mobil Program Geliştiricisi',
      period: '2024 — Günümüz',
      description:
          'Flutter ile mobil uygulama geliştirme süreçlerinde aktif rol alarak, kullanıcı deneyimini ön planda tutan uygulamalar geliştirdim. Takım içi iş birliği ve Agile süreçlerle projeler yönettim.',
    ),
    _ExperienceData(
      company: 'Deepreo Siber Güvenlik',
      role: 'Siber Güvenlik Stajyeri',
      period: '2024',
      description:
          'Wi-Fi güvenliği ve sosyal mühendislik üzerine fiziksel CTF organizasyonları düzenledim. Penetrasyon testi süreçlerini deneyimledim ve güvenlik zafiyetlerinin tespiti konusunda pratik kazandım.',
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
              AnimatedSection(
                child: _buildSectionHeader(),
              ),
              const SizedBox(height: 60),

              ...List.generate(_experiences.length, (index) {
                return AnimatedSection(
                  delay: Duration(milliseconds: 200 + index * 100),
                  child: _TimelineItem(
                    data: _experiences[index],
                    isFirst: index == 0,
                    isLast: index == _experiences.length - 1,
                    isMobile: isMobile,
                  ),
                );
              }),
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
          'DENEYİMLER',
          style: GoogleFonts.firaCode(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Profesyonel Yolculuğum',
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

class _ExperienceData {
  final String company;
  final String role;
  final String period;
  final String description;

  const _ExperienceData({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
  });
}

class _TimelineItem extends StatefulWidget {
  final _ExperienceData data;
  final bool isFirst;
  final bool isLast;
  final bool isMobile;

  const _TimelineItem({
    required this.data,
    required this.isFirst,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline line and dot (Monochrome)
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  // Line above
                  if (!widget.isFirst)
                    Expanded(
                      child: Container(
                        width: 1,
                        color: AppColors.glassBorder,
                      ),
                    )
                  else
                    const Expanded(child: SizedBox()),

                  // Dot
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background,
                      border: Border.all(
                        color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                        width: 2,
                      ),
                    ),
                  ),

                  // Line below
                  if (!widget.isLast)
                    Expanded(
                      child: Container(
                        width: 1,
                        color: AppColors.glassBorder,
                      ),
                    )
                  else
                    const Expanded(child: SizedBox()),
                ],
              ),
            ),

            // Card - Minimal
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.period,
                      style: GoogleFonts.firaCode(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.data.role,
                      style: GoogleFonts.inter(
                        fontSize: widget.isMobile ? 18 : 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.data.company,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.data.description,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        height: 1.6,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
