import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/Quiz/question_controller.dart';
import 'package:mansoor/home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);
  static int DoneQuiz = 0;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: GestureDetector(
          // onTap: () => Get.to(
          //   () => Home(),
          // ),
          onTap: () {
            Navigator.of(context).pop();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
            // print(ProcessPage.QuizesTaken + 1);
            // if (ProcessPage.QuizesTaken >= 10) {
            //   ProcessPage.QuizesTaken++;
            // }
          },
          child: const Icon(
            Icons.navigate_before,
            color: Colors.black54,
            size: 30,
          ),
        ),
        title: const Text("Quiz Result"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 2,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/app1.png'),
              //       fit: BoxFit.fitWidth,
              //     )
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 500,
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Your Score: ',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black54),
                      ),
                      // Text(
                      //   // ignore: unnecessary_null_comparison
                      //   (_controller.numberOfCorrectAnswer == 0)
                      //       ? '0/${_controller.questions.length}'
                      //       : '${_controller.numberOfCorrectAnswer}/${_controller.questions.length}',
                      //   style: const TextStyle(
                      //       color: Colors.black54, fontSize: 20),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Charts()
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
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
  QuestionController _controller = Get.put(QuestionController());

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
          ]),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(
          (_controller.numberOfCorrectAnswer == 0)
              ? '0'
              : "Correct: " + '${_controller.numberOfCorrectAnswer}',
          _controller.numberOfCorrectAnswer,
          Colors.green),
      GDPData(
          (_controller.numberOfIncorrectAnswer == 0)
              ? '0'
              : "Wrong: " + '${_controller.numberOfIncorrectAnswer}',
          _controller.numberOfIncorrectAnswer,
          Colors.red),
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
