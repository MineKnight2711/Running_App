import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class TestRemoveConfirmation extends StatelessWidget {
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
                          Icons.remove,
                          color: Color(0xffff4747),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Remove Confirmaiton',
                          style: CustomGoogleFonts.roboto(color: Colors.white),
                        ),
                      ],
                    ),
                    content: Text(
                      'Are you sure you want to remove the route for upcoming run?',
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
                          // Xử lý xóa route ở đây
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffff4747),
                        ),
                        child: Text('Yes, remove'),
                      ),
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
