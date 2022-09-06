import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/common/noInternet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rent_project/core/auth/bloc/auth_bloc.dart';
import 'package:rent_project/core/auth/bloc/auth_states.dart';
import 'package:rent_project/core/auth/presentation/landing_page.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/internetCheck/internet_cubit.dart';
import 'package:rent_project/core/services/auth_repository.dart';
import 'package:rent_project/routing/Routing.dart';
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
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (BuildContext context) =>
                InternetCubit()..checkConnection(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: BlocBuilder<InternetCubit, InternetResult>(
          builder: (context, internetState) {
            return Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        fontFamily: 'Poppins',
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                              primary: AppColors.appThemeColor,
                            ),
                      ),
                      home: const LandingPage(),
                      onGenerateRoute: RouteHandler.generateRoute,
                    ),
                    if (!internetState.isConnected) const NoInternet()
                  ],
                ));
          },
        ),
      ),
    );
  }
}
