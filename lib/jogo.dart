import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = Text(
    "Escolha uma opção Abaixo:",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
    )
    );

  void _opcaoSelecionada(String EscolhaUsuario){

    var opcoes =["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch( escolhaApp ){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

        case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      
    }

    if(
      (EscolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (EscolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (EscolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = Text(
          "Parabéns!!! Você ganhou :)",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
          )
          );
      });
    }else if(
      (EscolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
      (EscolhaUsuario == "papel" && escolhaApp == "tesoura") ||
      (EscolhaUsuario == "pedra" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = Text(
          "AHHH!!! Você Perdeu :(",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
          ),
          );
      });
    }else{
      setState(() {
        this._mensagem = Text(
          "UUUU!!! Empatamos ;)",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
          ),
          );
      });
    }


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: Text(
            "Escolha do App:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          ), 
          Image(
              image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), 
            child: _mensagem
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("papel"),
                child:  Image.asset("images/papel.png",height: 100),
              ),
              GestureDetector(
                onTap: () =>  _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png",height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}