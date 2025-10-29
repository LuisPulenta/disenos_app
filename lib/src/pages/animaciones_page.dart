import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(title: Text('AnimacionesPage')),
      body: Center(child: CuadradoAnimado()),
    );
  }
}

//*****************************************************************
//************************ CuadradoAnimado ************************
//*****************************************************************
class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //-----------------------------------------------------------------
  //------------------------- Variables -----------------------------
  //-----------------------------------------------------------------

  late AnimationController controller;

  late Animation<double> rotacion;

  late Animation<double> opacidad;

  late Animation<double> moverDerecha;

  late Animation<double> agrandar;

  late Animation<double> opacidadOut;

  //-----------------------------------------------------------------
  //------------------------- initState -----------------------------
  //-----------------------------------------------------------------
  @override
  void initState() {
    //--- controller ---
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10000),
    );

    //--- rotacion ---
    rotacion = Tween(
      begin: 0.0,
      end: 2.0 * math.pi,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    //--- opacidad ---
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut),
      ),
    );

    //--- moverDerecha ---
    moverDerecha = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    //--- agrandar ---
    agrandar = Tween(
      begin: 0.0,
      end: 4.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    //--- opacidadOut ---
    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    //--- Listener ---
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
        //controller.reset();
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //-----------------------------------------------------------------
  //------------------------- Pantalla ------------------------------
  //-----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    //Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        //print('rotacion: ' + rotacion.value.toString());
        //print('opacidad: ' + opacidad.value.toString());
        //print('rotacion: ' + rotacion.value.toString());
        return Transform.translate(
          offset: Offset(moverDerecha.value, moverDerecha.value * 2),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

//*****************************************************************
//************************ _Rectangulo ****************************
//*****************************************************************
class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.red),
    );
  }
}
