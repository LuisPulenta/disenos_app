import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graficas Circulares'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje * 0.5,
                colorPrimario: Colors.blue,
                colorSecundario: Colors.orange,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 0.9,
                colorPrimario: Colors.green,
                colorSecundario: Colors.black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje * 1.4,
                colorPrimario: Colors.blue,
                colorSecundario: Colors.grey,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje * 2.6,
                colorPrimario: Colors.orange,
                colorSecundario: Colors.teal,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.teal,
                colorSecundario: const Color.fromRGBO(251, 192, 45, 1),
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: const Color.fromARGB(255, 16, 175, 98),
                colorSecundario: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      //color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorPrimario: 8,
        grosorSecundario: 4,
      ),
      //child: Text('Porcentaje: ${porcentaje}%',style: TextStyle(fontSize: 30),),
    );
  }
}
