import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/presentation/states/wc_failure_view.dart';
import 'package:studio_lab/core/presentation/states/wc_loading_view.dart';
import 'package:studio_lab/feature/statistics/domande/presentation/bloc/domande_bloc.dart';
import 'package:studio_lab/feature/statistics/domande/presentation/statistics_select_domanda.dart';
import 'package:studio_lab/feature/statistics/sondaggio/domain/model/sondaggio_domain_model.dart';

import 'bloc/sondaggio_bloc.dart';

class SelectSondaggio extends StatefulWidget {
  SelectSondaggio({Key key}) : super(key: key);

  @override
  _SelectSondaggioState createState() => _SelectSondaggioState();
}

class _SelectSondaggioState extends State<SelectSondaggio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Sondaggi'),
      ),
      body: BlocBuilder<SondaggioBloc, SondaggioState>(
        builder: (context, state) {
          if (state is SondaggioFailure) {
            return WCFailureView(failure: state.failure);
          } else if (state is SondaggioLoaded) {
            return buildPage(state.sondaggi);
          } else {
            return WCLoadingView();
          }
        },
      ),
    );
  }

  Widget buildPage(List<SondaggioDomainModel> sondaggi) {
    return ListView.builder(
      itemCount: sondaggi.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<DomandeBloc>(context).add(
                GetDomande(sondaggioId: sondaggi[index].id),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return StatisticsSelectDomanda();
                  },
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                WCColors.extraLightText,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: WCColors.primary,
                  child: Icon(
                    Icons.poll,
                    color: WCColors.extraLightText,
                  ),
                ),
                title: Text(
                  sondaggi[index].titolo,
                  style: TextStyle(
                    color: WCColors.blackText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(
                    DateTime.parse(sondaggi[index].dataCreazione),
                  ),
                  style: TextStyle(color: WCColors.text),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
        );
      },
    );
  }
}
