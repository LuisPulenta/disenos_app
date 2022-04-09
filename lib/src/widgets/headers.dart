import 'package:flutter/material.dart';

class HeadersCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        color: Color(0xff615aab),
      ),
    );
  }
}

class HeadersBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xff615aab),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
        ),
      ),
    );
  }
}

class Headers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderMultiOndasPainter(),
        ),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.moveTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    //path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    //path.moveTo(0, size.height * 0.5);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    //Propiedades
    lapiz.color = Color(0xff615aab);
    //lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.3, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderOndasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.1, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0.0, 155), radius: 180);

    final Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff6d05e8),
          Color(0xffc012ff),
          Color(0xff6d05fa),
          Colors.yellow,
        ],
        stops: [
          0.2,
          0.3,
          0.8,
          1.0,
        ]);

    final lapiz = Paint()..shader = gradiente.createShader(rect);
    //lapiz.color = Color(0xff615aab);
    //lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.1, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderMultiOndasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.05, size.height * 0.22,
        size.width * 0.1, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.18,
        size.width * 0.2, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.22,
        size.width * 0.3, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.18,
        size.width * 0.4, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.45, size.height * 0.22,
        size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.18,
        size.width * 0.6, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.65, size.height * 0.22,
        size.width * 0.7, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18,
        size.width * 0.8, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.85, size.height * 0.22,
        size.width * 0.9, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.18,
        size.width * 1, size.height * 0.2);

    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
