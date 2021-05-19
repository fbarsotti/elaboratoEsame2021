import 'package:dartz/dartz.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/domain/model/sondaggio_domain_model.dart';

mixin StatisticsRepository {
  Future<Either<Failure, List<SondaggioDomainModel>>> getAllSondaggi();
}
