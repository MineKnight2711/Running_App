import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class TestConfirmAddtion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Confirm addtion',
                          style: CustomGoogleFonts.roboto(color: Colors.white),
                        ),
                      ],
                    ),
                    content: Text(
                      'Do you want to add this route to your upcoming running list?',
                      style: CustomGoogleFonts.roboto(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: CustomGoogleFonts.roboto(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'Yes,add',
                          ))
                    ],
                  );
                },
              );
            },
            child: Text('Show Alert Dialog'),
          ),
        ),
      ),
    );
  }
}
