import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construirCard(),
      appBar: _construirAppBar()
    );
  }

  Widget _construirCard() {
    return SizedBox(
      height: 290,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [_construirImagemCard(), _construirTextoCard()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirTextoCard() {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        'Bolo de Milho',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _construirImagemCard() {
    return Image.network(
      'https://570341-1841894-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/10/bolo-milho-recheado-curau-768x619.jpg',
      fit: BoxFit.fill,
      height: 258,
      width: 400,
    );
  }

  AppBar _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}
