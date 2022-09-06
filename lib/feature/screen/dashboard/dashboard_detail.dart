import 'package:flutter/material.dart';
import 'package:rent_project/Resuable_card.dart';
import 'package:rent_project/common/base_page/base_page.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/localization.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardDetail extends StatefulWidget {
  const DashboardDetail({Key? key}) : super(key: key);

  @override
  State<DashboardDetail> createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('TENENT', 10),
      GDPData('VACENT', 100),
      // GDPData('S America', 2900),
      // GDPData('Europe', 33050),
      // GDPData('N America', 34390),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BasePage(
          showAppBar: false,
          body: Column(
            children: [
              Center(
                  child: Text(
                getLocalizedString(
                    context: context, resString: ResString.tenantDetail),
                style: AppTextStyle.header,
              )),
              Expanded(
                flex: 1,
                child: ReusableCard(
                  containerHeight: height * .30,
                  colour: AppColors.containerColor,
                  cardChild: SfCircularChart(
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      PieSeries<GDPData, String>(
                        dataSource: _chartData,
                        xValueMapper: (GDPData data, _) => data.continent,
                        yValueMapper: (GDPData data, _) => data.gdp,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getLocalizedString(
                      context: context,
                      resString: ResString.tenantList,
                    ),
                    style: AppTextStyle.header,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                    containerHeight: height * .50,
                    // colour: AppColors.bgColor,
                    cardChild: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView.builder(
                            physics: const ScrollPhysics(parent: null),
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
                    )),
              ),
            ],
          )),
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final int gdp;
}
