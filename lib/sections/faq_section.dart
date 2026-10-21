import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int? _openIndex = 0; // O primeiro vem aberto por padrão (como no HNS)

  final faqs = [
    {
      'q': 'O cliente precisa baixar aplicativo na Play Store ou App Store?',
      'a': 'Não. O agendamento é uma página web ultra-leve (SPA). O cliente clica no link da sua bio do Instagram ou WhatsApp, escolhe o profissional e o horário, e confirma em 30 segundos diretamente no navegador do celular.',
    },
    {
      'q': 'Como o Barber Space impede dois clientes no mesmo horário?',
      'a': 'A API do Barber Space utiliza travas transacionais de banco de dados (Advisory Locks no PostgreSQL). Isso garante que, mesmo com múltiplos acessos simultâneos no mesmo minuto, nenhum horário seja duplicado.',
    },
    {
      'q': 'Como funciona o Clube de Assinaturas da barbearia?',
      'a': 'Você cria planos recorrentes (ex: R\$ 119,90/mês para cortes ilimitados ou semanais). O sistema valida o status do cliente na hora do agendamento e gera receita recorrente garantida todo início de mês.',
    },
    {
      'q': 'Posso cadastrar produtos com variantes de tamanho e cor?',
      'a': 'Sim. O módulo de catálogo suporta produtos simples (pomadas, óleos), produtos com variantes de tamanho e cor (camisetas, bonés) e insumos de bancada. Cada saída é registrada em ledger imutável.',
    },
    {
      'q': 'Como funciona o fechamento de caixa por operador?',
      'a': 'Cada barbeiro ou operador abre sua sessão individual com valor inicial. Todos os lançamentos (Pix, dinheiro, débito, crédito) são calculados em centavos inteiros, permitindo conferência cega e conciliação precisa sem furos.',
    },
  ];

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
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Coluna Esquerda: Título (4 cols no HNS)
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PERGUNTAS FREQUENTES', style: BarberTypography.eyebrow(color: BarberColors.sectionDarkMuted)),
                          const SizedBox(height: 24),
                          Text(
                            'Dúvidas?',
                            style: GoogleFonts.inter(
                              fontSize: 58,
                              fontWeight: FontWeight.w900,
                              color: BarberColors.sectionDarkText,
                              letterSpacing: -1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 56),
                    // Coluna Direita: Acordeão (8 cols no HNS)
                    Expanded(
                      flex: 8,
                      child: _buildAccordion(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PERGUNTAS FREQUENTES', style: BarberTypography.eyebrow(color: BarberColors.sectionDarkMuted)),
                    const SizedBox(height: 16),
                    Text(
                      'Dúvidas?',
                      style: GoogleFonts.inter(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        color: BarberColors.sectionDarkText,
                        letterSpacing: -1.2,
                      ),
                    ),
                    const SizedBox(height: 36),
                    _buildAccordion(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildAccordion() {
    return Container(
      decoration: BoxDecoration(
        color: BarberColors.sectionDarkCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: BarberColors.sectionDarkBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(faqs.length, (i) {
          final isOpen = _openIndex == i;
          final isLast = i == faqs.length - 1;

          return Container(
            decoration: BoxDecoration(
              border: isLast ? null : const Border(
                bottom: BorderSide(color: BarberColors.sectionDarkBorder, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _openIndex = isOpen ? null : i;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 26),
                      color: isOpen ? Colors.white.withOpacity(0.03) : Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              faqs[i]['q']!,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: BarberColors.sectionDarkText,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            isOpen ? Icons.remove_rounded : Icons.add_rounded,
                            color: BarberColors.cyanAccent,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isOpen)
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 48, bottom: 28),
                    child: Text(
                      faqs[i]['a']!,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: BarberColors.sectionDarkMuted,
                        height: 1.6,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
