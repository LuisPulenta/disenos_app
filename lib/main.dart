import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/layout_model.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/launcher_tablet_page.dart';
import 'src/theme/theme.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => LayoutModel(),
    child: ChangeNotifierProvider(
      create: (_) => ThemeChanger(0),
      child: const MyApp(),
    ),
  ),
);

// void main() => runApp(
//       MultiProvider(
//         providers: [
//           Provider(create: (_) => ThemeChanger(2)),
//           Provider(create: (_) => LayoutModel()),
//         ],
//         child: MyApp(),
//       ),
//     );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          //print('Orientation $orientation');

          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
      theme: currentTheme,
    );
  }
}
