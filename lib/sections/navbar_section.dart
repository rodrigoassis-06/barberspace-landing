import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';
import '../core/responsive/responsive_layout.dart';
import '../widgets/scale_button.dart';
import '../widgets/brand_logo.dart';

class NavbarSection extends StatelessWidget {
  final Function(String) onNavItemSelected;

  const NavbarSection({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 64 : 20),
      decoration: BoxDecoration(
        color: BarberColors.sectionDarkBg.withOpacity(0.92),
        border: const Border(
          bottom: BorderSide(
            color: BarberColors.sectionDarkBorder,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Oficial Barber Space
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => onNavItemSelected('top'),
                  child: const BrandLogo(height: 38),
                ),
              ),

              // Menu Links (Desktop)
              if (isDesktop)
                Row(
                  children: [
                    _NavLink(title: 'Sobre', onTap: () => onNavItemSelected('sobre')),
                    const SizedBox(width: 32),
                    _NavLink(title: 'Serviços', onTap: () => onNavItemSelected('servicos')),
                    const SizedBox(width: 32),
                    _NavLink(title: 'Método', onTap: () => onNavItemSelected('metodo')),
                    const SizedBox(width: 32),
                    _NavLink(title: 'Números', onTap: () => onNavItemSelected('numeros')),
                    const SizedBox(width: 32),
                    _NavLink(title: 'Dúvidas', onTap: () => onNavItemSelected('duvidas')),
                  ],
                ),

              // Ações à direita
              Row(
                children: [
                  ScaleButton(
                    text: isDesktop ? 'Agendar Demonstração' : 'Demonstração',
                    onPressed: () => onNavItemSelected('contato'),
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

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _isHovered ? Colors.white : BarberColors.sectionDarkMuted,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}
