import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:studio_lab/core/infrastructure/error/handler.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/sondaggio/data/datasource/statistics_remote_datasource.dart';
import 'package:studio_lab/feature/statistics/sondaggio/domain/model/sondaggio_domain_model.dart';
import 'package:studio_lab/feature/statistics/sondaggio/domain/repository/sondaggio_repository.dart';

class SondaggioRepositoryImpl implements SondaggioRepository {
  StatisticsRemoteDatasource statisticsRemoteDatasource;
  SondaggioRepositoryImpl({
    @required this.statisticsRemoteDatasource,
  });

  @override
  Future<Either<Failure, List<SondaggioDomainModel>>> getAllSondaggi() async {
    try {
      final remoteSondaggi = await statisticsRemoteDatasource.getAllSondaggi();
      final List<SondaggioDomainModel> domainSondaggi = remoteSondaggi
          .map(
            (e) => SondaggioDomainModel.fromRemoteModel(e),
          )
          .toList();
      return Right(domainSondaggi);
    } catch (e, s) {
      print(e);
      return Left(handleError(e, s));
    }
  }
}
