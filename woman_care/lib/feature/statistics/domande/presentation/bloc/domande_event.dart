part of 'domande_bloc.dart';

@immutable
abstract class DomandeEvent {}

class GetDomande extends DomandeEvent {
  final int sondaggioId;

  GetDomande({
    @required this.sondaggioId,
  });
}
