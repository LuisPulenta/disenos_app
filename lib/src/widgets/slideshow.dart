import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(builder: (BuildContext context) {
          Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
          Provider.of<_SlideshowModel>(context).colorSecundario =
              colorSecundario;
          Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
          Provider.of<_SlideshowModel>(context).bulletSecundario =
              bulletSecundario;
          return _CrearEstructuraSlideshow(
              puntosArriba: puntosArriba, slides: slides);
        })),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        puntosArriba
            ? _Dots(
                totalSlides: slides.length,
              )
            : Container(),
        Expanded(
            child: _Slides(
          slides: slides,
        )),
        !puntosArriba
            ? _Dots(
                totalSlides: slides.length,
              )
            : Container(),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides({required this.slides});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: [
        //   _Slide('assets/slide-1.svg'),
        //   _Slide('assets/slide-2.svg'),
        //   _Slide('assets/slide-3.svg'),
        // ],

        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(
    this.slide,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots({
    required this.totalSlides,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (index) => _Dot(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({required this.index});
  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double curretPage) {
    _currentPage = curretPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
    //notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color) {
    _colorSecundario = color;
    //notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double tamano) {
    _bulletPrimario = tamano;
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario(double tamano) {
    _bulletSecundario = tamano;
  }
}
