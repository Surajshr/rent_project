import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_project/Dashboard.dart';
import 'package:rent_project/core/LoginPage/LoginPage.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            print(snapshot.hasData);
            return const Dashboard();
          }
          else{
         return const LoginPage();
          }
        },
      ),
    );
  }
}
