import 'package:flutter/material.dart';
import 'package:proyectofin/PagCalib.dart';

TextEditingController _alumno = TextEditingController();
TextEditingController _cuenta = TextEditingController();

TextEditingController _potencia = TextEditingController();
TextEditingController _voltaje = TextEditingController();
//TextEditingController _temperatura = TextEditingController();

class PagIni extends StatefulWidget {
  @override
  _pagInicio createState() => _pagInicio();
}

class _pagInicio extends State<PagIni> {
//class PagIni extends StatelessWidget {
  //const PagInicio({Key? key, required this.title}) : super(key: key);

  //final String title;
  String pot = "";
  String volt = "";
  double P = 0.0;
  double V = 0.0;
  double T = 0.0;
  double I = 0.0;
  double AWG = 0.0;

  int tempOpc = 1;
  int _value = 1;
  int _value2 = 1;

  bool tCm1 = false;
  bool tCM1 = false;

  bool cobreC = false;
  bool aluminioC = false;

  String logOut = 'REGRESAR';

  //-----------------Proceso principal de elección de cableado---------------------------------
  void materialCable() {
    if (cobreC == true && aluminioC == false) {
      if (tCm1 == true && tCM1 == false) {
        calibreCob75(I);
      } else if (tCM1 == true && tCm1 == false) {
        calibreCob90(I);
      }
    } else if (aluminioC == true && cobreC == false) {
      if (tCm1 == true && tCM1 == false) {
        calibreAlu75(I);
      } else if (tCM1 == true && tCm1 == false) {
        calibreAlu90(I);
      }
    }
  }

  //----------------------------------------------------------------------------------------------
  //---------------Calibre Cobre a 75° C-----------------------------
  void calibreCob75(double value) {
    if (I > 0 && I <= 20) {
      AWG = 14;
    } else if (I > 20 && I <= 25) {
      AWG = 12;
    } else if (I > 25 && I <= 35) {
      AWG = 10;
    } else if (I > 35 && I <= 50) {
      AWG = 8;
    } else if (I > 50 && I <= 65) {
      AWG = 6;
    } else if (I > 65 && I <= 85) {
      AWG = 4;
    } else if (I > 85 && I <= 100) {
      AWG = 3;
    } else if (I > 100 && I <= 115) {
      AWG = 2;
    } else if (I > 115 && I <= 130) {
      AWG = 1;
    }
    //-------------------kcmil-------------------
    else if (I > 130 && I <= 150) {
      AWG = 0.1;
    } else if (I > 150 && I <= 175) {
      AWG = 0.01;
    } else if (I > 175 && I <= 200) {
      AWG = 0.001;
    } else if (I > 200 && I <= 230) {
      AWG = 0.0001;
    }
    //---------------------------------------------
    else if (I > 230 && I <= 255) {
      AWG = 250;
    } else if (I > 255 && I <= 285) {
      AWG = 300;
    } else if (I > 285 && I <= 310) {
      AWG = 350;
    } else if (I > 310 && I <= 335) {
      AWG = 400;
    } else if (I > 335 && I <= 380) {
      AWG = 500;
    } else if (I > 380 && I <= 420) {
      AWG = 600;
    } else if (I > 420 && I <= 460) {
      AWG = 700;
    } else if (I > 460 && I <= 475) {
      AWG = 750;
    } else if (I > 475 && I <= 490) {
      AWG = 800;
    } else if (I > 490 && I <= 520) {
      AWG = 900;
    } else if (I > 520 && I <= 545) {
      AWG = 1000;
    } else if (I > 545 && I <= 590) {
      AWG = 1250;
    } else if (I > 590 && I <= 625) {
      AWG = 1500;
    } else if (I > 625 && I <= 650) {
      AWG = 1750;
    } else if (I > 650 && I <= 665) {
      AWG = 2000;
    } else if (I > 665) {
      Text("\n!SE NECESITA OTRO TIPO DE CABLEADO\n");
    }
  }

