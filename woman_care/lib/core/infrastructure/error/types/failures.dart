import 'package:flutter/material.dart';
import 'package:studio_lab/core/infrastructure/localization/app_localizations.dart';

class Failure {
  const Failure({this.e});

  final Exception e;

  String localizedDescription(BuildContext context) {
    return AppLocalizations.of(context).translate('generic_failure');
  }
}

class DatabaseFailure extends Failure {
  @override
  String localizedDescription(BuildContext context) {
    return AppLocalizations.of(context).translate('database_failure');
  }
}

class GenericFailureWithoutException extends GenericFailure {}

class GenericFailure extends Failure {
  GenericFailure({Exception e}) : super(e: e);

  @override
  String localizedDescription(BuildContext context) {
    return AppLocalizations.of(context).translate('generic_failure');
  }
}
