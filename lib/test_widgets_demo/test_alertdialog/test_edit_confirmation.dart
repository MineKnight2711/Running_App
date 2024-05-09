import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class TestEditConfirmation extends StatelessWidget {
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
                          color: Color(0xfff26322),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Rename ‘Dam Sen Trail‘',
                          style: CustomGoogleFonts.roboto(color: Colors.white),
                        ),
                      ],
                    ),
                    content: TextField(
                      style: CustomGoogleFonts.roboto(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'New name of route',
                        hintStyle: CustomGoogleFonts.roboto(color: Colors.grey),
                      ),
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
                          backgroundColor: Color(0xfff26322),
                        ),
                        child: Text('Change'),
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
