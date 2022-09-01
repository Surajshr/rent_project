import 'package:equatable/equatable.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';

class NewTenantState extends Equatable {
  const NewTenantState();

  @override
  List<Object?> get props => [];
}

class NewTenantInitial extends NewTenantState {}

class NewTenantLoading extends NewTenantState {}

class NewTenantLoaded extends NewTenantState {
  final NewTenantModel? newTenantModel;

  const NewTenantLoaded(this.newTenantModel);
}

class NewTenantError extends NewTenantState {
  final String? message;

  const NewTenantError(this.message);
}
