import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/presentation/customization/generic_header.dart';
import 'package:studio_lab/feature/statistics/sondaggio/presentation/bloc/sondaggio_bloc.dart';
import 'package:studio_lab/feature/statistics/sondaggio/presentation/statistics_select_sondaggio.dart';

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GenericHeader(text: 'Statistiche'),
            const SizedBox(height: 64),
            CircleAvatar(
              backgroundColor: WCColors.primary,
              radius: 60,
              child: Icon(
                Icons.search_rounded,
                size: 40,
                color: WCColors.extraLightText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                // ignore: lines_longer_than_80_chars
                'Comincia a dare un\'occhiata a varie statistiche sui risultati dei sondaggi',
                style: TextStyle(
                  color: WCColors.text,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        child: Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                WCColors.text,
              ),
            ),
            onPressed: () {
              BlocProvider.of<SondaggioBloc>(context).add(GetSondaggi());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SelectSondaggio();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Scopri cosa c\'è di nuovo',
                style: TextStyle(
                  color: WCColors.extraLightText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
