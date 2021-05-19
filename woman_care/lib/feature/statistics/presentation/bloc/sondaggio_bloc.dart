import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/domain/model/sondaggio_domain_model.dart';
import 'package:studio_lab/feature/statistics/domain/repository/statistics_repository.dart';

part 'sondaggio_event.dart';
part 'sondaggio_state.dart';

class SondaggioBloc extends Bloc<SondaggioEvent, SondaggioState> {
  SondaggioBloc({
    @required this.statisticsRepository,
  }) : super(SondaggioInitial());
  final StatisticsRepository statisticsRepository;

  @override
  Stream<SondaggioState> mapEventToState(
    SondaggioEvent event,
  ) async* {
    if (event is GetSondaggi) {
      yield* _mapSondaggioEventToState();
    }
  }

  Stream<SondaggioState> _mapSondaggioEventToState() async* {
    yield SondaggioLoading();
    final sondaggioResult = await statisticsRepository.getAllSondaggi();
    yield* sondaggioResult.fold(
      (l) async* {
        yield SondaggioFailure(failure: l);
      },
      (r) async* {
        yield SondaggioLoaded(sondaggi: r);
      },
    );
  }
}
