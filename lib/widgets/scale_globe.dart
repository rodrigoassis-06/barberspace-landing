import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class ScaleGlobe extends StatefulWidget {
  final double size;

  const ScaleGlobe({
    super.key,
    this.size = 380,
  });

  @override
  State<ScaleGlobe> createState() => _ScaleGlobeState();
}

class _ScaleGlobeState extends State<ScaleGlobe> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  final List<_Point3D> _points = [];
  final List<List<int>> _connections = [];

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();

    _generateFibonacciSphere(160);
  }

  void _generateFibonacciSphere(int count) {
    final phi = (1 + math.sqrt(5)) / 2; // Proporção áurea
    for (int i = 0; i < count; i++) {
      final y = 1 - (i / (count - 1)) * 2; // de 1 a -1
      final radiusAtY = math.sqrt(1 - y * y);
      final theta = 2 * math.pi * i / phi;
      final x = math.cos(theta) * radiusAtY;
      final z = math.sin(theta) * radiusAtY;

      // Cor baseada na posição (mistura de azul elétrico, ciano e roxo como na Scale)
      Color color;
      if (y > 0.3) {
        color = BarberColors.cyanNeon;
      } else if (y > -0.2) {
        color = BarberColors.electricBlue;
      } else {
        color = BarberColors.purpleNeon;
      }

      _points.add(_Point3D(x, y, z, color));
    }

    // Criar conexões entre pontos próximos
    for (int i = 0; i < _points.length; i++) {
      for (int j = i + 1; j < _points.length; j++) {
        final dist = _distance(_points[i], _points[j]);
        if (dist < 0.32) {
          _connections.add([i, j]);
        }
      }
    }
  }

  double _distance(_Point3D a, _Point3D b) {
    final dx = a.x - b.x;
    final dy = a.y - b.y;
    final dz = a.z - b.z;
    return math.sqrt(dx * dx + dy * dy + dz * dz);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        final angleY = _rotationController.value * 2 * math.pi;
        final angleX = 0.35 + math.sin(_rotationController.value * 2 * math.pi) * 0.15;

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _GlobePainter(
              points: _points,
              connections: _connections,
              angleX: angleX,
              angleY: angleY,
            ),
          ),
        );
      },
    );
  }
}

class _Point3D {
  final double x;
  final double y;
  final double z;
  final Color color;

  _Point3D(this.x, this.y, this.z, this.color);
}

class _GlobePainter extends CustomPainter {
  final List<_Point3D> points;
  final List<List<int>> connections;
  final double angleX;
  final double angleY;

  _GlobePainter({
    required this.points,
    required this.connections,
    required this.angleX,
    required this.angleY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.42;

    // Rotação 3D dos pontos
    final cosY = math.cos(angleY);
    final sinY = math.sin(angleY);
    final cosX = math.cos(angleX);
    final sinX = math.sin(angleX);

    final projected = List<Offset>.filled(points.length, Offset.zero);
    final zDepths = List<double>.filled(points.length, 0);

    for (int i = 0; i < points.length; i++) {
      final p = points[i];

      // Rotação em Y
      final x1 = p.x * cosY + p.z * sinY;
      final y1 = p.y;
      final z1 = -p.x * sinY + p.z * cosY;

      // Rotação em X
      final x2 = x1;
      final y2 = y1 * cosX - z1 * sinX;
      final z2 = y1 * sinX + z1 * cosX;

      zDepths[i] = z2;

      // Projeção com perspectiva sutil
      final perspective = 1 / (2.2 - z2 * 0.4);
      projected[i] = Offset(
        center.dx + x2 * radius * perspective * 2.0,
        center.dy + y2 * radius * perspective * 2.0,
      );
    }

    // Desenhar conexões de linhas (apenas se estiverem na frente ou profundidade média)
    final linePaint = Paint()..style = PaintingStyle.stroke;
    for (final conn in connections) {
      final i1 = conn[0];
      final i2 = conn[1];
      final avgZ = (zDepths[i1] + zDepths[i2]) / 2;

      if (avgZ > -0.3) {
        final alpha = ((avgZ + 0.3) / 1.3).clamp(0.05, 0.45);
        linePaint
          ..color = BarberColors.electricBlue.withValues(alpha: alpha)
          ..strokeWidth = 0.8;
        canvas.drawLine(projected[i1], projected[i2], linePaint);
      }
    }

    // Desenhar pontos com glow
    final pointPaint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < points.length; i++) {
      final z = zDepths[i];
      if (z > -0.6) {
        final alpha = ((z + 0.6) / 1.6).clamp(0.1, 1.0);
        final ptRadius = (1.5 + (z + 1) * 1.5).clamp(1.0, 4.0);

        pointPaint.color = points[i].color.withValues(alpha: alpha);
        canvas.drawCircle(projected[i], ptRadius, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _GlobePainter oldDelegate) {
    return oldDelegate.angleY != angleY || oldDelegate.angleX != angleX;
  }
}

