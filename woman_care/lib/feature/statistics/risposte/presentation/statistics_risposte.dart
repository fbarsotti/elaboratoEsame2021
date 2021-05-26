import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_lab/core/presentation/customization/generic_title.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';
import 'package:studio_lab/core/presentation/states/wc_failure_view.dart';
import 'package:studio_lab/core/presentation/states/wc_loading_view.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/risposta_domain_model.dart';
import 'package:studio_lab/feature/statistics/risposte/domain/model/rispostapossibile_domain_model.dart';

import 'bloc/risposte_bloc.dart';

class StatisticsRisposte extends StatefulWidget {
  final String domanda;
  StatisticsRisposte({
    @required this.domanda,
    Key key,
  }) : super(key: key);

  @override
  _StatisticsRisposteState createState() => _StatisticsRisposteState();
}

class _StatisticsRisposteState extends State<StatisticsRisposte> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Risposte'),
      ),
      body: BlocBuilder<RisposteBloc, RisposteState>(
        builder: (context, state) {
          if (state is RisposteFailure) {
            return WCFailureView(failure: state.failure);
          } else if (state is RisposteLoaded) {
            return buildPage(state.risposte, state.rispostePossibili);
          } else {
            return WCLoadingView();
          }
        },
      ),
    );
  }

  Widget buildPage(
    List<RispostaDomainModel> risposte,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    final data = getData(risposte, rispostePossibili);
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: WCColors.primary,
                child: Icon(
                  Icons.question_answer_outlined,
                  color: WCColors.extraLightText,
                ),
              ),
              title: Text(
                widget.domanda,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Divider(),
        GenericTitle(text: 'Grafico a torta'),
        Container(
          height: 200,
          child: PieChart(
            PieChartData(
              borderData: FlBorderData(show: false),
              sectionsSpace: 8,
              centerSpaceRadius: 40,
              sections: getSections(data, rispostePossibili),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: getPieColors(data, rispostePossibili),
          ),
        ),
        const SizedBox(height: 32),
        GenericTitle(text: 'Grafico a barre'),
        Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 48,
              right: 80,
            ),
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: WCColors.selectedColor,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      String contenuto = rispostePossibili[group.x].contenuto;
                      return BarTooltipItem(
                        contenuto,
                        TextStyle(
                          color: WCColors.extraLightText,
                          fontFamily: 'RedHatDisplay',
                        ),
                      );
                    },
                  ),
                  touchCallback: (barTouchResponse) {
                    setState(() {
                      if (barTouchResponse.spot != null &&
                          barTouchResponse.touchInput is! PointerUpEvent &&
                          barTouchResponse.touchInput is! PointerExitEvent) {
                        touchedIndex =
                            barTouchResponse.spot.touchedBarGroupIndex;
                      } else {
                        touchedIndex = -1;
                      }
                    });
                  },
                ),
                barGroups: getBarGroups(data, rispostePossibili),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: getBarColors(data, rispostePossibili),
          ),
        ),
        const SizedBox(height: 32),
        GenericTitle(text: 'Dati generali delle risposte'),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getRichText('Totale risposte effettuate', '${risposte.length}'),
              Divider(),
              getRispostePossibili(rispostePossibili),
              Divider(),
              getTotaleRipostePossibili(data, rispostePossibili),
            ],
          ),
        ),
      ],
    );
  }

  Map<String, int> getData(
    List<RispostaDomainModel> risposte,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    Map<String, int> data = <String, int>{};
    for (int i = 0; i < rispostePossibili.length; i++) {
      data.addAll(
        <String, int>{
          rispostePossibili[i].contenuto: 0,
        },
      );
    }
    for (int i = 0; i < risposte.length; i++) {
      data[risposte[i].contenuto]++;
    }
    print(data.toString());
    return data;
  }

  List<PieChartSectionData> getSections(
    Map<String, int> data,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<PieChartSectionData> sections = [];
    for (int i = 0; i < rispostePossibili.length; i++) {
      sections.add(
        PieChartSectionData(
          color: WCColors.graphColors[i % WCColors.graphColors.length],
          value: data[rispostePossibili[i].contenuto].toDouble(),
          title: '${data[rispostePossibili[i].contenuto]}',
        ),
      );
    }
    return sections;
  }

  List<Widget> getPieColors(
    Map<String, int> data,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<Widget> rowColors = [];
    for (int i = 0; i < rispostePossibili.length; i++) {
      rowColors.add(
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: WCColors.graphColors[i % WCColors.graphColors.length],
            ),
            Text(' : ${rispostePossibili[i].contenuto}'),
          ],
        ),
      );
    }
    return rowColors;
  }

  List<BarChartGroupData> getBarGroups(
    Map<String, int> data,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<BarChartGroupData> barGroups = [];
    double width = 22;
    for (int i = 0; i < rispostePossibili.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: i == touchedIndex
                  ? (data[rispostePossibili[i].contenuto] + 0.2).toDouble()
                  : data[rispostePossibili[i].contenuto].toDouble(),
              colors: i == touchedIndex
                  ? [WCColors.selectedColor]
                  : [
                      WCColors.graphColors[
                          (WCColors.graphColors.length - 1 - i) %
                              WCColors.graphColors.length]
                    ],
              width: width,
            ),
          ],
        ),
      );
    }
    return barGroups;
  }

  List<Widget> getBarColors(
    Map<String, int> data,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<Widget> rowColors = [];
    for (int i = 0; i < rispostePossibili.length; i++) {
      rowColors.add(
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: WCColors.graphColors[
                  (WCColors.graphColors.length - 1 - i) %
                      WCColors.graphColors.length],
            ),
            Text(' : ${rispostePossibili[i].contenuto}'),
          ],
        ),
      );
    }
    return rowColors;
  }

  Widget getRichText(String field, String content) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: WCColors.text,
          fontFamily: 'RedHatDisplay',
        ),
        children: [
          TextSpan(text: '$field: '),
          TextSpan(
            text: '$content',
            style: TextStyle(
              color: WCColors.blackText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget getRispostePossibili(
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<Widget> children = [
      Text('Risposte possibili'),
    ];
    for (int i = 0; i < rispostePossibili.length; i++) {
      children.add(
        getRichText(
          '  Opzione ${i + 1}',
          '${rispostePossibili[i].contenuto}',
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget getTotaleRipostePossibili(
    Map<String, int> data,
    List<RispostaPossibileDomainModel> rispostePossibili,
  ) {
    List<Widget> children = [
      Text('Quantità per risposta possibile'),
    ];
    for (int i = 0; i < rispostePossibili.length; i++) {
      children.add(
        getRichText(
          '  ${rispostePossibili[i].contenuto}',
          '${data[rispostePossibili[i].contenuto]}',
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
