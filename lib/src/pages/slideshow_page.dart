import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SlideshowPage')),
      body: Column(
        children: [
          Expanded(child: miSlideshow()),
          Expanded(child: miSlideshow()),
        ],
      ),
    );
  }
}

class miSlideshow extends StatelessWidget {
  const miSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 10,
      //puntosArriba: true,
      colorPrimario: Colors.red,
      colorSecundario: Colors.yellow,
      slides: <Widget>[
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg'),
        Scaffold(
          appBar: AppBar(title: Text('Hola')),
          body: Center(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
          ),
        ),
        Text('Hola Mundo'),
        Icon(Icons.image),
      ],
    );
  }
}
