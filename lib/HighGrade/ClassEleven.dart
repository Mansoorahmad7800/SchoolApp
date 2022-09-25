import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClassElevn extends StatefulWidget {

  ClassElevn(this.colorval);
  int colorval;

  State<ClassElevn> createState() => _ClassElevnState();
}

class _ClassElevnState extends State<ClassElevn> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController!.addListener(_handleTabSelection);
  }
  void _handleTabSelection(){
    setState(() {
      widget.colorval = 0xDD000000 ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 10,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: Color(0xDD000000),
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 0
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('Maths',style: TextStyle(color: _tabController?.index == 0
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 1
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('Physics',style: TextStyle(color: _tabController?.index == 1
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 2
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('Chemistry',style: TextStyle(color: _tabController?.index == 2
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 3
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('Biology',style: TextStyle(color: _tabController?.index == 3
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 4
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('English',style: TextStyle(color: _tabController?.index == 4
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.book,color: _tabController?.index == 5
                    ? Color(widget.colorval)
                    :Colors.grey),
                child: Text('Pashto',style: TextStyle(color: _tabController?.index == 5
                    ? Color(widget.colorval)
                    : Colors.grey),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MathsTabs(),
            PhysicsTabs(),
            ChemistryTabs(),
            BiologyTabs(),
            EnglishTabs(),
            PashtoTabs(),
            // HomeTopChartsTabs(),
          ],
        ),
      ),
    );
  }
}

//Class 11 Maths Book
class MathsTabs extends StatefulWidget {
  final Widget ? child;
  const MathsTabs({Key? key, this.child}) : super(key: key);

  @override
  State<MathsTabs> createState() => _MathsTabsState();
}

class _MathsTabsState extends State<MathsTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/photo1.jpg', fit: BoxFit.cover,),
    );
  }
}

//Class 11 Physics Book
class PhysicsTabs extends StatefulWidget {
  final Widget ? child;
  const PhysicsTabs({Key? key, this.child}) : super(key: key);

  @override
  State<PhysicsTabs> createState() => _PhysicsTabsState();
}

class _PhysicsTabsState extends State<PhysicsTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/children.png', fit: BoxFit.cover,),
    );
  }
}

//Class 11 Chemistry Book
class ChemistryTabs extends StatefulWidget {
  final Widget ? child;
  const ChemistryTabs({Key? key, this.child}) : super(key: key);

  @override
  State<ChemistryTabs> createState() => _ChemistryTabsState();
}

class _ChemistryTabsState extends State<ChemistryTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/userLogedin.png', fit: BoxFit.cover,),
    );
  }
}

//Class 11 Biology Book
class BiologyTabs extends StatefulWidget {
  final Widget ? child;
  const BiologyTabs({Key? key, this.child}) : super(key: key);

  @override
  State<BiologyTabs> createState() => _BiologyTabsState();
}

class _BiologyTabsState extends State<BiologyTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/logedin.jpg', fit: BoxFit.cover,),
    );
  }
}

//Class 11 English Book
class EnglishTabs extends StatefulWidget {
  final Widget ? child;
  const EnglishTabs({Key? key, this.child}) : super(key: key);

  @override
  State<EnglishTabs> createState() => _EnglishTabsState();
}

class _EnglishTabsState extends State<EnglishTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/highGrad.png', fit: BoxFit.cover,),
    );
  }
}

//Class 11 Pashto Book
class PashtoTabs extends StatefulWidget {
  final Widget ? child;
  const PashtoTabs({Key? key, this.child}) : super(key: key);

  @override
  State<PashtoTabs> createState() => _PashtoTabsState();
}

class _PashtoTabsState extends State<PashtoTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          ImageContainer(),
        ],
      ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 300.0,
      child: Image.asset('assets/secondary2.jpg', fit: BoxFit.cover,),
    );
  }
}