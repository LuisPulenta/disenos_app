import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          // const Positioned(
          //     bottom: -10,
          //     right: 0,
          //     child: Icon(
          //       Icons.abc,
          //       size: 100,
          //     )),
          Positioned(bottom: -10, right: -10, child: _BotonNewList()),
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------
class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Container(
      width: size.width * 0.9,
      height: 100,
      color: Colors.transparent,
      child: ButtonTheme(
        minWidth: size.width * 0.9,
        height: 100,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: appTheme.darkTheme
                ? accentColor
                : const Color(0xffed6762),
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
          ),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
              color: appTheme.darkTheme
                  ? appTheme.currentTheme.scaffoldBackgroundColor
                  : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------
class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 210,
            maxheight: 240,
            child: Container(
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,
              child: const Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

//-----------------------------------------------------------------------------
class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.maxheight ||
        child != oldDelegate.child;
  }
}

//-----------------------------------------------------------------------------
class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: appTheme.darkTheme ? Colors.grey : const Color(0xff532128),
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 32,
              child: Container(
                width: 110,
                height: 8,
                color: appTheme.darkTheme
                    ? Colors.grey
                    : const Color(0xfff7cdd5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 00),
              child: const Text(
                'List',
                style: TextStyle(
                  color: Color(0xffd93a30),
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// //-----------------------------------------------------------------------------
// class _ListaTareas extends StatelessWidget {
//   final items = [
//     const _ListItem('Orange', Color(0xffF08F66)),
//     const _ListItem('Family', Color(0xffF2A38A)),
//     const _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     const _ListItem('Books', Color(0xffFCEBAF)),
//     const _ListItem('Orange', Color(0xffF08F66)),
//     const _ListItem('Family', Color(0xffF2A38A)),
//     const _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     const _ListItem('Books', Color(0xffFCEBAF)),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (BuildContext context, int index) => items[index],
//     );
//   }
// }

//-----------------------------------------------------------------------------
class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: appTheme.darkTheme ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
