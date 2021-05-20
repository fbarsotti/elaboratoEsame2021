part of 'sondaggio_bloc.dart';

@immutable
abstract class SondaggioState {}

class SondaggioInitial extends SondaggioState {}

class SondaggioLoading extends SondaggioState {}

class SondaggioLoaded extends SondaggioState {
  final List<SondaggioDomainModel> sondaggi;
  SondaggioLoaded({
    @required this.sondaggi,
  });
}

class SondaggioFailure extends SondaggioState {
  final Failure failure;

  SondaggioFailure({
    @required this.failure,
  });
}
