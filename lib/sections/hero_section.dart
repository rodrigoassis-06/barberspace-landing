import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';
import '../widgets/scale_button.dart';
import '../widgets/scale_globe.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onDemoPressed;
  final VoidCallback onExplorePressed;

  const HeroSection({
    super.key,
    required this.onDemoPressed,
    required this.onExplorePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final minHeroHeight = isDesktop ? math.max(780.0, screenHeight * 0.88) : 620.0;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeroHeight),
      color: BarberColors.sectionDarkBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Texto do Hero (Estilo monumental e preciso)
                    Expanded(
                      flex: 6,
                      child: _buildHeroContent(isDesktop),
                    ),
                    const SizedBox(width: 48),
                    // Globo 3D Wireframe giratório que o usuário adorou com glow radial de fundo
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 500,
                              height: 500,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    BarberColors.primaryBlue.withOpacity(0.20),
                                    BarberColors.cyanNeon.withOpacity(0.06),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            const ScaleGlobe(size: 480),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeroContent(isDesktop),
                    const SizedBox(height: 48),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 340,
                          height: 340,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                BarberColors.primaryBlue.withOpacity(0.20),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        const ScaleGlobe(size: 320),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroContent(bool isDesktop) {
    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Headline Monumental
        RichText(
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Gestão Exata.\n',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 74 : 40,
                  fontWeight: FontWeight.w900,
                  color: BarberColors.sectionDarkText,
                  letterSpacing: -2.5,
                  height: 1.04,
                ),
              ),
              TextSpan(
                text: 'Barbearia Escalável.',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 74 : 40,
                  fontWeight: FontWeight.w900,
                  color: BarberColors.cyanAccent,
                  letterSpacing: -2.5,
                  height: 1.04,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Subtítulo Refinado
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            'A infraestrutura completa de software para barbearias de alta performance. Agenda multi-barbeiro em colunas, comandas digitais, ledger de estoque e clube de assinaturas recorrentes.',
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
            style: BarberTypography.body(
              fontSize: isDesktop ? 19 : 16,
              color: BarberColors.sectionDarkMuted,
            ),
          ),
        ),
        const SizedBox(height: 40),

        // Botões de Ação
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleButton(
              text: 'Agendar Demonstração',
              onPressed: onDemoPressed,
            ),
            const SizedBox(width: 14),
            ScaleButton(
              text: 'Explorar Recursos',
              isSecondary: true,
              onPressed: onExplorePressed,
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Provas de Confiança
        Wrap(
          spacing: 24,
          runSpacing: 10,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _buildBullet('Agendamento online em 30s'),
            _buildBullet('Atendimento sem espera'),
            _buildBullet('Zero comissão abusiva'),
          ],
        ),
      ],
    );
  }

  Widget _buildBullet(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_rounded, size: 16, color: BarberColors.cyanAccent),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: BarberColors.sectionDarkMuted,
          ),
        ),
      ],
    );
  }
}
