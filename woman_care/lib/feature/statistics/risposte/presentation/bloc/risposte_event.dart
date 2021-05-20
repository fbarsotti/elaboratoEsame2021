part of 'risposte_bloc.dart';

@immutable
abstract class RisposteEvent {}

class GetRisposte extends RisposteEvent {
  final int domandaId;

  GetRisposte({
    @required this.domandaId,
  });
}
