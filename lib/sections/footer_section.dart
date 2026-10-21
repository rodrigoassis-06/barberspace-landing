import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/responsive/responsive_layout.dart';
import '../widgets/brand_logo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      color: BarberColors.sectionDarkBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 100 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título Monumental do Rodapé (idêntico ao HNS)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'BARBER SPACE',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 96 : 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -3.0,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 96 : 48,
                        fontWeight: FontWeight.w900,
                        color: BarberColors.cyanAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 56),

              // 3 Colunas de Conteúdo
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _buildBrandCol()),
                        const SizedBox(width: 56),
                        Expanded(flex: 4, child: _buildContactCol()),
                        const SizedBox(width: 56),
                        Expanded(flex: 3, child: _buildLocationCol()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandCol(),
                        const SizedBox(height: 36),
                        _buildContactCol(),
                        const SizedBox(height: 36),
                        _buildLocationCol(),
                      ],
                    ),

              const SizedBox(height: 64),
              const Divider(color: BarberColors.sectionDarkBorder, height: 1),
              const SizedBox(height: 32),

              // Linha inferior de copyright
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© 2026 Barber Space — Todos os direitos reservados.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: BarberColors.sectionDarkMuted,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  if (isDesktop)
                    Text(
                      'TECNOLOGIA PARA BARBEARIAS DE ALTO PADRÃO',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: BarberColors.sectionDarkMuted,
                        letterSpacing: 1.5,
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

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BrandLogo(height: 32),
        const SizedBox(height: 16),
        Text(
          'Software e infraestrutura de alta performance para barbearias. Agenda multi-barbeiro em colunas, comandas digitais, ledger de estoque e assinaturas recorrentes.',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: BarberColors.sectionDarkMuted,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildContactCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTATO',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: BarberColors.sectionDarkMuted,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'WhatsApp: (12) 00000-0000',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Email: comercial@barberspace.com.br',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: BarberColors.sectionDarkMuted,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Horário: Segunda a Sábado das 09h às 20h',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: BarberColors.sectionDarkMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOCALIZAÇÃO',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: BarberColors.sectionDarkMuted,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Taubaté - SP',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Atendimento e implantação em todo o território nacional.',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: BarberColors.sectionDarkMuted,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
