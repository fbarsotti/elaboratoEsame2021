part of 'domande_bloc.dart';

@immutable
abstract class DomandeState {}

class DomandeInitial extends DomandeState {}

class DomandeLoading extends DomandeState {}

class DomandeLoaded extends DomandeState {
  final List<DomandaDomainModel> domande;

  DomandeLoaded({
    @required this.domande,
  });
}

class DomandeFailure extends DomandeState {
  final Failure failure;

  DomandeFailure({
    @required this.failure,
  });
}
