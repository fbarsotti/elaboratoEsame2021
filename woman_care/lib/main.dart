import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/feature/authentication/presentation/login_page.dart';
import 'package:studio_lab/feature/statistics/domande/data/datasource/domanda_remote_datasource.dart';
import 'package:studio_lab/feature/statistics/domande/data/repository/domande_repository_impl.dart';
import 'package:studio_lab/feature/statistics/domande/presentation/bloc/domande_bloc.dart';
import 'core/infrastructure/log/bloc_logger.dart';
import 'core/infrastructure/log/logger.dart';
import 'feature/statistics/sondaggio/data/datasource/statistics_remote_datasource.dart';
import 'feature/statistics/sondaggio/data/repository/sondaggio_repository_impl.dart';
import 'feature/statistics/sondaggio/presentation/bloc/sondaggio_bloc.dart';

void main() async {
  // E' necessario aggiungerlo prima della dependency injection
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = LoggerBlocDelegate();

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runZonedGuarded(() {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SondaggioBloc(
              statisticsRepository: SondaggioRepositoryImpl(
                statisticsRemoteDatasource: StatisticsRemoteDatasource(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => DomandeBloc(
              domandeRepository: DomandeRepositoryImpl(
                domandaRemoteDatasource: DomandaRemoteDatasource(),
              ),
            ),
          ),
        ],
        child: WCApp(),
      ),
    );
  }, Logger.error);
}

class WCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woman Care',
      theme: ThemeData(
        fontFamily: 'RedHatDisplay',
        scaffoldBackgroundColor: Color(0xffffffff),
        primaryColor: WCColors.primary,
        primarySwatch: WCColors.primaryTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
