import 'package:disenos_app/models/layout_model.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Tablet'),
        centerTitle: true,
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      body: Row(
        children: [
          SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: appTheme.darkTheme
                ? Colors.grey
                : appTheme.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutModel.currentPage,
          )
        ],
      ),
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
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
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
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].screen;

          //Navigator.push(context,MaterialPageRoute(builder: (context) => pageRoutes[i].screen));
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
                child: const Text(
                  'LN',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _ListaOpciones(),
          ),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: accentColor,
            ),
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
            leading: Icon(
              Icons.add_to_home_screen,
              color: accentColor,
            ),
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
