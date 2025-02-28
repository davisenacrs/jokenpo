import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem  = "Escolha uma opcção abaixo.";

  void _opcaoSelecionada(String escolhadoUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhadoUsuario);

  switch(escolhaApp){
  case "pedra":
    setState(() {
    this._imagemApp = AssetImage("imagens/pedra.png");
    });
    break;
  case "tesoura":
    setState(() {
    this._imagemApp = AssetImage("imagens/tesoura.png");
    });
    break;
  case "papel":
    setState(() {
    this._imagemApp = AssetImage("imagens/papel.png");
    });
    break;
  }

  if(
    (escolhadoUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhadoUsuario == "tesoura" && escolhaApp == "papel") ||
    (escolhadoUsuario == "papel" && escolhaApp == "pedra")
  ){
    setState(() {
      this._mensagem = "Parabéns! Você ganhou :)";
    });

  }else if(
    (escolhaApp == "pedra" && escolhadoUsuario == "tesoura") ||
    (escolhaApp == "tesoura" && escolhadoUsuario == "papel") ||
    (escolhaApp == "papel" && escolhadoUsuario == "pedra")
  )
  {
    setState(() {
      this._mensagem  = "Você perdeu :(";
    });
  }else{
    setState(() {
      this._mensagem  = "Empatamos ;)";

    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("JokenPo",
            style: TextStyle( fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1 - text
          // 2 - imagem
          // 3 - text resultado
          // linha 3 imagens
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png",  height: 95,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada( "papel"),
                child: Image.asset("imagens/papel.png", height: 95,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 95,),
              ),
              /*
              Image.asset("imagens/pedra.png", height: 95,),
              Image.asset("imagens/papel.png", height: 95,),
              Image.asset("imagens/tesoura.png", height: 95,)
               */
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(color: Colors.orangeAccent,),
    );
  }
}
