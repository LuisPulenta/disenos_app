import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';
import '../theme/theme.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Teléfono'),
        centerTitle: true,
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      body: Center(child: _ListaOpciones()),
      drawer: _MenuPrincipal(),
    );
  }
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) =>
          Divider(color: appTheme.primaryColorLight),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[i].name),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].screen),
          );
        },
      ),
    );
  }
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.teal[200],
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text('LN', style: TextStyle(fontSize: 50)),
              ),
            ),
          ),
          Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: accentColor),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              onChanged: (value) {
                appTheme.darkTheme = value;
              },
              activeColor: accentColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen, color: accentColor),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: appTheme.customTheme,
              onChanged: (value) {
                appTheme.customTheme = value;
              },
              activeColor: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
