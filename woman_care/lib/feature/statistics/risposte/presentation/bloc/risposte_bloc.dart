import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/rispostapossibile_domain_model.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/repository/risposte_repository.dart';

part 'risposte_event.dart';
part 'risposte_state.dart';

class RisposteBloc extends Bloc<RisposteEvent, RisposteState> {
  RisposteRepository risposteRepository;
  RisposteBloc({
    @required this.risposteRepository,
  }) : super(RisposteInitial());

  @override
  Stream<RisposteState> mapEventToState(
    RisposteEvent event,
  ) async* {
    if (event is GetRisposte) {
      yield* _mapRisposteToState(event.domandaId);
    }
  }

  Stream<RisposteState> _mapRisposteToState(int domandaId) async* {
    yield RisposteLoading();
    final risposteResult =
        await risposteRepository.getRisposteByDomanda(domandaId);
    final risposte = risposteResult.getOrElse(() => null);
    final rispostePossibiliResult =
        await risposteRepository.getRispostePossibiliByDomanda(domandaId);
    final rispostePossibili = rispostePossibiliResult.getOrElse(() => null);
    if (risposte == null || rispostePossibili == null) {
      yield RisposteFailure(
        failure: Failure(
          e: Exception('Si è verificato un errore!'),
        ),
      );
    } else {
      yield RisposteLoaded(
        risposte: risposte,
        rispostePossibili: rispostePossibili,
      );
    }
  }
}
