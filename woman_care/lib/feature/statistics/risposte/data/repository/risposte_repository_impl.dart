import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:studio_lab/core/infrastructure/error/handler.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/risposte/data/datasource/risposte_remote_datasource.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/repository/risposte_repository.dart';

class RisposteRepositoryImpl implements RisposteRepository {
  RisposteRemoteDatasource risposteRemoteDatasource;

  RisposteRepositoryImpl({@required this.risposteRemoteDatasource});
  @override
  Future<Either<Failure, List<RispostaDomainModel>>> getRisposteByDomanda(
    int domandaId,
  ) async {
    try {
      final remoteRisposte =
          await risposteRemoteDatasource.getRisposteByDomanda(domandaId);
      List<RispostaDomainModel> domainRisposte = remoteRisposte
          .map(
            (e) => RispostaDomainModel.fromRemoteModel(e),
          )
          .toList();
      return Right(domainRisposte);
    } catch (e, s) {
      print(e.toString());
      return Left(handleError(e, s));
    }
  }
}
