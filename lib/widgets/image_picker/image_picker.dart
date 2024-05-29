import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/web.dart';

import 'components/select_photo_options_sheet.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File? selectedImage) onImageSelected;
  final String? currentImageUrl;
  const ImagePickerWidget(
      {super.key, required this.onImageSelected, this.currentImageUrl});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final _listImage = <File?>[].obs;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);

      _listImage.insert(0, img);
      _key.currentState?.insertItem(
        0,
        duration: const Duration(seconds: 1),
      );
      Logger().i("List Image lenght: ${_listImage.length}");

      widget.onImageSelected(img);

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on PlatformException {
      rethrow;
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void removeImage(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) => ScaleTransition(
        key: UniqueKey(),
        scale: animation,
        child: SizedBox(
          width: AppSpacings.chs(80),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    _listImage.removeAt(index);
  }

  void showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsSheet(
                onTap: pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_listImage.isNotEmpty) {
        return GestureDetector(
          onTap: () {
            showSelectPhotoOptions(context);
          },
          child: Container(
            width: AppSpacings.sw(1),
            height: AppSpacings.cvs(80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedList(
              key: _key,
              scrollDirection: Axis.horizontal,
              initialItemCount: _listImage.length,
              itemBuilder: (context, index, animation) {
                return ScaleTransition(
                  key: UniqueKey(),
                  scale: animation,
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.up,
                    onDismissed: (direction) {
                      removeImage(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _listImage[index]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return Container(
          width: AppSpacings.sw(1),
          height: AppSpacings.cvs(80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFFFFFFF).withOpacity(0.2),
          ),
          child: InkWell(
            onTap: () {
              showSelectPhotoOptions(context);
            },
            child: DottedBorder(
              radius: const Radius.circular(20),
              padding: EdgeInsets.zero,
              borderType: BorderType.RRect,
              color: const Color(0xFFFFFFFF).withOpacity(0.2),
              strokeWidth: 1.5,
              dashPattern: const [10, 5],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/image.svg"),
                    Text(
                      "Add photos / videos",
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
