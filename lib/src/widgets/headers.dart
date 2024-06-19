import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeadersCuadrado extends StatelessWidget {
  const HeadersCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        color: const Color(0xff615aab),
      ),
    );
  }
}

class HeadersBordesRedondeados extends StatelessWidget {
  const HeadersBordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        decoration: const BoxDecoration(
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
  final Color color;

  const Headers({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderFoodPainter(),
          //_HeaderGradientPainter(),
          //_HeaderOndasPainter(),
          //_HeaderCurvoPainter(),
          //_HeaderPicoPainter(),
          //_HeaderTrianguloPainter(),
          //_HeaderDiagonalPainter(),
          //_HeaderMultiOndasPainter(color),
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
    lapiz.color = const Color(0xffff0000);
    //lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
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
    lapiz.color = const Color(0xff615aab);
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
    lapiz.color = const Color(0xff615aab);
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
    lapiz.color = const Color(0xff615aab);
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

class _HeaderFoodPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = const Color(0xffff0000);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2.0;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.05,
        size.width * 0.7, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25,
        size.width * 0.65, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.85,
        size.width * 0.55, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.85,
        size.width * 0.38, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.60,
        size.width * 0.25, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.7, size.width * 0, size.height * 0.7);
    path.lineTo(0, 0);
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
    lapiz.color = const Color(0xff615aab);
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
    final Rect rect =
        Rect.fromCircle(center: const Offset(140.0, 155), radius: 80);

    const Gradient gradiente = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff6d05e8),
          Color(0xffc012ff),
          Color(0xff6d05fa),
          Colors.yellow,
        ],
        stops: [
          0.1,
          0.2,
          0.9,
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
  final Color color;

  _HeaderMultiOndasPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = color; // Color(0xff615aab);
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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo1;
  final String titulo2;
  final Color color1;
  final Color color2;

  const IconHeader(
      {Key? key,
      required this.icon,
      required this.titulo1,
      required this.titulo2,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(
          color1: color1,
          color2: color2,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(titulo1, style: (TextStyle(fontSize: 20, color: colorBlanco))),
            const SizedBox(height: 20),
            Text(titulo2,
                style: (TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colorBlanco))),
            const SizedBox(height: 20),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground(
      {this.color1 = Colors.grey, this.color2 = Colors.blueGrey});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                color1,
                color2,
              ])),
    );
  }
}
