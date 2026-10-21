import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class ServicesSection extends StatelessWidget {
  final VoidCallback onSelectService;

  const ServicesSection({super.key, required this.onSelectService});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      color: BarberColors.sectionLightBg,
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
                'O QUE ENTREGAMOS',
                style: BarberTypography.eyebrow(color: BarberColors.sectionLightMuted),
              ),
              const SizedBox(height: 24),
              Text(
                'Tudo que sua barbearia precisa, em uma só plataforma.',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 54 : 32,
                  fontWeight: FontWeight.w800,
                  color: BarberColors.sectionLightText,
                  letterSpacing: -1.6,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Módulos desenvolvidos com precisão para elevar o padrão de atendimento e o faturamento do seu negócio.',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 18 : 15,
                  fontWeight: FontWeight.w400,
                  color: BarberColors.sectionLightMuted,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 56),

              // Layout Bento Rítmico (Exatamente como na referência)
              if (isDesktop) ...[
                // LINHA 1: Card Claro + Card Escuro + Card Amplo com Gráfico
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _BentoLightCard(
                        title: 'Agenda multi-barbeiro em colunas dedicadas',
                        description: 'Visualização simultânea de toda a equipe em tempo real com trava transacional no banco.',
                        linkText: 'Conhecer a agenda',
                        onTap: onSelectService,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 3,
                      child: _BentoDarkCard(
                        title: 'Clube de assinaturas com receita previsível',
                        description: 'Transforme clientes casuais em membros mensais. Cobrança recorrente todo dia 1º de cada mês.',
                        linkText: 'Explorar assinaturas',
                        onTap: onSelectService,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 5,
                      child: _BentoWideCard(
                        title: 'Agendamento online na bio em menos de 30 segundos',
                        description: 'Link público ultra-rápido para Instagram e WhatsApp. Seu cliente agenda sem baixar aplicativo.',
                        linkText: 'Ver agendamento online',
                        onTap: onSelectService,
                        graphicWidget: _buildBookingGraphic(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // LINHA 2: Card Claro + Card Escuro + Card Amplo com Gráfico
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _BentoLightCard(
                        title: 'Comandas digitais na cadeira com split Pix e cartão',
                        description: 'Abra comandas na bancada, lance cortes e produtos com divisão flexível de pagamento.',
                        linkText: 'Ver comandas',
                        onTap: onSelectService,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 3,
                      child: _BentoDarkCard(
                        title: 'Estoque protegido com ledger imutável e UUID',
                        description: 'Cada saída de pomada ou produto gera registro sequencial auditado. Saldo negativo proibido.',
                        linkText: 'Conhecer o ledger',
                        onTap: onSelectService,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 5,
                      child: _BentoWideCard(
                        title: 'Fechamento de caixa cego com conciliação exata',
                        description: 'Abertura, sangria e fechamento por operador com conferência cega e cálculo automático de comissões.',
                        linkText: 'Ver conciliação',
                        onTap: onSelectService,
                        graphicWidget: _buildCashierGraphic(),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Mobile / Tablet: Lista vertical fluida dos cards
                _BentoLightCard(
                  title: 'Agenda multi-barbeiro em colunas dedicadas',
                  description: 'Visualização simultânea de toda a equipe em tempo real com trava transacional no banco.',
                  linkText: 'Conhecer a agenda',
                  onTap: onSelectService,
                ),
                const SizedBox(height: 20),
                _BentoDarkCard(
                  title: 'Clube de assinaturas com receita previsível',
                  description: 'Transforme clientes casuais em membros mensais. Cobrança recorrente todo dia 1º de cada mês.',
                  linkText: 'Explorar assinaturas',
                  onTap: onSelectService,
                ),
                const SizedBox(height: 20),
                _BentoWideCard(
                  title: 'Agendamento online na bio em menos de 30 segundos',
                  description: 'Link público ultra-rápido para Instagram e WhatsApp. Seu cliente agenda sem baixar aplicativo.',
                  linkText: 'Ver agendamento online',
                  onTap: onSelectService,
                  graphicWidget: _buildBookingGraphic(),
                ),
                const SizedBox(height: 20),
                _BentoLightCard(
                  title: 'Comandas digitais na cadeira com split Pix e cartão',
                  description: 'Abra comandas na bancada, lance cortes e produtos com divisão flexível de pagamento.',
                  linkText: 'Ver comandas',
                  onTap: onSelectService,
                ),
                const SizedBox(height: 20),
                _BentoDarkCard(
                  title: 'Estoque protegido com ledger imutável e UUID',
                  description: 'Cada saída de pomada ou produto gera registro sequencial auditado. Saldo negativo proibido.',
                  linkText: 'Conhecer o ledger',
                  onTap: onSelectService,
                ),
                const SizedBox(height: 20),
                _BentoWideCard(
                  title: 'Fechamento de caixa cego com conciliação exata',
                  description: 'Abertura, sangria e fechamento por operador com conferência cega e cálculo automático de comissões.',
                  linkText: 'Ver conciliação',
                  onTap: onSelectService,
                  graphicWidget: _buildCashierGraphic(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Gráfico do Card Amplo 1: Agendamento Mobile & Link
  Widget _buildBookingGraphic() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Sombra em camadas simulando a carteira / badge 3D da referência
          Positioned(
            top: 20,
            child: Container(
              width: 90,
              height: 22,
              decoration: BoxDecoration(
                color: BarberColors.primaryBlue.withOpacity(0.85),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: 32,
            child: Container(
              width: 104,
              height: 74,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Center(
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: Image.asset(
                    'assets/brand/barber_space_symbol_pristine.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Gráfico do Card Amplo 2: Conciliação & Caixa
  Widget _buildCashierGraphic() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 104,
          height: 104,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded, color: Color(0xFF10B981), size: 22),
              ),
              const SizedBox(height: 8),
              Text(
                'Divergência R\$ 0',
                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: const Color(0xFF0F172A)),
                textAlign: TextAlign.center,
              ),
              Text(
                '100% Conciliado',
                style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w500, color: const Color(0xFF10B981)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. CARD CLARO (Estilo da Referência)
class _BentoLightCard extends StatefulWidget {
  final String title;
  final String description;
  final String linkText;
  final VoidCallback onTap;

  const _BentoLightCard({
    required this.title,
    required this.description,
    required this.linkText,
    required this.onTap,
  });

  @override
  State<_BentoLightCard> createState() => _BentoLightCardState();
}

class _BentoLightCardState extends State<_BentoLightCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -5.0 : 0.0, 0),
          constraints: const BoxConstraints(minHeight: 320),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6), // Fundo claro suave da referência
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.02),
                blurRadius: _isHovered ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF111827),
                      letterSpacing: -0.6,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF4B5563),
                      height: 1.55,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.linkText,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: BarberColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    transform: Matrix4.translationValues(_isHovered ? 4.0 : 0.0, 0.0, 0.0),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: BarberColors.primaryBlue,
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

// 2. CARD ESCURO (Estilo da Referência Central)
class _BentoDarkCard extends StatefulWidget {
  final String title;
  final String description;
  final String linkText;
  final VoidCallback onTap;

  const _BentoDarkCard({
    required this.title,
    required this.description,
    required this.linkText,
    required this.onTap,
  });

  @override
  State<_BentoDarkCard> createState() => _BentoDarkCardState();
}

class _BentoDarkCardState extends State<_BentoDarkCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -5.0 : 0.0, 0),
          constraints: const BoxConstraints(minHeight: 320),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          decoration: BoxDecoration(
            color: const Color(0xFF18181B), // Preto grafite nobre da referência
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.30 : 0.15),
                blurRadius: _isHovered ? 28 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.6,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.72),
                      height: 1.55,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.linkText,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: BarberColors.cyanNeon,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    transform: Matrix4.translationValues(_isHovered ? 4.0 : 0.0, 0.0, 0.0),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: BarberColors.cyanNeon,
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

// 3. CARD LARGO COM GRÁFICO (Estilo da Referência Direita)
class _BentoWideCard extends StatefulWidget {
  final String title;
  final String description;
  final String linkText;
  final Widget graphicWidget;
  final VoidCallback onTap;

  const _BentoWideCard({
    required this.title,
    required this.description,
    required this.linkText,
    required this.graphicWidget,
    required this.onTap,
  });

  @override
  State<_BentoWideCard> createState() => _BentoWideCardState();
}

class _BentoWideCardState extends State<_BentoWideCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _isHovered ? -5.0 : 0.0, 0),
          constraints: const BoxConstraints(minHeight: 320),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6), // Fundo claro suave da referência
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.02),
                blurRadius: _isHovered ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF111827),
                            letterSpacing: -0.6,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          widget.description,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4B5563),
                            height: 1.55,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.linkText,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: BarberColors.primaryBlue,
                          ),
                        ),
                        const SizedBox(width: 6),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          transform: Matrix4.translationValues(_isHovered ? 4.0 : 0.0, 0.0, 0.0),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: BarberColors.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 28),
              widget.graphicWidget,
            ],
          ),
        ),
      ),
    );
  }
}
