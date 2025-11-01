import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/boton_gordo.dart';
import '../widgets/headers.dart';

//----------------------- EmergencyPage -------------------------
class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    //------------ Variables ---------------
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
    ];

    List<Widget> itemMap = items
        .map(
          (item) => FadeInLeft(
            duration: const Duration(milliseconds: 300),
            child: BotonGordo(
              icon: item.icon,
              texto: item.texto,
              color1: item.color1,
              color2: item.color2,
              onPress: () {
                //print('hola');
              },
            ),
          ),
        )
        .toList();

    //---------------- Pantalla ---------------
    return Scaffold(
      //appBar: AppBar(title: Text('EmergencyPage')),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 220 : 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                if (isLarge) const SizedBox(height: 70),
                ...itemMap,
              ],
            ),
          ),
          if (isLarge) const PageHeader(),
        ],
      ),
    );
  }
}

//----------------------- PageHeader -----------------------------
class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.car,
          titulo1: 'Haz solicitado',
          titulo2: 'Servicio Mecánico',
          color1: Color(0xff536cf6),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

//----------------------- ItemBoton -----------------------------
class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}
