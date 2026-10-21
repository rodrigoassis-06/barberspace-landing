import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class NumbersSection extends StatelessWidget {
  const NumbersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final stats = [
      {
        'value': '+45%',
        'label': 'AUMENTO MÉDIO NO FATURAMENTO NOS PRIMEIROS 90 DIAS',
        'icon': Icons.trending_up_rounded,
      },
      {
        'value': 'Zero',
        'label': 'CONFLITOS DE HORÁRIOS COM TRAVA DE BANCO (ADVISORY LOCKS)',
        'icon': Icons.shield_outlined,
      },
      {
        'value': '30s',
        'label': 'TEMPO MÉDIO PARA O CLIENTE AGENDAR NA BIO DO INSTAGRAM',
        'icon': Icons.timer_outlined,
      },
      {
        'value': '99.98%',
        'label': 'DISPONIBILIDADE E ESTABILIDADE OPERACIONAL EM NUVEM',
        'icon': Icons.cloud_done_outlined,
      },
    ];

    return Container(
      width: double.infinity,
      color: BarberColors.sectionLightBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 130 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NÚMEROS NÃO MENTEM',
                style: BarberTypography.eyebrow(color: BarberColors.sectionLightMuted),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Nossos ',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 64 : 36,
                        fontWeight: FontWeight.w800,
                        color: BarberColors.sectionLightText,
                        letterSpacing: -1.8,
                      ),
                    ),
                    TextSpan(
                      text: 'Números',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 64 : 36,
                        fontWeight: FontWeight.w900,
                        color: BarberColors.primaryBlue,
                        letterSpacing: -1.8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 56),

              // Lista vertical de números monumentais (idêntica ao HNS)
              Column(
                children: stats.map((stat) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: isDesktop ? 32 : 22),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: BarberColors.sectionLightBorder, width: 1.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: isDesktop ? 76 : 52,
                          height: isDesktop ? 76 : 52,
                          decoration: BoxDecoration(
                            color: BarberColors.sectionLightCard,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: BarberColors.sectionLightBorder),
                          ),
                          child: Icon(
                            stat['icon'] as IconData,
                            size: isDesktop ? 36 : 26,
                            color: BarberColors.primaryBlue,
                          ),
                        ),
                        SizedBox(width: isDesktop ? 36 : 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stat['value'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: isDesktop ? 72 : 42,
                                  fontWeight: FontWeight.w900,
                                  color: BarberColors.primaryBlue,
                                  letterSpacing: -2.0,
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                stat['label'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: isDesktop ? 13 : 11,
                                  fontWeight: FontWeight.w700,
                                  color: BarberColors.sectionLightText.withOpacity(0.75),
                                  letterSpacing: 2.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
