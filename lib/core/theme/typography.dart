import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class BarberTypography {
  // Hero Display (Head com Globo)
  static TextStyle heroTitle({double fontSize = 64}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: BarberColors.sectionDarkText,
      letterSpacing: -2.0,
      height: 1.02,
    );
  }

  // text-display do HNS (títulos monumentais)
  static TextStyle displayTitle({double fontSize = 48, Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color ?? BarberColors.sectionDarkText,
      letterSpacing: -1.5,
      height: 1.05,
    );
  }

  // eyebrow do HNS: uppercase, tracking 0.22em, peso 600
  static TextStyle eyebrow({Color? color}) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? BarberColors.sectionDarkMuted,
      letterSpacing: 2.5,
    );
  }

  // Corpo de texto
  static TextStyle body({double fontSize = 16, Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color ?? BarberColors.sectionDarkMuted,
      height: 1.6,
      letterSpacing: -0.2,
    );
  }

  // Título de card
  static TextStyle cardTitle({double fontSize = 20, Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color ?? BarberColors.sectionDarkText,
      letterSpacing: -0.4,
    );
  }
}
