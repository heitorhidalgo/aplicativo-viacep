import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuscaPageController extends GetxController {
  late BuildContext context;

  //TextEditingController para chamar o teclado
  final TextEditingController digitaCep = TextEditingController();

  //funcao para busca
  void buscarCep() {
    String cepDigitado = digitaCep.text;
    print("teste: $cepDigitado");
  }
}
