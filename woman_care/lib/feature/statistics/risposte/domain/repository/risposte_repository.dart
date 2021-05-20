import 'package:dartz/dartz.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';

mixin RisposteRepository {
  Future<Either<Failure, List<RispostaDomainModel>>> getRisposteByDomanda(
    int domandaId,
  );
}
