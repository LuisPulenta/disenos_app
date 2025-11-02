import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/colores_page.dart';
import '../pages/pages.dart';
import '../retos/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(
    route: 'encabezados',
    name: 'Encabezados',
    screen: const HeadersPage(),
    icon: FontAwesomeIcons.heading,
  ),
  _Route(
    route: 'cuadroanimado',
    name: 'Cuadro animado',
    screen: const AnimacionesPage(),
    icon: FontAwesomeIcons.peopleCarryBox,
  ),
  _Route(
    route: 'cuadroanimado2',
    name: 'Cuadro animado 2',
    screen: const CuadradoAnimadoPage(),
    icon: FontAwesomeIcons.peopleCarryBox,
  ),

  _Route(
    route: 'barraprogreso',
    name: 'Barra progreso',
    screen: const GraficasCircularesPage(),
    icon: FontAwesomeIcons.circleNotch,
  ),

  _Route(
    route: 'slideshow',
    name: 'Slideshow',
    screen: const SlideshowPage(),
    icon: FontAwesomeIcons.slideshare,
  ),

  _Route(
    route: 'pinterest',
    name: 'Pinterest',
    screen: const PinterestPage(),
    icon: FontAwesomeIcons.pinterest,
  ),

  _Route(
    route: 'emergency',
    name: 'Emergency',
    screen: const EmergencyPage(),
    icon: FontAwesomeIcons.truckMedical,
  ),

  _Route(
    route: 'silvers',
    name: 'Silvers',
    screen: const SliverListPage(),
    icon: FontAwesomeIcons.mobile,
  ),
  _Route(
    route: 'colores',
    name: 'Colores',
    screen: const ColoresPage(),
    icon: FontAwesomeIcons.shapes,
  ),
];

// static Map<String, Widget Function(BuildContext)> getAppRoutes() {
//   Map<String, Widget Function(BuildContext)> appRoutes = {};

//   appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

//   for (final option in menuOptions) {
//     appRoutes.addAll({option.route: (BuildContext context) => option.screen});
//   }
//   return appRoutes;
// }

// static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//   return MaterialPageRoute(
//     builder: (context) => const AlertScreen(),
//   );
// }

//----------------------------------------------------------------------
class _Route {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  _Route({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
  });
}
