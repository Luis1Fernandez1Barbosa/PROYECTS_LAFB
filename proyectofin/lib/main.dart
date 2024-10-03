import 'package:flutter/material.dart';
import 'PagIni.dart';
import 'PagTCab.dart';
import 'PagCalen.dart';
import 'PagMap.dart';
import 'PagGraf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROYECTO 1',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'CALCULADORA DE CABLE ELECTRICO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginaAct = 0;

  List<Widget> _pag = [
    PagIni(),
    PagTCab(),
    PagMap(),
    PagCalen(),
    PagGraf(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('CABLEADO ELECTRICO RESIDENCIAL E INDUSTRIAL'),
        ),
        body: _pag[_paginaAct],                            //_paginaAct==0 ? PagCalc() : PagPer(),
        //********************************BOTON*******************************************
        bottomNavigationBar: BottomNavigationBar(
          onTap:(index){
            setState(() {
              _paginaAct=index;
            });
          },
          currentIndex: _paginaAct,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.album_outlined), label:"INICIO", backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.align_horizontal_center_outlined), label:"TIPOS", backgroundColor: Colors.brown),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label:"MAPA", backgroundColor: Colors.grey),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_sharp), label:"CALENDARIO", backgroundColor: Colors.green),
            BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label:"GRAFICOS", backgroundColor: Colors.deepOrange),
            //BottomNavigationBarItem(icon: Icon(Icons.timelapse), label:"TIME", backgroundColor: Colors.cyan),
          ],
        ),
        /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
      ),);
  }
}
