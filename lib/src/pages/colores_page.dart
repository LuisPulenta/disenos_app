import 'package:flutter/material.dart';

class ColoresPage extends StatelessWidget {
  const ColoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colores'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.brown,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.teal,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.blueAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.yellowAccent,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.greenAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.orangeAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.purpleAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 90,
                    width: 50,
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
