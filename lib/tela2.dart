import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alimentos.dart';

class Tela2 extends StatefulWidget {
  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            ExpansionTile(title: Text('Frutas'),
            children: [
            ListTile(title: Text('Banana Prata'),
            onTap: ()async{
                 final resposta = await Navigator.of(context).pushNamed
                 ('/Tela3', arguments: Alimentos.alimentos['banana prata']);
                 Navigator.of(context).pop(resposta);
                },),
            ListTile(title: Text('Mamão'),
            onTap: ()async{
                 final resposta = await Navigator.of(context).pushNamed
                 ('/Tela3', arguments: Alimentos.alimentos['mamão']);
                },),
            ListTile(title: Text('Abacaxi'),
            ),
          ],),
          ),  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            ExpansionTile(title: Text('Leite'), 
            children: [
            ListTile(title: Text('Leite Integral'),),
            ListTile(title: Text('Leite Desnatado'),),
          ],),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('voltar'))
        ],
      ),
    );
  }
}


