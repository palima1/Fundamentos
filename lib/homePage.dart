import 'package:controle_diet/alimentos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double meta = 2000;
  double consumido = 0;
  double cafeManha= 0;
  //int _counter = 0;
  final semana = [
    'dom',
    'seg',
    'ter',
    'qua',
    'qui',
    'sex',
    'sab',
  ];
  
  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '${semana[data.weekday]}, ${data.day}/${data.month}'),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Meta diária - Consumido = Disponível',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$meta kcal - $consumido kcal = ${meta-consumido} kcal',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text('Alimentação', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Café da Manhã', style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  '$cafeManha kcal',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Icon(Icons.add_circle_outline),
                tileColor: Colors.cyan[200],
                onTap: () async {
                  dynamic resposta =
                      await Navigator.of(context).pushNamed('/Tela2');
                  if (resposta != null) {
                    setState(() {
                      consumido = resposta['alimento']['kcal'] * resposta['quantidade'];
                      cafeManha = resposta['alimento']['kcal'] * resposta['quantidade'];
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Almoço', style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  '0kcal',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Icon(Icons.add_circle_outline),
                tileColor: Colors.cyan[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Jantar', style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  '0kcal',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Icon(Icons.add_circle_outline),
                tileColor: Colors.cyan[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Lanches', style: TextStyle(fontSize: 20)),
                subtitle: Text(
                  '0kcal',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Icon(Icons.add_circle_outline),
                tileColor: Colors.cyan[200],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
