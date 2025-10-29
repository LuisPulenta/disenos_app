import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.yellow,
    this.grosorPrimario = 10,
    this.grosorSecundario = 20,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // controller.addListener(() {
    //   setState(() {
    //     porcentaje = lerpDouble(porcentajeAnterior, porcentaje, controller.value)!;
    //   });
    // });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.grosorSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    //final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    const Gradient gradiente = LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 18, 26, 255),
        Color.fromARGB(255, 232, 5, 5),
        Color.fromARGB(255, 255, 238, 0),
      ],
    );

    //Circulo completado
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      //..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
