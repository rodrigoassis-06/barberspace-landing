import 'package:flutter/material.dart';

class BarberColors {
  // Cores de Seção Escura (section-dark do HNS)
  static const Color sectionDarkBg = Color(0xFF000000);
  static const Color sectionDarkText = Color(0xFFFFFFFF);
  static const Color sectionDarkCard = Color(0xFF0C0C0C);
  static const Color sectionDarkBorder = Color(0x1AFFFFFF); // rgba(255, 255, 255, 0.10)
  static const Color sectionDarkMuted = Color(0xA6FFFFFF);  // rgba(255, 255, 255, 0.65)

  // Cores de Seção Clara (section-light do HNS)
  static const Color sectionLightBg = Color(0xFFFFFFFF);
  static const Color sectionLightText = Color(0xFF0F1419);
  static const Color sectionLightCard = Color(0xFFF7F8F8);
  static const Color sectionLightBorder = Color(0x14000000); // rgba(0, 0, 0, 0.08)
  static const Color sectionLightMuted = Color(0xFF5B7083);

  // Acentos da Marca Barber Space & HNS
  static const Color primaryBlue = Color(0xFF0066FF); // Azul Elétrico Barber Space
  static const Color cyanAccent = Color(0xFF1DA1F2);  // Azul vibrante HNS / Ciano
  static const Color electricBlue = Color(0xFF0066FF);
  static const Color cyanNeon = Color(0xFF00D2FF);
  static const Color purpleNeon = Color(0xFF8B5CF6);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color pureBlack = Color(0xFF000000);

  // Aliases compatíveis
  static const Color background = sectionDarkBg;
  static const Color borderSubtle = sectionDarkBorder;
  static const Color textPrimary = sectionDarkText;
  static const Color textSecondary = sectionDarkMuted;
  static const Color textMuted = Color(0xFF555A64);
  static const Color buttonPrimaryBg = Color(0xFFFFFFFF);
  static const Color buttonPrimaryText = Color(0xFF000000);
}
