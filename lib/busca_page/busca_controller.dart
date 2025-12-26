import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuscaPageController extends GetxController {
  late BuildContext context;

  final TextEditingController digitaCep = TextEditingController();

  void buscarCep() {
    String cepDigitado = digitaCep.text;
    print("teste: $cepDigitado");
  }
}
