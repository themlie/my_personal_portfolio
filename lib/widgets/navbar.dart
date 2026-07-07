import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class Navbar extends StatefulWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;
  final List<String> sectionLabels;

  const Navbar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.sectionLabels,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 50;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  void _scrollToSection(int index) {
    final key = widget.sectionKeys[index];
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
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: _isScrolled
            ? AppColors.background.withValues(alpha: 0.8) // More transparent for frosted glass effect
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? AppColors.glassBorder : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Minimal Logo
          Text(
            'sena.',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          if (isMobile)
            _MobileMenuButton(
              sectionLabels: widget.sectionLabels,
              onItemTap: _scrollToSection,
            )
          else
            Row(
              children: List.generate(widget.sectionLabels.length, (i) {
                return _NavItem(
                  label: widget.sectionLabels[i],
                  onTap: () => _scrollToSection(i),
                );
              }),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _isHovered
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final List<String> sectionLabels;
  final Function(int) onItemTap;

  const _MobileMenuButton({
    required this.sectionLabels,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
      color: AppColors.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.glassBorder),
      ),
      itemBuilder: (context) => List.generate(
        sectionLabels.length,
        (i) => PopupMenuItem<int>(
          value: i,
          child: Text(
            sectionLabels[i],
            style: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
          ),
        ),
      ),
      onSelected: (index) {
        onItemTap(index);
      },
    );
  }
}
