import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:studio_lab/core/infrastructure/error/handler.dart';

import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/domande/data/datasource/domanda_remote_datasource.dart';
import 'package:studio_lab/feature/statistics/domande/domain/model/domanda_domain_model.dart';
import 'package:studio_lab/feature/statistics/domande/domain/repository/domande_repository.dart';

class DomandeRepositoryImpl implements DomandeRepository {
  DomandaRemoteDatasource domandaRemoteDatasource;

  DomandeRepositoryImpl({
    @required this.domandaRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<DomandaDomainModel>>> getDomande(
    int sondaggioId,
  ) async {
    try {
      final remoteDomande =
          await domandaRemoteDatasource.getAllDomande(sondaggioId);
      List<DomandaDomainModel> domainDomande = remoteDomande
          .map(
            (e) => DomandaDomainModel.fromRemoteModel(e),
          )
          .toList();
      return Right(domainDomande);
    } catch (e, s) {
      print(e.toString());
      return Left(handleError(e, s));
    }
  }
}
