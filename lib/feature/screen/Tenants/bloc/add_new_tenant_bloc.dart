import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/feature/screen/Tenants/bloc/add_new_tenant_event.dart';
import 'package:rent_project/feature/screen/Tenants/bloc/add_new_tenant_state.dart';
import 'package:rent_project/feature/screen/Tenants/services/add_new_tenant_services.dart';

class NewTenantBloc extends Bloc<NewTenantEvent,NewTenantState>{

  NewTenantBloc():super(NewTenantInitial()){

      on<GetAddNewTenant>((event,emit)async{
        // try{
        //   emit(NewTenantLoading());
        //   final myData = await createTenant();
        // }


      });
  }

}