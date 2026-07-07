import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;
  final Color? color;
  final double size;

  const SocialIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.onPressed,
    this.color, // Ignored for monochrome
    this.size = 20,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip ?? '',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isHovered
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: _isHovered
                    ? Colors.white.withValues(alpha: 0.2)
                    : AppColors.glassBorder,
                width: 1,
              ),
            ),
            child: Icon(
              widget.icon,
              size: widget.size,
              color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
