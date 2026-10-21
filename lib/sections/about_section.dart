import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      color: BarberColors.sectionDarkBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 130 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SOBRE O BARBER SPACE',
                style: BarberTypography.eyebrow(color: BarberColors.sectionDarkMuted),
              ),
              const SizedBox(height: 28),

              // Headline com destaque estilizado
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'O mercado trata barbearia como trabalho braçal. O Barber Space trata como ',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 58 : 32,
                        fontWeight: FontWeight.w800,
                        color: BarberColors.sectionDarkText,
                        letterSpacing: -1.8,
                        height: 1.12,
                      ),
                    ),
                    TextSpan(
                      text: 'ativo de alto faturamento.',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 58 : 32,
                        fontWeight: FontWeight.w800,
                        color: BarberColors.cyanAccent,
                        letterSpacing: -1.8,
                        height: 1.12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 52),

              // Duas colunas com o manifesto do produto
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Agendamento manual em cadernos. Mensagens perdidas no WhatsApp. Furos de troco no caixa, estoque furado e dependência de cortes isolados. É assim que a maioria opera — e por isso a maioria estagna.',
                            style: GoogleFonts.inter(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: BarberColors.sectionDarkMuted,
                              height: 1.7,
                            ),
                          ),
                        ),
                        const SizedBox(width: 56),
                        Expanded(
                          child: Text(
                            'O Barber Space constrói a infraestrutura completa do seu salão: agenda em colunas por profissional com bloqueio anti-conflito, comandas digitais na cadeira e clube de assinaturas com receita previsível todo dia 1º. Barbearia forte nasce de processo.',
                            style: GoogleFonts.inter(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: BarberColors.sectionDarkMuted,
                              height: 1.7,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Agendamento manual em cadernos. Mensagens perdidas no WhatsApp. Furos de troco no caixa, estoque furado e dependência de cortes isolados. É assim que a maioria opera — e por isso a maioria estagna.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: BarberColors.sectionDarkMuted,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'O Barber Space constrói a infraestrutura completa do seu salão: agenda em colunas por profissional com bloqueio anti-conflito, comandas digitais na cadeira e clube de assinaturas com receita previsível todo dia 1º. Barbearia forte nasce de processo.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: BarberColors.sectionDarkMuted,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
