import 'package:studio_lab/core/infrastructure/error/types/failures.dart';
import 'package:studio_lab/core/infrastructure/log/logger.dart';

Failure handleError(
  Exception e, [
  StackTrace s,
]) {
  // log the errror
  Logger.error(e, s);

  // if (e is SqliteException || e is MoorWrappedException) {
  //   return DatabaseFailure();
  // }
  return GenericFailure(e: e);
}
