import 'package:flutter/material.dart';
import 'package:mansoor/VideoLink/newVideo.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({Key? key}) : super(key: key);

  static int PhysicsQuizesTaken = 2;
  static int ChemQuizesTaken = 1;
  static int MathsQuizesTaken = 0;
  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  String chp_1_Time = "";
  String chp_2_Time = "";
  @override
  initState() {
    chp_1_Time = const Physics_Chp1_Video().getVideoTime().toString();
    chp_2_Time = const Physics_Chp2_Video().getVideoTime().toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3b599b),
          elevation: 0,
          title: const Text(
            "Process",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black87)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: const Text(
                          " :د لسم ټولګۍ د ازموینو ریکارډ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          ResultCard(
                            "فزیک",
                            '${ProcessPage.PhysicsQuizesTaken.toString()} /10',
                            Colors.black,
                          ),
                          ResultCard(
                            "کیمیا",
                            '${ProcessPage.ChemQuizesTaken.toString()} /10',
                            Colors.red,
                          ),
                          ResultCard(
                            "ریاضي",
                            '${ProcessPage.MathsQuizesTaken.toString()} /10',
                            Colors.green,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You have been playing very well, keep it up",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black87)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        " :د لسم ټولګی د ویډیویي لیکچرونو ریکارډ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 160,
                        // color: Colors.blueGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ":فزیک",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              child: Row(
                                children: [
                                  ResultCard(
                                    "لومړی څپرکۍ",
                                    chp_1_Time.toString(),
                                    Colors.deepOrangeAccent,
                                  ),
                                  ResultCard(
                                    "دوهم څپرکۍ",
                                    chp_2_Time.toString(),
                                    Colors.orange,
                                  ),
                                  ResultCard(
                                    "دریم څپرکۍ",
                                    "--",
                                    // _videoTime.toString(),
                                    Colors.lightGreen,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 160,
                        // color: Colors.blueGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ":کیمیا",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                ResultCard(
                                  "Chapter 1",
                                  "--",
                                  // _videoTime.toString(),
                                  Colors.indigoAccent,
                                ),
                                ResultCard(
                                  "Chapter 2",
                                  "--",
                                  // _videoTime.toString(),
                                  Colors.cyanAccent,
                                ),
                                ResultCard(
                                  "Chapter 3",
                                  "--",
                                  // _videoTime.toString(),
                                  Colors.orangeAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Charts(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black87)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Lectures that have been Watched From Class 11.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      // Charts(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black87)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Lectures that have been Watched From Class 12.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      // Text("Video Time"),
                      // Charts(),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card ResultCard(String textbook, String textquiz, Color color) {
    return Card(
      color: color,
      shadowColor: Colors.black,
      elevation: 5,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              textbook,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              textquiz,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
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
          // title: ChartTitle(
          //   text:'Lectures that have been Watched From Class 10.',
          // ),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<GDPData, String>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true)
          ]),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Chapter 1', 20),
      GDPData('Chapter 2', 50),
      GDPData('Chpater 3', 90),
      GDPData('Chapter 4', 20),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
