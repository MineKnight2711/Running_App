import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 're_usable_select_photo_button.dart';

class SelectPhotoOptionsSheet extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsSheet({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhoto(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'Chọn từ thiết bị',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'hoặc',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhoto(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'Sử dụng máy ảnh',
            ),
          ])
        ],
      ),
    );
  }
}
