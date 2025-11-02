import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [const PinterestGrid(), _PinterestMenuLocation()],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
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
      child: SizedBox(
        width: widthPantalla,
        child: Row(
          children: [
            const Spacer(),
            PinterestMenu(
              mostrar: mostrar,
              backgroundColor: appTheme.darkTheme
                  ? appTheme.currentTheme.scaffoldBackgroundColor
                  : Color.fromARGB(255, 226, 226, 216),
              activeColor: appTheme.darkTheme
                  ? accentColor
                  : const Color.fromARGB(255, 179, 3, 38),
              inactiveColor: appTheme.darkTheme
                  ? const Color.fromARGB(255, 146, 146, 152)
                  : accentColor,
              items: [
                PinterestButton(
                  icon: Icons.pie_chart,
                  onPressed: () {
                    //print('Icon pie_chart');
                  },
                ),
                PinterestButton(
                  icon: Icons.search,
                  onPressed: () {
                    //print('Icon search');
                  },
                ),
                PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () {
                    //print('Icon notifications');
                  },
                ),
                PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () {
                    //print('Icon supervised_user_circle');
                  },
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = ScrollController();

  //------------ initState --------------
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
    });
    super.initState();
  }

  //------------ dispose --------------
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //------------ Pantalla --------------
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
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: count,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem(index: index),
        childCount: items.length,
      ),
    );
  }
}

//-----------------------------------------------------------------------
class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
