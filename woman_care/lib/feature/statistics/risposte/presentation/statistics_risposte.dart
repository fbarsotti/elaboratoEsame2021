import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_lab/core/presentation/states/wc_failure_view.dart';
import 'package:studio_lab/core/presentation/states/wc_loading_view.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';

import 'bloc/risposte_bloc.dart';

class StatisticsRisposte extends StatefulWidget {
  StatisticsRisposte({Key key}) : super(key: key);

  @override
  _StatisticsRisposteState createState() => _StatisticsRisposteState();
}

class _StatisticsRisposteState extends State<StatisticsRisposte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Domande'),
        ),
        body: BlocBuilder<RisposteBloc, RisposteState>(
          builder: (context, state) {
            if (state is RisposteFailure) {
              return WCFailureView(failure: state.failure);
            } else if (state is RisposteLoaded) {
              return buildPage(state.risposte);
            } else {
              return WCLoadingView();
            }
          },
        ));
  }

  Widget buildPage(List<RispostaDomainModel> risposte) {
    return ListView.builder(
      itemCount: risposte.length,
      itemBuilder: (context, index) {
        return Text(risposte[index].contenuto);
      },
    );
  }
}
