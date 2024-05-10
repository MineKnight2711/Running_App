import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class TestConfirmDeletion extends StatelessWidget {
  const TestConfirmDeletion({super.key});

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
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Confirm deletion',
                          style: CustomGoogleFonts.roboto(color: Colors.white),
                        ),
                      ],
                    ),
                    content: Text(
                      'Are you sure you want to delete this route in your favorite list?',
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
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Yes, delete'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show Alert Dialog'),
          ),
        ),
      ),
    );
  }
}
