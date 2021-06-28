import 'package:controle_diet/tela2.dart';
import 'package:controle_diet/tela3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
         '/home':(context)=> MyHomePage(title: 'Controle da Dieta'),
         '/Tela2':(context)=> Tela2(),
         '/Tela3':(context)=> Tela3(),
      },
      
    );
  }
}
