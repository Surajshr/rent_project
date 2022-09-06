import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/core/auth/bloc/auth_events.dart';
import 'package:rent_project/core/auth/bloc/auth_states.dart';
import 'package:rent_project/core/services/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{

  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticatedState()){

    on<SignInRequestEvent> ((event,emit)async{
      emit(LoadingState());
      try{
        await authRepository.signIn(email: event.email, password: event.password);
        emit(AuthenticatedState());
      }
      catch (e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    on<SignUpRequestEvent>((event,emit)async{
      emit(LoadingState());
      try{
        await authRepository.signUp(email: event.email, password: event.password);
        emit(AuthenticatedState());
      }catch (e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    on<GoogleSignInRequestEvent> ((event,emit)async {
      emit(LoadingState());
      try{
        await authRepository.signInWithGoogle();
        emit(AuthenticatedState());
      }catch (e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    on<SignOutRequestEvent>((event,emit)async{
      emit(LoadingState());
      await authRepository.signOut();
      emit(UnAuthenticatedState());
    });
  }

}