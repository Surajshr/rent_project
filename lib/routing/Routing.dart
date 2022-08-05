import 'package:flutter/material.dart';
import 'package:rent_project/Dashboard.dart';
import 'package:rent_project/Tenants/AddNewTanent.dart';

import 'Invoice/InvoicePage.dart';
import 'LoginPage/LoginPage.dart';
import 'OwnerProfile/profile.dart';
import 'RentSetting/rentSetting.dart';
import 'Tenants/CurrentTenents.dart';
class GeneratedRouting{
 static const login ='/login';
 static const dashboard ='/dashboard';
 static const ownerProfile ='/OwnerProfile';
 static const setting ='/Setting';
 static const currentTenant ='/currentTenant';
 static const previousTenent ='/previousTenant';
 static const invoice ='/Invoice';
 
 
 static Route<dynamic> generateRoute(RouteSettings settings){
   final args = settings.arguments;
   switch(settings.name){
     case GeneratedRouting.login :
       return MaterialPageRoute(builder: (_)=>LoginPage());
     case GeneratedRouting.dashboard:
       return MaterialPageRoute(builder: (_)=> Dashboard());
     case GeneratedRouting.invoice:
       return MaterialPageRoute(builder: (_)=>Invoice());
     case GeneratedRouting.ownerProfile:
       return MaterialPageRoute(builder: (_)=>ProfilePage() );
     case GeneratedRouting.setting:
       return MaterialPageRoute(builder: (_)=> RentalSetting());
     case GeneratedRouting.currentTenant:
       return MaterialPageRoute(builder: (_)=> CurrentTenentsWithListData());
     case GeneratedRouting.previousTenent:
       return MaterialPageRoute(builder: (_)=> AddNewTenants());
     default:
       return _errorMessage();
   }
 }
 static Route<dynamic> _errorMessage(){
   return MaterialPageRoute(builder: (_){
     return Scaffold(
       appBar: AppBar(
         title: const Text("ERROR"),
       ),
       body: const Center(
         child: Text("ERROR"),
       ),
     );
   });
 }

}