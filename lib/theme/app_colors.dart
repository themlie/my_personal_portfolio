import 'dart:ui';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF09090B); // Zinc 950
  static const Color surface = Color(0xFF18181B); // Zinc 900
  static const Color surfaceLight = Color(0xFF27272A); // Zinc 800
  static const Color card = Color(0xFF0F172A); // Slate 900

  // Glow / Brand
  static const Color brandGlow1 = Color(0xFF3B82F6); // Electric Blue
  static const Color brandGlow2 = Color(0xFF8B5CF6); // Purple

  // Accents (Monochrome)
  static const Color accentCyan = Color(0xFFFFFFFF); // White accent
  static const Color accentPurple = Color(0xFFE5E5E5); // Off-white accent
  static const Color accentBlue = Color(0xFFCCCCCC); // Light gray accent
  static const Color accentPink = Color(0xFF999999); // Medium gray accent
  
  // Minimalist brand accent (optional use)
  static const Color brandSubtle = Color(0xFF222222);

  // Text
  static const Color textPrimary = Color(0xFFEDEDED); // Vercel style white text
  static const Color textSecondary = Color(0xFFA1A1AA); // Zinc-400 equivalent
  static const Color textMuted = Color(0xFF71717A); // Zinc-500 equivalent

  // Glass/Borders
  static const Color glassBorder = Color(0xFF27272A); // Very subtle gray border
  static const Color glassBackground = Color(0x08FFFFFF); // Almost transparent
  static const Color glassHighlight = Color(0x12FFFFFF); // Slight hover

  // Status (Desaturated)
  static const Color success = Color(0xFF4ADE80);
  static const Color warning = Color(0xFFFACC15);
}
