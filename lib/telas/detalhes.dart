import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _construirAppBar();
  }

  AppBar _construirAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}