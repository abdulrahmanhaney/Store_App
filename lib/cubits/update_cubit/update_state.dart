part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateSucsess extends UpdateState {}

class UpdateFailed extends UpdateState {}
