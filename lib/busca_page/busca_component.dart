import 'package:flutter/material.dart';

import 'busca_controller.dart';

mixin class BuscaPageComponent {
  final BuscaPageController controller = BuscaPageController();

  late Orientation orientacao;

  initialize(BuildContext context) async {
    controller.context = context;
    orientacao = MediaQuery.of(context).orientation;
  }

  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          tituloTopo(),
          SizedBox(height: orientacao == Orientation.portrait ? 100 : 50),
          iconeCEP(),
          SizedBox(height: orientacao == Orientation.portrait ? 100 : 50),
          digiteCEP(),
          SizedBox(height: orientacao == Orientation.portrait ? 10 : 5),
          barraPesquisaCEP(),
          SizedBox(height: orientacao == Orientation.portrait ? 100 : 50),
          resultadoPesquisaCEP(),
        ],
      ),
    );
  }

  Widget tituloTopo() {
    return Center(
      heightFactor: 1,
      child: Text(
        'Aplicativo para buscar CEP',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget iconeCEP() {
    return SizedBox(
      height: orientacao == Orientation.portrait ? 200 : 150,
      width: orientacao == Orientation.portrait ? 200 : 200,
      child: Icon(Icons.location_on_outlined, color: Colors.black, size: 150),
    );
  }

  Widget digiteCEP() {
    return Text(
      'Digite o CEP para busca:',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget barraPesquisaCEP() {
    return Container(
      height: orientacao == Orientation.portrait ? 50 : 50,
      width: orientacao == Orientation.portrait ? 500 : 500,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Ex: 22010000',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          suffixIcon: const Icon(Icons.search, color: Colors.black, size: 30),
        ),
      ),
    );
  }

  Widget resultadoPesquisaCEP() {
    return Container(
      height: orientacao == Orientation.portrait ? 170 : 163,
      width: orientacao == Orientation.portrait ? 500 : 500,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rua:', style: TextStyle(fontSize: 20)),
          Text('Bairro:', style: TextStyle(fontSize: 20)),
          Text('Cidade:', style: TextStyle(fontSize: 20)),
          Text('Estado:', style: TextStyle(fontSize: 20)),
          Text('IBGE:', style: TextStyle(fontSize: 20)),
        ],
      ),
      padding: EdgeInsets.only(left: 10, top: 10),
    );
  }
}
