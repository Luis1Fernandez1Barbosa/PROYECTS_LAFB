import 'package:flutter/material.dart';

class PagTCab extends StatelessWidget {
  //const PagTCab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TIPO DE AISLAMIENTO',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIPO DE AISLAMIENTO'),
        backgroundColor: Colors.brown,
      ),
      body:  Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("\n\n",
                style: TextStyle(fontSize: 28.0),),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Los cables que se utilizan para instalaciones en viviendas, "
                  "oficinas y edificaciones industriales, tienen diferentes tipos de "
                  "asilamientos y sus nombres se pueden encontrar en él mismo, "
                  "algunos aislamientos son: \n\n",
                style: TextStyle(fontSize: 18.0),),
            ),SizedBox(
              child: Image.network('/lib/assets/Ais0.jpg'),width: 350,height: 300,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("     a)	A 75 °C - RHW, THHW, THHW-LS, THW, THW-LS, THWN, XHHW,"
                  " USE, ZW"+"\n",
                style: TextStyle(fontSize: 18.0),),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("     b)	A 90 °C - SA, SIS, FEP, RHH, RHW-2, THHN, THHW, "
                  "THHWLS, THW-2, THWN-2, USE-2, XHH, XHHW, XHHW2, ZW-2"+"\n\n",
                style: TextStyle(fontSize: 18.0),),
            ),
            SizedBox(
              child: Image.network('/lib/assets/Ais1.jpg'),width: 450,height: 400,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Algunas abreviaturas son la siguiente:\n\n"
                  +"    -R: Aislamiento de hule.\n"
                  +"    -T: Aislamiento termoplástico.\n"
                  +"    -X: Aislamiento de polímero sintético barnizado.\n"
              	  +"    -H: resistente al calor hasta 75˚C (167° F).\n"
                  +"    -HH: resistente al calor hasta 90˚C (194° F).\n"
                  +"    -W: resistente a la humedad.\n"
                  +"    -UF: para uso subterráneo.\n"
                  +"    -N: cubierta de nylon.\n"
                  +"    -FEP: Propileno etileno fluorado (90 °C).\n"
                  +"    -SA: Silicon y asbesto (90 °C – 125 °C).\n"
                  +"    -SIS: Sintético resistente al calor (90 °C).\n"
                  +"    -USE: Conductor monofásico para acometida subterránea (75 °C).\n"
                  +"\n\n",
                  style: TextStyle(fontSize: 18.0),
            ),),
            SizedBox(
              child: Image.network('/lib/assets/Ais2.jpg'),width: 250,height: 200,
            ),
          ],
        ),
      ),),);
    //);
  }
}
