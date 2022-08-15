import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PinterestGrid(),
              _PinterestMenuLocation(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }

    return Positioned(
        bottom: 15,
        child: Container(
          width: widthPantalla,
          child: Row(
            children: [
              Spacer(),
              PinterestMenu(
                mostrar: mostrar,
                backgroundColor: appTheme.darkTheme
                    ? appTheme.currentTheme.scaffoldBackgroundColor
                    : Colors.yellow,
                activeColor: appTheme.darkTheme ? accentColor : Colors.teal,
                inactiveColor: Colors.grey,
                items: [
                  PinterestButton(
                      icon: Icons.pie_chart,
                      onPressed: () {
                        print('Icon pie_chart');
                      }),
                  PinterestButton(
                      icon: Icons.search,
                      onPressed: () {
                        print('Icon search');
                      }),
                  PinterestButton(
                      icon: Icons.notifications,
                      onPressed: () {
                        print('Icon notifications');
                      }),
                  PinterestButton(
                      icon: Icons.supervised_user_circle,
                      onPressed: () {
                        print('Icon supervised_user_circle');
                      }),
                ],
              ),
              Spacer(),
            ],
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        //Ocultar menú
        //print('OCULTAR');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        //Mostrar menú
        //print('MOSTRAR');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      ;
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
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 4;
    } else {
      count = 2;
    }
    return GridView.custom(
      controller: controller,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: count,
        pattern: [
          WovenGridTile(1),
          WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
