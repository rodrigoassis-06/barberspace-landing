import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/colors.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/services_section.dart';
import 'sections/process_section.dart';
import 'sections/numbers_section.dart';
import 'sections/faq_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

void main() {
  runApp(const BarberSpaceLandingApp());
}

class BarberSpaceLandingApp extends StatelessWidget {
  const BarberSpaceLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber Space — Gestão Exata. Barbearia Escalável.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: BarberColors.sectionDarkBg,
        primaryColor: BarberColors.primaryBlue,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: const LandingPageScreen(),
    );
  }
}

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _sobreKey = GlobalKey();
  final GlobalKey _servicosKey = GlobalKey();
  final GlobalKey _metodoKey = GlobalKey();
  final GlobalKey _numerosKey = GlobalKey();
  final GlobalKey _duvidasKey = GlobalKey();
  final GlobalKey _contatoKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _handleNavAction(String action) {
    switch (action) {
      case 'top':
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutCubic,
        );
        break;
      case 'sobre':
        _scrollToSection(_sobreKey);
        break;
      case 'servicos':
        _scrollToSection(_servicosKey);
        break;
      case 'metodo':
        _scrollToSection(_metodoKey);
        break;
      case 'numeros':
        _scrollToSection(_numerosKey);
        break;
      case 'duvidas':
        _scrollToSection(_duvidasKey);
        break;
      case 'contato':
      case 'demo':
        _scrollToSection(_contatoKey);
        break;
      case 'login':
        _showInfoDialog(
          title: 'Acesso ao Painel ERP',
          content: 'Utilize suas credenciais de proprietário ou equipe no aplicativo administrativo.',
        );
        break;
    }
  }

  void _showInfoDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: BarberColors.sectionDarkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: BarberColors.sectionDarkBorder),
        ),
        title: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16)),
        content: Text(content, style: GoogleFonts.inter(color: BarberColors.sectionDarkMuted, fontSize: 14, height: 1.5)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Fechar', style: GoogleFonts.inter(color: BarberColors.cyanAccent, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BarberColors.sectionDarkBg,
      body: Stack(
        children: [
          // Conteúdo rolável com a estrutura rítmica exata do HNS
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Espaço para a navbar fixa
                const SizedBox(height: 72),

                // 1. HEAD (Navbar + Hero com Globo giratório que você adorou!)
                HeroSection(
                  onDemoPressed: () => _scrollToSection(_contatoKey),
                  onExplorePressed: () => _scrollToSection(_sobreKey),
                ),

                // 2. SOBRE A EMPRESA (section-dark: Fundo preto)
                KeyedSubtree(
                  key: _sobreKey,
                  child: const AboutSection(),
                ),

                // 3. O QUE ENTREGAMOS / SERVIÇOS (section-light: Fundo branco)
                KeyedSubtree(
                  key: _servicosKey,
                  child: ServicesSection(
                    onSelectService: () => _scrollToSection(_contatoKey),
                  ),
                ),

                // 4. O MÉTODO / PROCESSO (section-dark: Fundo preto)
                KeyedSubtree(
                  key: _metodoKey,
                  child: const ProcessSection(),
                ),

                // 5. NOSSOS NÚMEROS (section-light: Fundo branco)
                KeyedSubtree(
                  key: _numerosKey,
                  child: const NumbersSection(),
                ),

                // 6. DÚVIDAS / FAQ (section-dark: Fundo preto)
                KeyedSubtree(
                  key: _duvidasKey,
                  child: const FaqSection(),
                ),

                // 7. VAMOS CONVERSAR / CONTATO (section-light: Fundo branco)
                KeyedSubtree(
                  key: _contatoKey,
                  child: ContactSection(
                    onStartTour: () => _showInfoDialog(
                      title: 'Agendar Demonstração',
                      content: 'Nossa equipe entrará em contato para agendar uma demonstração guiada.',
                    ),
                  ),
                ),

                // 8. RODAPÉ (section-dark: Fundo preto)
                const FooterSection(),
              ],
            ),
          ),

          // Navbar fixa superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarSection(
              onNavItemSelected: _handleNavAction,
            ),
          ),
        ],
      ),
    );
  }
}
