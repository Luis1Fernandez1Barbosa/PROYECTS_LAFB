import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:file_picker/file_picker.dart';


class PagGraf extends StatefulWidget{
  const PagGraf({Key? key}): super(key:key);

  @override
  State<PagGraf> createState()  => _PagGrafState();
}

class _PagGrafState extends State<PagGraf>{
  String _file= "";
  List<Widget> _charts=[];
  Uint8List? file;

  Future<void> _loadFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result.files.single.bytes;
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFile().then((value) => {
      _giveData()
    });
  }

  Future<void> _carDatos() async {
    List<String> lines = [];
    String line="";
    for(int i=0;i<_file!.length;i++){
      if(_file![i]=='\n'){
        lines.add(line);
        line="";
      }
      else{
        line+=_file![i];
      }
    }
    List<double> voltaje=[],potencia=[],ampacidad=[];
    List<int> nvino=[];
    for (int i=0;i<lines.length;i++){
      List<String> l = lines[i].split(",");
      voltaje.add(double.parse(l[1]));
      potencia.add(double.parse(l[2]));
      ampacidad.add(double.parse(l[3]));
      nvino.add(i.toInt());
    }
    final List<ChartData> _dataA=_createDataSource(nvino, voltaje);
    final List<ChartData> _dataC=_createDataSource(nvino, potencia);
    final List<ChartData> _dataCo=_createDataSource(nvino, ampacidad);


    setState(() {
      _charts=[];
      _charts.add(SfCartesianChart(
        title: ChartTitle(text: "Los Vinos"),
        series: <ChartSeries>[
          // Renders line chart
          LineSeries<ChartData, int>(
              dataSource: _dataA,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y
          ),
          LineSeries<ChartData, int>(
              dataSource: _dataC,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y
          ),
          LineSeries<ChartData, int>(
              dataSource: _dataCo,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y
          ),
        ],
       )
      );
    });

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'GRÁFICAS',
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GRÁFICAS'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _charts,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _carDatos();
        },
        child: const Icon(Icons.show_chart),
      ),
        ),);
  }

  void _giveData(){
    setState(() {
        _file = utf8.decode(file!);
    });
  }

  ChartSeries<dynamic,dynamic> _createSeries(List<int> data){
    return ChartSeries<dynamic,dynamic>(dataSource: data);
  }

  List<ChartData> _createDataSource(List<int> xAxis,List<double> yAxis){
    List<ChartData> dS = [];
    for (int i=0;i<xAxis.length;i++){
      dS.add(ChartData(xAxis[i], yAxis[i]));
    }
    return dS;
  }
}

class ChartData {
  ChartData(this.x,this.y);
  final int x;
  final double y;
}


