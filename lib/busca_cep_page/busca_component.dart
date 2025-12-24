import 'package:flutter/material.dart';

import 'busca_controller.dart';

mixin class BuscaPageComponent {
  final BuscaPageController controller = BuscaPageController();

  late Orientation orientacao;

  initialize(BuildContext context) async {
    controller.context = context;
    this.orientacao = MediaQuery.of(context).orientation;
  }

  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          Center(
            heightFactor: 1,
            child: Text(
              'Aplicativo para buscar CEP',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(height: 100, width: 100),
          Container(height: 200, width: 200, color: Colors.red),
          Container(height: 100, width: 100),
          Container(
            child: Container(height: 50, width: 500, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget campoImagemCEP() {
    return Center(
      child: Container(
        width: orientacao == Orientation.portrait ? 100 : 100,
        height: orientacao == Orientation.portrait ? 100 : 100,
        color: Colors.red,
      ),
    );
  }

  Widget CampoDescricaoCEP() {
    return Container(width: 300, height: 150, color: Colors.red);
  }
}
