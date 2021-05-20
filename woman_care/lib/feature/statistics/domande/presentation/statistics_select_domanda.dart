import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/presentation/states/wc_failure_view.dart';
import 'package:studio_lab/core/presentation/states/wc_loading_view.dart';
import 'package:studio_lab/feature/statistics/domande/domain/model/domanda_domain_model.dart';
import 'package:studio_lab/feature/statistics/domande/presentation/bloc/domande_bloc.dart';

class StatisticsSelectDomanda extends StatefulWidget {
  StatisticsSelectDomanda({Key key}) : super(key: key);

  @override
  _StatisticsSelectDomandaState createState() =>
      _StatisticsSelectDomandaState();
}

class _StatisticsSelectDomandaState extends State<StatisticsSelectDomanda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Domande'),
      ),
      body: BlocBuilder<DomandeBloc, DomandeState>(
        builder: (context, state) {
          if (state is DomandeFailure) {
            return WCFailureView(failure: state.failure);
          } else if (state is DomandeLoaded) {
            return buildPage(state.domande);
          } else {
            return WCLoadingView();
          }
        },
      ),
    );
  }

  Widget buildPage(List<DomandaDomainModel> domande) {
    return ListView.builder(
      itemCount: domande.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {},
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
                    Icons.question_answer_outlined,
                    color: WCColors.extraLightText,
                  ),
                ),
                title: Text(
                  domande[index].contenuto,
                  style: TextStyle(
                    color: WCColors.blackText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Controlla i risultati',
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
