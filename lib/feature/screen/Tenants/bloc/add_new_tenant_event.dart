import 'package:equatable/equatable.dart';

abstract class NewTenantEvent extends Equatable {
  const NewTenantEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAddNewTenant extends NewTenantEvent {}

class EditNewTenant extends NewTenantEvent {}

class DeleteNewTenant extends NewTenantEvent {}
