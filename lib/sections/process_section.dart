import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final steps = [
      {
        'letter': '01',
        'title': 'Presença & Agendamento',
        'desc': 'Link público profissional para a bio do Instagram e WhatsApp. O cliente escolhe serviço, barbeiro e horário em menos de 30 segundos, sem baixar aplicativo.',
      },
      {
        'letter': '02',
        'title': 'Operação & Comandas',
        'desc': 'A equipe opera a agenda em colunas dedicada por cadeira. Comandas abertas na cadeira, cálculo financeiro em centavos inteiros e baixa imediata de estoque.',
      },
      {
        'letter': '03',
        'title': 'Recorrência & Fidelidade',
        'desc': 'Clube de assinaturas com receita recorrente garantida todo dia 1º de cada mês. Elimina meses fracos e transforma clientes casuais em fiéis.',
      },
    ];

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
                'O MÉTODO',
                style: BarberTypography.eyebrow(color: BarberColors.sectionDarkMuted),
              ),
              const SizedBox(height: 24),
              Text(
                'Método Barber Space',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 54 : 32,
                  fontWeight: FontWeight.w800,
                  color: BarberColors.sectionDarkText,
                  letterSpacing: -1.8,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Três etapas. Uma infraestrutura clara que transforma sua barbearia em empresa escalável.',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 19 : 16,
                  color: BarberColors.sectionDarkMuted,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 56),

              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: steps.map((s) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildProcessCard(s['letter']!, s['title']!, s['desc']!),
                          ),
                        );
                      }).toList(),
                    )
                  : Column(
                      children: steps.map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _buildProcessCard(s['letter']!, s['title']!, s['desc']!),
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProcessCard(String letter, String title, String desc) {
    return Container(
      constraints: const BoxConstraints(minHeight: 360),
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: BarberColors.sectionDarkCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: BarberColors.sectionDarkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            letter,
            style: GoogleFonts.inter(
              fontSize: 84,
              fontWeight: FontWeight.w900,
              color: BarberColors.primaryBlue.withOpacity(0.75),
              height: 0.9,
            ),
          ),
          const SizedBox(height: 36),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: BarberColors.sectionDarkText,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                desc,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: BarberColors.sectionDarkMuted,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
