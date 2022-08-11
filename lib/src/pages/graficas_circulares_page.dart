import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Graficas Circulares'),
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
                colorSecundario: Color.fromRGBO(251, 192, 45, 1),
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Color.fromARGB(255, 16, 175, 98),
                colorSecundario: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          }),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSecundario;
  const CustomRadialProgress(
      {required this.porcentaje,
      required this.colorPrimario,
      required this.colorSecundario});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
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
