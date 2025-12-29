import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'busca_controller.dart';

class BuscaComponent extends StatefulWidget {
  const BuscaComponent({super.key});

  @override
  State<BuscaComponent> createState() => _BuscaComponentState();
}

class _BuscaComponentState extends State<BuscaComponent> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    orientacao = MediaQuery.of(context).orientation;

    return Scaffold(body: body());
  }

  final BuscaPageController controller = BuscaPageController();

  late Orientation orientacao;

  bool _loading = false;

  String? resultado;
  String logradouro = '';
  String bairro = '';
  String cidade = '';
  String estado = '';
  String ddd = '';

  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            tituloTopo(),
            SizedBox(height: orientacao == Orientation.portrait ? 80 : 20),
            iconeCEP(),
            SizedBox(height: orientacao == Orientation.portrait ? 80 : 20),
            digiteCEP(),
            SizedBox(height: orientacao == Orientation.portrait ? 10 : 5),
            barraPesquisaCEP(),
            SizedBox(height: orientacao == Orientation.portrait ? 50 : 20),
            resultadoPesquisaCEP(),
            SizedBox(height: orientacao == Orientation.portrait ? 50 : 20),
          ],
        ),
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
      child: Icon(
        Icons.local_post_office_outlined,
        size: 140,
        color: Colors.black,
      ),
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
        controller: controller.digitaCep,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Ex: 22010000',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 30),
            onPressed: () {
              buscarCep();
            },
          ),
        ),
      ),
    );
  }

  resultadoPesquisaCEP() {
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: orientacao == Orientation.portrait ? 150 : 153,
      width: orientacao == Orientation.portrait ? 500 : 500,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Logradouro: $logradouro', style: TextStyle(fontSize: 18)),
          Text('Bairro: $bairro', style: TextStyle(fontSize: 18)),
          Text('Cidade: $cidade', style: TextStyle(fontSize: 18)),
          Text('Estado: $estado', style: TextStyle(fontSize: 18)),
          Text('DDD: $ddd', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  buscarCep() async {
    _loading = true;

    String cepDigitado = controller.digitaCep.text;

    Uri url = Uri.parse("https://viacep.com.br/ws/$cepDigitado/json/");

    http.Response response;

    response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);

      setState(() {
        logradouro = retorno["logradouro"];
        bairro = retorno["bairro"];
        cidade = retorno["localidade"];
        estado = retorno["estado"];
        ddd = retorno["ddd"];
      });
      //
      _loading = false;
    } else {
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fechar', style: TextStyle(fontSize: 18)),
                ),
              ],
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Erro de CEP', style: TextStyle(fontSize: 23)),
                ],
              ),
              contentPadding: const EdgeInsets.all(15),
              content: const Text(
                'O CEP digitado é inválido',
                style: TextStyle(fontSize: 18),
              ),
            ),
      );
    }
  }
}
