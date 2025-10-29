import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(title: Text('CuadradoAnimadoPage')),
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  //animaciones
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut),
      ),
    );
    super.initState();

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );
    super.initState();

    moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut),
      ),
    );
    super.initState();

    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
        //controller.reverse();
        //controller.reset();
      }
      // else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // };
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.translate(
          offset: Offset(
            moverDerecha.value + moverIzquierda.value,
            moverArriba.value + moverAbajo.value,
          ),
          child: childRectangulo,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
