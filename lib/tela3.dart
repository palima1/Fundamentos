import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela3 extends StatefulWidget {
  @override
  _Tela3State createState() => _Tela3State();
}

class _Tela3State extends State<Tela3> {
  dynamic alimento;
  int quantidade = 1;

  String tamanho = 'pequena';
  double kcal = 30;

  @override
  void didChangeDependencies() {
    alimento = ModalRoute.of(context).settings.arguments;
    kcal = alimento['unidade pequena'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(alimento['nome']),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selecione a quantidade e a medida:',
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: TextFormField(
                  initialValue: quantidade.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade:',
                  ),
                  onChanged: (text) {
                    if (text.isEmpty) return;
                    setState(() {
                      quantidade = int.parse(text);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        if (value == 0) {
                          tamanho = 'pequena';
                          kcal = alimento ['unidade pequena'];
                      } else if (value == 1) {
                        tamanho = 'media';
                          kcal = alimento ['unidade media'];
                      } else {
                        tamanho = 'grande';
                          kcal = alimento ['unidade grande'];
                      }
                      });
                      
                    },
                    child: ListTile(
                      title: Text('Medida $tamanho ($kcal)'),
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('unidade pequena'),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text('media'),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text('grande'),
                            value: 2,
                          )
                        ]),
              ),
              Text(
                '$quantidade unidade pequena (${kcal}g) = total calorias(${quantidade * kcal}kcal)',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      'quantidade': quantidade,
                      'alimento': alimento,
                      'kcal': tamanho,
                    });
                  },
                  child: Text('Confirmar')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Você gostou desta opção?',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onPressed: () {}),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
