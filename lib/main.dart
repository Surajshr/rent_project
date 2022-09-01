import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/common/noInternet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rent_project/core/internetCheck/internet_cubit.dart';
import 'package:rent_project/main_page.dart';
import 'package:rent_project/routing/route_handler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RentApp());
}

class RentApp extends StatelessWidget {
  const RentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (BuildContext context) =>
                InternetCubit()..checkConnection())
      ],
      child: BlocBuilder<InternetCubit, InternetResult>(
        builder: (context, internetState) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              children: [
               MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(0xFF090C22),
                appBarTheme: const AppBarTheme(

                  color: Color(0xFF090C22),
                  toolbarTextStyle: TextStyle(
                    fontFamily: 'Hubballi'
                  )
                ),
              ),
              home: const MainPage(),
              onGenerateRoute: RouteHandler.generateRoute,
            ),

                if(!internetState.isConnected)const NoInternet()
          ],

          ));
        },
      ),
    );
  }
}
