import 'package:flutter/material.dart';
import 'package:flutter_running_demo/widgets/image_picker/select_image_constant/image_select.dart';

class TestImagePicker extends StatelessWidget {
  const TestImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImagePickerWidget(
            onImageSelected: (image) {},
          )
        ],
      ),
    );
  }
}
