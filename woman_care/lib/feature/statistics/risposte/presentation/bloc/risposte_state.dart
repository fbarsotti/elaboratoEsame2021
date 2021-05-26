part of 'risposte_bloc.dart';

@immutable
abstract class RisposteState {}

class RisposteInitial extends RisposteState {}

class RisposteLoading extends RisposteState {}

class RisposteLoaded extends RisposteState {
  final List<RispostaDomainModel> risposte;
  final List<RispostaPossibileDomainModel> rispostePossibili;

  RisposteLoaded({
    @required this.risposte,
    @required this.rispostePossibili,
  });
}

class RisposteFailure extends RisposteState {
  final Failure failure;

  RisposteFailure({
    @required this.failure,
  });
}
