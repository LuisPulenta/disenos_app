import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

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
          color: appTheme.darkTheme ? accentColor : const Color(0xffff0000)),
      //HeadersCuadrado(),
      //HeadersBordesRedondeados(),
    );
  }
}