  //---------------Calibre Cobre a 90° C-----------------------------
  void calibreCob90(double value) {
    if (I > 0 && I <= 14) {
      AWG = 18;
    } else if (I > 14 && I <= 18) {
      AWG = 16;
    } else if (I > 18 && I <= 25) {
      AWG = 14;
    } else if (I > 25 && I <= 30) {
      AWG = 12;
    } else if (I > 30 && I <= 40) {
      AWG = 10;
    } else if (I > 40 && I <= 55) {
      AWG = 8;
    } else if (I > 55 && I <= 75) {
      AWG = 6;
    } else if (I > 75 && I <= 95) {
      AWG = 4;
    } else if (I > 95 && I <= 115) {
      AWG = 3;
    } else if (I > 115 && I <= 130) {
      AWG = 2;
    } else if (I > 130 && I <= 145) {
      AWG = 1;
    }
    //-------------------kcmil-------------------
    else if (I > 145 && I <= 170) {
      AWG = 0.1;
    } else if (I > 170 && I <= 195) {
      AWG = 0.01;
    } else if (I > 195 && I <= 225) {
      AWG = 0.001;
    } else if (I > 225 && I <= 260) {
      AWG = 0.0001;
    }
    //---------------------------------------------
    else if (I > 260 && I <= 290) {
      AWG = 250;
    } else if (I > 290 && I <= 320) {
      AWG = 300;
    } else if (I > 320 && I <= 350) {
      AWG = 350;
    } else if (I > 350 && I <= 380) {
      AWG = 400;
    } else if (I > 380 && I <= 430) {
      AWG = 500;
    } else if (I > 430 && I <= 475) {
      AWG = 600;
    } else if (I > 475 && I <= 520) {
      AWG = 700;
    } else if (I > 520 && I <= 535) {
      AWG = 750;
    } else if (I > 535 && I <= 555) {
      AWG = 800;
    } else if (I > 555 && I <= 585) {
      AWG = 900;
    } else if (I > 586 && I <= 615) {
      AWG = 1000;
    } else if (I > 615 && I <= 665) {
      AWG = 1250;
    } else if (I > 665 && I <= 705) {
      AWG = 1500;
    } else if (I > 705 && I <= 735) {
      AWG = 1750;
    } else if (I > 735 && I <= 750) {
      AWG = 2000;
    } else if (I > 750) {
      Text("\n!SE NECESITA OTRO TIPO DE CABLEADO\n");
    }
  }

  //---------------Calibre Aluminio a 75° C-----------------------------
  void calibreAlu75(double value) {
    if (I > 0 && I <= 50) {
      AWG = 6;
    } else if (I > 50 && I <= 65) {
      AWG = 4;
    } else if (I > 65 && I <= 75) {
      AWG = 3;
    } else if (I > 75 && I <= 90) {
      AWG = 2;
    } else if (I > 90 && I <= 100) {
      AWG = 1;
      //-------------------kcmil-------------------
    } else if (I > 100 && I <= 120) {
      AWG = 0.1;
    } else if (I > 120 && I <= 135) {
      AWG = 0.01;
    } else if (I > 135 && I <= 155) {
      AWG = 0.001;
    } else if (I > 155 && I <= 180) {
      AWG = 0.0001;
    }
    //---------------------------------------------
    else if (I > 180 && I <= 205) {
      AWG = 250;
    } else if (I > 205 && I <= 230) {
      AWG = 300;
    } else if (I > 230 && I <= 250) {
      AWG = 350;
    } else if (I > 250 && I <= 270) {
      AWG = 400;
    } else if (I > 270 && I <= 310) {
      AWG = 500;
    } else if (I > 310 && I <= 340) {
      AWG = 600;
    } else if (I > 340 && I <= 375) {
      AWG = 700;
    } else if (I > 375 && I <= 385) {
      AWG = 750;
    } else if (I > 385 && I <= 395) {
      AWG = 800;
    } else if (I > 395 && I <= 425) {
      AWG = 900;
    } else if (I > 425 && I <= 445) {
      AWG = 1000;
    } else if (I > 445 && I <= 485) {
      AWG = 1250;
    } else if (I > 485 && I <= 520) {
      AWG = 1500;
    } else if (I > 520 && I <= 545) {
      AWG = 1750;
    } else if (I > 545 && I <= 560) {
      AWG = 2000;
    } else if (I > 560) {
      Text("\n!SE NECESITA OTRO TIPO DE CABLEADO\n");
    }
  }

