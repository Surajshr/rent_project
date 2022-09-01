import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetResult{

  final ConnectivityResult? connectivityResult;
  final bool isConnected;
  InternetResult(this.connectivityResult,this.isConnected);

}
class InternetCubit extends Cubit<InternetResult>{
    InternetCubit(): super (InternetResult(null, false));
    StreamSubscription<ConnectivityResult>? subscription;

    checkConnection(){
      bool hasConnection= false;
      subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult stream) async {
      try{
        final result = await InternetAddress.lookup("google.com");
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          hasConnection= true;
        }else {
          hasConnection=false;
        }
      } on SocketException catch (_){
        hasConnection =false;
      }
      emit(InternetResult(stream,   (stream!=ConnectivityResult.none && hasConnection)));
      });


    }
}