import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: Text(
            "Escolha do App:",
            textAlign: TextAlign.center,
            ),
          ), 
        ],
      ),
    );
  }
}