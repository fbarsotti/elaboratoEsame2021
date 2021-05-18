import 'package:flutter/material.dart';
import 'package:studio_lab/core/presentation/customization/wc_colors.dart';

class HomeButtons extends StatefulWidget {
  HomeButtons({Key key}) : super(key: key);

  @override
  _HomeButtonsState createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  final List<bool> isSelected = [true, false, false, false];
  final List<String> text = [
    // ignore: lines_longer_than_80_chars
    'L\'app è stata creata per osservare i risultati dei sondaggi atti a monitorare lo stato di benessere femminile in occasione della Giornata Nazionale della salute della donna.',
    // ignore: lines_longer_than_80_chars
    'L\'app analizza i sondaggi raccolti e ne prepara un\'analisi statistica in modo da comprendere meglio la situazione femminile di quest\'anno.',
    // ignore: lines_longer_than_80_chars
    'I sondaggi e i dati vengono modificati in tempo reale, per garantire una corretta interpretazione dei dati.',
    'Tutti i dati contenuti sondaggi sono crittografati ed anonimi.',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          children: [
            Icon(Icons.self_improvement_rounded),
            Icon(Icons.help_outline_rounded),
            Icon(Icons.circle_notifications),
            Icon(Icons.security),
          ],
          borderRadius: BorderRadius.circular(16),
          onPressed: (value) {
            setState(() {
              isSelected[currentIndex] = false;
              isSelected[value] = true;
              currentIndex = value;
            });
          },
          color: WCColors.text,
          isSelected: isSelected,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            text[currentIndex],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: WCColors.text,
            ),
          ),
        )
      ],
    );
  }
}
