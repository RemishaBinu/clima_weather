import 'package:flutter/material.dart';

/// Centralized color palette for the Clima Weather app.
///
/// Designed to provide a premium, modern dark navy aesthetic
/// with vibrant blue and purple accents, soft glassmorphism borders,
/// and clear typography contrast.
abstract class AppColors {
  // Background Colors
  static const Color background = Color(0xFF0B101E); // Deep midnight navy
  static const Color backgroundSecondary = Color(0xFF10172A); // Slate deep blue

  // Surface & Card Colors (Glassmorphic surfaces)
  static const Color cardSurface = Color(
    0xFF1A233A,
  ); // Slightly raised navy surface
  static const Color cardSurfaceLight = Color(0xFF243052);
  static const Color glassBorder = Color(
    0x1FFFFFFF,
  ); // Subtle 12% translucent white outline

  // Primary Brand & Accent Colors
  static const Color primaryBlue = Color(0xFF38BDF8); // Bright sky blue
  static const Color accentIndigo = Color(0xFF6366F1); // Indigo
  static const Color accentPurple = Color(0xFF8B5CF6); // Purple accent
  static const Color accentCyan = Color(0xFF06B6D4); // Cyan accent

  // Weather Condition Highlights
  static const Color sunAmber = Color(0xFFFBBF24); // Warm sunny gold
  static const Color rainBlue = Color(0xFF60A5FA); // Rainy blue
  static const Color snowWhite = Color(0xFFE2E8F0); // Icy snow

  // Typography Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // High-contrast white
  static const Color textSecondary = Color(
    0xFF94A3B8,
  ); // Slate 400 for secondary info
  static const Color textTertiary = Color(
    0xFF64748B,
  ); // Slate 500 for captions / subtle labels

  // Signature Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4F46E5), // Vibrant Indigo
      Color(0xFF7C3AED), // Vibrant Violet
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF111827), // Top dark navy
      Color(0xFF070B14), // Bottom midnight black-navy
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x2638BDF8), // 15% Sky blue
      Color(0x1F8B5CF6), // 12% Purple
    ],
  );
}
