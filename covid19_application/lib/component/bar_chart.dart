import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/covid_statistics.dart';
import '../utils/data_utils.dart';

class CovidBarChart extends StatelessWidget {
  final List<Covid19StatisticsModel> covidDatas;
  final double maxY;
  const CovidBarChart({Key? key, required this.maxY, required this.covidDatas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY * 1.5,
        baselineY: 0,
        gridData: FlGridData(
          show: true,
          verticalInterval: 2,
        ),
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipMargin: 8,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                rod.y.round().toString(),
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(color: Colors.black, fontSize: 14),
            margin: 20,
            getTitles: (double value) {
              return DataUtils.simpleDayFormat(
                  covidDatas[value.toInt()].stateDt!);
            },
          ),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: this.covidDatas.map<BarChartGroupData>((covidData) {
          return BarChartGroupData(
            x: x++,
            barRods: [
              BarChartRodData(
                  y: covidData.calcDecideCnt,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent])
            ],
            showingTooltipIndicators: [0],
          );
        }).toList(),
      ),
    );
  }
}