import 'dart:convert';
import 'package:cozinhando_casa/modelos/receita.dart';
import 'package:flutter/material.dart';
import 'detalhes.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(body: _construirListaCard(), appBar: _construirAppBar());
  }

  Widget _construirListaCard() {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
        builder: (context, snapshot) {
          List<dynamic> receitas = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Receita receita = Receita.fromJson(receitas[index]);
              return _construirCard(receita.foto, receita.titulo);
            },
            itemCount: receitas == null ? 0 : receitas.length,
          );
        });
  }

  Widget _construirCard(foto, titulo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Detalhes()
        ));
      },
      child: SizedBox(
        height: 290,
        child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  _construirImagemCard(foto),
                  _construirImagemGradienteCard(),
                  _construirTituloCard(titulo)],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirTituloCard(titulo) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _construirImagemCard(foto) {
    return Image.asset(foto,
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

  _construirImagemGradienteCard(){
    return Container(
      height: 258,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ]
        )
      ),
    );
  }
}
