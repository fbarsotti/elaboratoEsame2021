import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';
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
    yield* risposteResult.fold(
      (l) async* {
        yield RisposteFailure(failure: l);
      },
      (r) async* {
        yield RisposteLoaded(risposte: r);
      },
    );
  }
}
