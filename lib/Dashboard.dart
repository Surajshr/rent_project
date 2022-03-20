import 'package:flutter/material.dart';
import 'package:rent_project/appBarDesign.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import 'Constaints.dart';
import 'NavBarDrawer.dart';
import 'Resuable_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('TENENT', 10),
      GDPData('VACENT', 5),
      // GDPData('S America', 2900),
      // GDPData('Europe', 33050),
      // GDPData('N America', 34390),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
       appBar: AppBar(
         elevation: 5.0,
         backgroundColor: kAppBarColor,
         title: const Center(
           child: Text("RENTAL"),
         ),
       ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ReusableCard(
                containerHeight: 200.0,
                colour: kContainerColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 8),
                      child: Center(
                        child: Text(
                          "TOTAL DUE REMAINING RENTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Hubballi",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: kAppBarColor,
                      child: Text("2 RENTER"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("REMIND"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xCBB81A66),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // <-- Radius
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableCard(
                    colour: kContainerColor,
                    containerHeight: 150,
                    containerWidth: 150,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0x3E4E0850),
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Rs. 10000.00",
                            style: TextStyle(
                                fontFamily: "Hubballi",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Resent Rent by:",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Hubballi",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Suraj Shrestha",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Hubballi",
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  ReusableCard(
                    colour: kContainerColor,
                    containerHeight: 150,
                    containerWidth: 150,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0x3E4E0850),
                            child: Icon(
                              Icons.monetization_on,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Rs. 10000.00",
                            style: TextStyle(
                                fontFamily: "Hubballi",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Due Rent",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Hubballi",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              ReusableCard(
                  containerHeight: 300.0,
                  colour: kContainerColor,
                  cardChild: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "RENT",
                            style: kSideBarTextStyle.copyWith(
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            child: ListView.builder(
                                physics: ScrollPhysics(parent: null),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, index) {
                                  return const ListTile(
                                    leading: Icon(Icons.home_work_outlined),
                                    trailing: Text(
                                      "Room 1",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                    title: Text("Rs. 10000"),
                                    subtitle: Text("January pay"),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )),
              ReusableCard(
                containerHeight: 300.0,
                colour: kContainerColor,
                cardChild: SfCircularChart(
                  legend:  Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    PieSeries<GDPData,String>(
                      dataSource: _chartData,
                      xValueMapper: (GDPData data, _) => data.continent,
                      yValueMapper: (GDPData data,_ ) => data.gdp,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("add new clicked");
                },
                child: const Icon(
                  Icons.person_add_alt_1_sharp,
                  size: 150.0,
                  color: Colors.indigoAccent,
                ),
              )
            ],
          ),
        ));
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final int gdp;
}