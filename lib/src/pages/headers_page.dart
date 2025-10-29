import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HeadersPage'),
      //   centerTitle: true,
      // ),
      body: Headers(
        color: appTheme.darkTheme ? accentColor : const Color(0xffff0000),
      ),
      // HeadersCuadrado(),
      //HeadersBordesRedondeados(),
    );
  }
}
