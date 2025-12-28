import 'package:aplicativo_viacep/busca_page/busca_component.dart';
import 'package:flutter/material.dart';

class BuscaPage extends StatefulWidget with BuscaPageComponent {
   BuscaPage({super.key});

  @override
  State<BuscaPage> createState() => _BuscaPageState();
}

class _BuscaPageState extends State<BuscaPage> with BuscaPageComponent {
  @override
  build(BuildContext context) {
    initialize(context);
    return Scaffold(body: body());
  }
}
