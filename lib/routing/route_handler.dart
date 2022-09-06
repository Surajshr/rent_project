import 'package:flutter/material.dart';
import 'package:rent_project/core/auth/presentation/login_page.dart';
import 'package:rent_project/core/auth/presentation/register_page.dart';
import 'package:rent_project/feature/screen/Invoice/InvoicePage.dart';
import 'package:rent_project/feature/screen/Invoice/generated_invoice.dart';
import 'package:rent_project/feature/screen/Invoice/list_of_tenant.dart';
import 'package:rent_project/feature/screen/OwnerProfile/profile.dart';
import 'package:rent_project/feature/screen/Tenants/add_new_tenant.dart';
import 'package:rent_project/feature/screen/Tenants/tenant_list.dart';
import 'package:rent_project/feature/screen/Tenants/tenant_detail_page.dart';
import 'package:rent_project/feature/screen/dashboard/dashboard_fragment.dart';
import 'package:rent_project/helper/show_error_page.dart';

import '../Dashboard.dart';
import '../core/RentSetting/rentSetting.dart';
import 'Routing.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutingPath.dashboardPage:
        return MaterialPageRoute(builder: (_) => DashboardFragment());
      case RoutingPath.invoice:
        return MaterialPageRoute(builder: (_) => Invoice());
      case RoutingPath.ownerProfile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case RoutingPath.setting:
        return MaterialPageRoute(builder: (_) => RentalSetting());
      case RoutingPath.currentTenant:
        return MaterialPageRoute(builder: (_) => TenantList());
      case RoutingPath.tenantDetailPage:
        final newTenantData = args as AddNewTenantModel;
        return MaterialPageRoute(
            builder: (_) => TenantDetailPage(
                  fullName: newTenantData.fullName,
                  contactNumber: newTenantData.contactNumber,
                  email: newTenantData.email,
                  shiftedDate: newTenantData.shiftedDate,
                  shiftedFrom: newTenantData.shiftedFrom,
                  roomTaken: newTenantData.roomTaken,
                  rentPerMonth: newTenantData.rentPerMonth,
                  wasteFee: newTenantData.wasteFee,
                  electricityPerUnit: newTenantData.wasteFee,
                ));

      case RoutingPath.addNewTanent:
        return MaterialPageRoute(builder: (_) => AddNewTenants());
      case RoutingPath.loginPage:
        return MaterialPageRoute(builder: (_) =>  NewLoginPage());
      case RoutingPath.listOfTenant:
        return MaterialPageRoute(builder: (_) =>  ListOfTenant());
      case RoutingPath.generatedBill:
        final billData = args as GeneratedBillModel;
        return MaterialPageRoute(
            builder: (_) => GeneratedBill(
                  fullName: billData.fullName,
                  contactNumber: billData.contactNumber,
                  email: billData.email,
                  startDate: billData.startDate,
                  endDate: billData.endDate,
                  roomTaken: billData.roomTaken,
                  rentPerMonth: billData.rent,
                  wasteFee: billData.wasteFee,
                  electricityPerUnit: billData.electricityPerUnit,
                  electricityUnit: billData.electricityUnit,
                  totalRent: billData.totalRent,
              remainingRent: billData.remainingRent,

                ));
      case RoutingPath.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return _errorMessage();
    }
  }

  static Route<dynamic> _errorMessage() {
    return MaterialPageRoute(builder: (_) {
      return const ShowErrorPage();
    });
  }
}

class AddNewTenantModel {
  String? fullName;
  String? email;
  String? contactNumber;
  String? shiftedDate;
  String? shiftedFrom;
  String? roomTaken;
  String? rentPerMonth;
  String? wasteFee;
  String? electricityPerUnit;

  AddNewTenantModel({
    this.fullName,
    this.contactNumber,
    this.shiftedDate,
    this.shiftedFrom,
    this.roomTaken,
    this.rentPerMonth,
    this.wasteFee,
    this.electricityPerUnit,
    this.email,
  });
}

class GeneratedBillModel {
  final String? fullName;
  final int? remainingRent;
  final String? email;
  final String? contactNumber;
  final String? startDate;
  final String? endDate;
  final String? roomTaken;
  final double? rent;
  final double? wasteFee;
  final int? electricityPerUnit;
  final int? electricityUnit;
  final double? totalRent;

  GeneratedBillModel(
      {this.startDate,
        this.remainingRent,
      this.endDate,
      this.roomTaken,
      this.wasteFee,
      this.totalRent,
      this.rent,
      this.email,
      this.electricityPerUnit,
      this.fullName,
      this.contactNumber,
      this.electricityUnit});
}
