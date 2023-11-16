import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Grafica_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gráfico de Pastel'),
        ),
        body: Column(
          children: [
            Container(
              height: 300,  // Ajusta esta altura según sea necesario
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: Color.fromARGB(255, 115, 182, 248),
                      value: 40,
                      title: 'Comida',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                    ),
                    PieChartSectionData(
                      color: Color.fromARGB(255, 246, 93, 146),
                      value: 30,
                      title: 'Transporte',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                    ),
                    PieChartSectionData(
                      color: Color.fromARGB(255, 255, 16, 96),
                      value: 20,
                      title: 'Renta',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                    ),
                    PieChartSectionData(
                      color: Color.fromARGB(255, 122, 250, 151),
                      value: 10,
                      title: 'Otros',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  LegendItem(color: Color.fromARGB(255, 115, 182, 248), label: 'Comida'),
                  LegendItem(color: Color.fromARGB(255, 246, 93, 146), label: 'Transporte'),
                  LegendItem(color: Color.fromARGB(255, 255, 16, 96), label: 'Renta'),
                  LegendItem(color: Color.fromARGB(255, 122, 250, 151), label: 'Otros'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
