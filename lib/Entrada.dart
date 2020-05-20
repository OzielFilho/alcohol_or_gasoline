import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Entrada extends StatefulWidget {
  @override
  _EntradaState createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  TextEditingController _alcool = TextEditingController();
  TextEditingController _gasolina = TextEditingController();
  String _textoResultado = "";

  void _resultado(){
    double precoAlcool = double.tryParse(_alcool.text);
    double precoGasolina = double.tryParse(_gasolina.text);
    if(precoAlcool == null || precoGasolina == null){
        setState(() {
          _textoResultado = "Numero invalido! (Digite numeros usando '.') ";
        });

    }else{
      if(precoAlcool/precoGasolina >=0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
      _limpar();
    }
  }
  void  _limpar(){
    setState(() {
      _alcool.text = "";
      _gasolina.text = "";
    });


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Alcool x Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Padding(//Imagem
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png"),),
              Padding(//texto 1
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,),),),
              TextField(//caixa de texto 1
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Preço Alcool,ex : 1.15",),
                controller: _alcool,),
              TextField(//caixa de texto 2
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Preço gasolina,ex : 3.15"),
                controller: _gasolina,),
              Padding(//botao
                  padding: EdgeInsets.only(bottom: 1),
                  child: RaisedButton(
                    child: Text("Save",style: TextStyle(color: Colors.white),),
                    color: Colors.indigo,
                    onPressed: _resultado,)
              ),
              Padding(//resultado
                padding: EdgeInsets.only(top: 20),
                child: Text(_textoResultado,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),)
            ],),),
          )
    );
  }
}
