import 'package:flutter/material.dart';
import 'package:rent_project/common/app_bar/custom_app_bar.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_icons.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/feature/screen/dashboard/dashboard_detail.dart';
import 'package:rent_project/feature/screen/menu/menu_fragment.dart';
import 'package:rent_project/localization.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key? key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  int _currentIndex = 0;
  List<Widget> widgetOptions = [
    const DashboardDetail(),
    const MenuFragment(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        icon: AppIcons.dashboard,
        label: getLocalizedString(
          context: context,
          resString: ResString.dashboard,
        ),
      ),
      BottomNavigationBarItem(
        icon: AppIcons.menu,
        label: getLocalizedString(
          context: context,
          resString: ResString.menu,
        ),
      ),
    ];
    return Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.appThemeColor,
        ),
        body: widgetOptions.elementAt(_currentIndex));
  }
}
