import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactTap;

  const HeroSection({super.key, this.onProjectsTap, this.onContactTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic),
    );
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 40),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = AppTheme.isMobile(context);

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          // Minimalist Grid Background
          Positioned.fill(
            child: CustomPaint(
              painter: _MinimalGridPainter(),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.contentPadding(context),
              ),
              child: AnimatedBuilder(
                animation: _fadeController,
                builder: (context, _) {
                  return Transform.translate(
                    offset: _slideUp.value,
                    child: Opacity(
                      opacity: _fadeIn.value,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          // Main title
                          Text(
                            'Sena Şahin',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: isMobile ? 48 : 80,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              letterSpacing: -2,
                              height: 1.1,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Typing animation subtitle
                          SizedBox(
                            height: isMobile ? 30 : 40,
                            child: DefaultTextStyle(
                              style: GoogleFonts.inter(
                                fontSize: isMobile ? 18 : 24,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                              ),
                              child: Text(
                                'Bilgisayar Mühendisliği 4. Sınıf Öğrencisi',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          const SizedBox(height: 48),

                          // CTA Buttons - Minimal
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            alignment: WrapAlignment.center,
                            children: [
                              _CTAButton(
                                label: 'Projeleri İncele',
                                isPrimary: true,
                                onTap: widget.onProjectsTap,
                              ),
                              _CTAButton(
                                label: 'İletişim',
                                isPrimary: false,
                                onTap: widget.onContactTap,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CTAButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback? onTap;

  const _CTAButton({
    required this.label,
    required this.isPrimary,
    this.onTap,
  });

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (AppColors.textPrimary)
                : (_isHovered ? AppColors.surfaceLight : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            border: widget.isPrimary
                ? null
                : Border.all(color: AppColors.glassBorder),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: widget.isPrimary
                  ? AppColors.background // Black text on white button
                  : AppColors.textPrimary, // White text on transparent button
            ),
          ),
        ),
      ),
    );
  }
}

class _MinimalGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.glassBorder.withValues(alpha: 0.3)
      ..strokeWidth = 1;

    const spacing = 80.0;
    
    // Draw vertical lines with fading
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    
    // Draw horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
