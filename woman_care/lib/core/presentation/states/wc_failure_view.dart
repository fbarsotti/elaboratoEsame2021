import 'package:flutter/material.dart';

import 'package:studio_lab/core/infrastructure/error/types/failures.dart';

class WCFailureView extends StatelessWidget {
  final Failure failure;
  final Function refresh;

  const WCFailureView({
    Key key,
    @required this.failure,
    this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Icon(
              Icons.error,
              size: 80,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Text(
              failure.e.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          if (refresh != null)
            const SizedBox(
              height: 12,
            ),
          TextButton(
            child: Text(
              'Mostra errore',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(failure.e.toString()),
                    content: SelectableText(failure.e.toString()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          if (refresh != null)
            TextButton(
              child: Text(
                'Riprova',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              onPressed: refresh,
            )
        ],
      ),
    );
  }
}
