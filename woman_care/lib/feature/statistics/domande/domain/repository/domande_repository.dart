import 'package:dartz/dartz.dart';
import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/feature/statistics/domande/domain/model/domanda_domain_model.dart';

mixin DomandeRepository {
  Future<Either<Failure, List<DomandaDomainModel>>> getDomande(
    int sondaggioId,
  );
}
