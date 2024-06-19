import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo(
      {Key? key,
      required this.icon,
      required this.texto,
      required this.color1,
      required this.color2,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress(),
      child: Stack(
        children: [
          _BotonGordoBackground(icon, color1, color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  texto,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(this.icon, this.color1, this.color2);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.7),
              offset: const Offset(4, 6),
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color>[
          color1,
          color2,
        ]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
