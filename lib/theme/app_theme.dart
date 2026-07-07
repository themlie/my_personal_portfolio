import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.textPrimary,
        secondary: AppColors.textSecondary,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      useMaterial3: true,
    );
  }

  // Gradients (Monochrome elegance)
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFAAAAAA)], // White to Silver
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient subtleGradient = LinearGradient(
    colors: [Color(0xFFE5E5E5), Color(0xFF888888)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient pinkPurpleGradient = LinearGradient( // Kept name for compatibility, changed colors
    colors: [Color(0xFFF4F4F5), Color(0xFF71717A)], // Zinc-100 to Zinc-500
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glass decoration helper - Minimalist version
  static BoxDecoration glassDecoration({
    double borderRadius = 16,
    double opacity = 0.02,
  }) {
    return BoxDecoration(
      color: Colors.white.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: AppColors.glassBorder, width: 1),
      // Removed heavy drop shadows for a flatter, cleaner look
    );
  }

  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static double contentPadding(BuildContext context) {
    if (isMobile(context)) return 24;
    if (isTablet(context)) return 48;
    return 80;
  }

  static double maxContentWidth = 1000; // Slightly narrower for better readability
}
