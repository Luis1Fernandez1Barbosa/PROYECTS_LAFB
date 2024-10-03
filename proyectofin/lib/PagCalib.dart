import 'package:flutter/material.dart';
import 'package:proyectofin/main.dart';


class PagCalib extends StatelessWidget {
  final double potencia;
  final double voltaje;
  final double ampacidad;
  final double calibre;
  final String logO;

  const PagCalib({Key? key, required this.potencia, required this.voltaje,
    required this.ampacidad, required this.calibre, required this.logO}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        title: 'RESULTADO',
        debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RESULTADO'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              alignment: Alignment.center,
              child: Text("SE REQUIERE CABLE DE CALIBRE: "+ calibre.toString()+" AWG\n",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("POTENCIA = "+potencia.toString()+" Watts[W]\n",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("VOLTAJE = "+voltaje.toString()+" Volts[V]\n",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("AMPACIDAD = "+ampacidad.toString()+" Ampere[A]\n",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            SizedBox(
              child: Image.network('/lib/assets/AWG.jpg'),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  MyApp()
              ));
            },
                child: Text("\n"+logO))
          ],
        ),
      ),
    ),);
  }
}