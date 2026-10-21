import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/colors.dart';

class ScaleButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSecondary;
  final bool showArrow;

  const ScaleButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isSecondary = false,
    this.showArrow = true,
  });

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isSecondary) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: _isHovered ? Colors.white.withOpacity(0.08) : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: _isHovered ? Colors.white : Colors.white.withOpacity(0.25),
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                ),
                if (widget.showArrow) ...[
                  const SizedBox(width: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    transform: Matrix4.translationValues(_isHovered ? 3.0 : 0.0, 0.0, 0.0),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    // Botão Primário (Pill branco imponente de alta conversão)
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFFF1F5F9) : BarberColors.buttonPrimaryBg,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(_isHovered ? 0.35 : 0.15),
                blurRadius: _isHovered ? 20 : 12,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: BarberColors.buttonPrimaryText,
                  letterSpacing: -0.2,
                ),
              ),
              if (widget.showArrow) ...[
                const SizedBox(width: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  transform: Matrix4.translationValues(_isHovered ? 3.0 : 0.0, 0.0, 0.0),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    size: 15,
                    color: BarberColors.buttonPrimaryText,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
