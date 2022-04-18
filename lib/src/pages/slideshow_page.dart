import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      Expanded(child: miSlideshow()),
      Expanded(child: miSlideshow()),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('SlideshowPage')),
      body: isLarge
          ? Column(
              children: children,
            )
          : Row(
              children: children,
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
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 10,
      //puntosArriba: true,
      colorPrimario: appTheme.darkTheme ? accentColor : Colors.red,
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
