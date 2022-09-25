import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultPage extends StatefulWidget {
  final int trueAns;
  final int falseAns;
  final int totalQuestions;

  ResultPage({
    required this.falseAns,
    required this.totalQuestions,
    required this.trueAns,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<GDPData> _chartData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 600,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Score',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Total Question = ${widget.totalQuestions}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Text('Correct Ans = $trueAns'),
                // Text('Wrong Ans = $falseAns'),
                // Text(
                //   'Unattempted = ' +
                //       (totalQuestions - trueAns - falseAns).toString(),
                // ),
                CHarts(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Home Page'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CHarts() {
    return Container(
      height: 400,
      width: double.infinity,
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          iconHeight: 24,
          iconWidth: 24,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            animationDuration: 4500,
            animationDelay: 500,
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            pointColorMapper: (GDPData data, _) => data.color,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 20),
            ),
            enableTooltip: true,
            innerRadius: '80',
          )
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Crrect: ${widget.trueAns}', widget.trueAns, Colors.green),
      GDPData(
        'Wrong: ${widget.falseAns}',
        widget.falseAns,
        Colors.red,
      ),
      GDPData(
        'Unattempted: ${(widget.totalQuestions - widget.trueAns - widget.falseAns)}',
        (widget.totalQuestions - widget.trueAns - widget.falseAns),
        Colors.lightBlue,
      )
    ];
    return chartData;
  }
}

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: SfCircularChart(
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            position: LegendPosition.bottom,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            iconHeight: 24,
            iconWidth: 24),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<GDPData, String>(
            animationDuration: 4500,
            animationDelay: 500,
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            pointColorMapper: (GDPData data, _) => data.color,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, textStyle: TextStyle(fontSize: 20)),
            enableTooltip: true,
            innerRadius: '80',
          )
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Crrect: ', 20, Colors.green),
      GDPData(
        'Wrong: ',
        10,
        Colors.red,
      ),
    ];
    return chartData;
  }
}

class GDPData {
  final String continent;
  final int gdp;
  final Color color;

  GDPData(this.continent, this.gdp, this.color);
}
