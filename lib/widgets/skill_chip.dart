import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final IconData? icon;

  // Color parameter kept for compatibility but ignored for monochrome look
  const SkillChip({
    super.key,
    required this.label,
    this.icon,
    Color? color, 
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8), // Sharper, modern badge
          border: Border.all(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.3)
                : AppColors.glassBorder,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon, 
                size: 14, 
                color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary
              ),
              const SizedBox(width: 6),
            ],
            Text(
              widget.label,
              style: TextStyle(
                color: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: 13,
                fontWeight: _isHovered ? FontWeight.w500 : FontWeight.w400,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
