import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/domande/domain/model/domanda_domain_model.dart';
import 'package:studio_lab/feature/statistics/domande/domain/repository/domande_repository.dart';

part 'domande_event.dart';
part 'domande_state.dart';

class DomandeBloc extends Bloc<DomandeEvent, DomandeState> {
  final DomandeRepository domandeRepository;

  DomandeBloc({@required this.domandeRepository}) : super(DomandeInitial());

  @override
  Stream<DomandeState> mapEventToState(
    DomandeEvent event,
  ) async* {
    if (event is GetDomande) {
      yield* _mapDomandaToState(event.sondaggioId);
    }
  }

  Stream<DomandeState> _mapDomandaToState(int sondaggioId) async* {
    yield DomandeLoading();
    final domandeResult = await domandeRepository.getDomande(sondaggioId);
    yield* domandeResult.fold(
      (l) async* {
        yield DomandeFailure(failure: l);
      },
      (r) async* {
        yield DomandeLoaded(domande: r);
      },
    );
  }
}
