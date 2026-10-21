import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/responsive/responsive_layout.dart';

class ContactSection extends StatelessWidget {
  final VoidCallback onStartTour;

  const ContactSection({super.key, required this.onStartTour});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      color: BarberColors.sectionLightBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 140 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'VAMOS CONVERSAR',
                style: BarberTypography.eyebrow(color: BarberColors.sectionLightMuted),
              ),
              const SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sua barbearia chegou aqui. Agora ela precisa ',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 58 : 32,
                        fontWeight: FontWeight.w800,
                        color: BarberColors.sectionLightText,
                        letterSpacing: -1.8,
                        height: 1.12,
                      ),
                    ),
                    TextSpan(
                      text: 'dar o próximo salto.',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 58 : 32,
                        fontWeight: FontWeight.w800,
                        color: BarberColors.primaryBlue,
                        letterSpacing: -1.8,
                        height: 1.12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 56),

              // Card Central de Contato (idêntico ao HNS)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onStartTour,
                  child: Container(
                    padding: EdgeInsets.all(isDesktop ? 48 : 32),
                    constraints: const BoxConstraints(maxWidth: 520),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: BarberColors.sectionLightBorder),
                      boxShadow: [
                        BoxShadow(
                          color: BarberColors.primaryBlue.withOpacity(0.18),
                          blurRadius: 50,
                          spreadRadius: -10,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Moldura QR Code estilizada
                        Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.qr_code_2_rounded,
                                  size: 130,
                                  color: Color(0xFF0F172A),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Aponte a câmera',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF64748B),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'WHATSAPP OFICIAL',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.2,
                            color: BarberColors.primaryBlue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Aponte o celular ou clique para falar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: BarberColors.sectionLightText,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '(12) 00000-0000 · Taubaté - SP',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: BarberColors.sectionLightMuted,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: onStartTour,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BarberColors.primaryBlue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Iniciar Conversa no WhatsApp',
                                  style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_outward_rounded, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
