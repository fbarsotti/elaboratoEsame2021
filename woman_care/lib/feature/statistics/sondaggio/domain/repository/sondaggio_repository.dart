import 'package:dartz/dartz.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/sondaggio/domain/model/sondaggio_domain_model.dart';

mixin SondaggioRepository {
  Future<Either<Failure, List<SondaggioDomainModel>>> getAllSondaggi();
}