  //---------------Calibre Aluminio a 90° C-----------------------------
  void calibreAlu90(double value) {
    if (I > 0 && I <= 55) {
      AWG = 6;
    } else if (I > 55 && I <= 75) {
      AWG = 4;
    } else if (I > 75 && I <= 85) {
      AWG = 3;
    } else if (I > 85 && I <= 100) {
      AWG = 2;
    } else if (I > 100 && I <= 115) {
      AWG = 1;
    }
    //-------------------kcmil-------------------
    else if (I > 115 && I <= 135) {
      AWG = 0.1;
    } else if (I > 135 && I <= 150) {
      AWG = 0.01;
    } else if (I > 150 && I <= 175) {
      AWG = 0.001;
    } else if (I > 175 && I <= 205) {
      AWG = 0.0001;
    }
    //---------------------------------------------
    else if (I > 205 && I <= 230) {
      AWG = 250;
    } else if (I > 230 && I <= 260) {
      AWG = 300;
    } else if (I > 260 && I <= 280) {
      AWG = 350;
    } else if (I > 280 && I <= 305) {
      AWG = 400;
    } else if (I > 305 && I <= 350) {
      AWG = 500;
    } else if (I > 350 && I <= 385) {
      AWG = 600;
    } else if (I > 385 && I <= 425) {
      AWG = 700;
    } else if (I > 425 && I <= 435) {
      AWG = 750;
    } else if (I > 435 && I <= 445) {
      AWG = 800;
    } else if (I > 445 && I <= 480) {
      AWG = 900;
    } else if (I > 480 && I <= 500) {
      AWG = 1000;
    } else if (I > 500 && I <= 545) {
      AWG = 1250;
    } else if (I > 545 && I <= 585) {
      AWG = 1500;
    } else if (I > 585 && I <= 615) {
      AWG = 1750;
    } else if (I > 615 && I <= 630) {
      AWG = 2000;
    } else if (I > 630) {
      Text("\n!SE NECESITA OTRO TIPO DE CABLEADO\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text('CALCULADORA DE CALIBRE[AWG]'),
        backgroundColor: Colors.red,
    ),
      body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //---------------------Cuadro para potencia--------------------------
          Text("POTENCIA [W] (max. 1500[kW]):\n",
              style: Theme.of(context).textTheme.headlineMedium),
          TextField(
            controller: _potencia,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            autofocus: true,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: 'escribir cifra en Watt[W] (sin prefijos)'),
          ),
          //---------------------Cuadro para voltaje--------------------------
          Text("\nVOLTAJE [V] (max. 2000[V]):\n",
              style: Theme.of(context).textTheme.headlineMedium),
          TextField(
            controller: _voltaje,
            keyboardType: TextInputType.number,
            maxLength: 9,
            textAlign: TextAlign.center,
            autofocus: true,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: 'escribir cifra en Volt[V] (sin prefijos)'),
          ),
          SizedBox(
            width: 15.0,
          ),
          //----------------Material del Conductor-------------------
          Text("MATERIAL DEL CONDUCTOR:\n",
              style: Theme.of(context).textTheme.headlineMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val!;
                    cobreC = true;
                    aluminioC = false;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("COBRE\f\f", style: Theme.of(context).textTheme.titleLarge),
              Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val!;
                      aluminioC = true;
                      cobreC = false;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              Text("ALUMINIO O RECUBIERTO DE COBRE\f\f",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          //---------------------------------------------------------
          //-------------Temperatura ambiente del conductor----------
          Text("RANGO DE TEMPERATURA DEL CONDUCTOR:\n",
              style: Theme.of(context).textTheme.headlineMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 2,
                  groupValue: _value2,
                  onChanged: (val) {
                    setState(() {
                      _value2 = val!;
                      tCm1 = true;
                      tCM1 = false;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              Text("75° C (167° F)\f",
                  style: Theme.of(context).textTheme.titleLarge),
              Radio(
                  value: 3,
                  groupValue: _value2,
                  onChanged: (val) {
                    setState(() {
                      _value2 = val!;
                      tCM1 = true;
                      tCm1 = false;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              Text("90° C (194° F)\f",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          //---------------------------------------------------
          /*TextField(
            controller: _temperatura,
            keyboardType: TextInputType.number,
            maxLength: 3,
            textAlign: TextAlign.center,
            autofocus: true,
            style: TextStyle(fontSize: 20),
            decoration:
                InputDecoration(hintText: 'RANGO DE TEMP DEL CONDUCTOR [°C]'),
          ),*/
          ElevatedButton(
              onPressed: () {
                pot = _potencia.text;
                P = double.parse(pot);
                volt = _voltaje.text;
                V = double.parse(volt);

                I = P / V;

                materialCable();
                print(P);
                print(V);
                print(I);
                print(AWG);
                print(tCm1);
                print(tCM1);

                _potencia.text="";
                _voltaje.text="";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PagCalib(
                            potencia: P,
                            voltaje: V,
                            ampacidad: I,
                            calibre: AWG,
                            logO: logOut)));
              },
              child: Text(
                "CALCULAR AMPACIDAD Y CALIBRE"))
        ],
      ),
    ),),);
  }
}

/*
class Datos {
  final pini = new PagIni();

  //V=pini.V;
  String alum = _alumno.text;
  String cuen = _cuenta.text;

  Datos(this.alum, this.cuen);
//return datos(alum,cuen);
}*/
