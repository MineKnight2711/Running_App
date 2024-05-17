import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../media_query.dart';
import '../selectphoto/select_photo_options_screen.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImageSelected;
  final String? currentImageUrl;

  const ImagePickerWidget(
      {super.key, required this.onImageSelected, this.currentImageUrl});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget>
    with SingleTickerProviderStateMixin {
  File? image;
  late AnimationController _animationController;
  late Animation<double> _inanimation;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);

      setState(() {
        this.image = img;
      });
      widget.onImageSelected(img);
      _animationController.forward(from: 0.0);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on PlatformException catch (e) {
      rethrow;
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
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
              child: SelectPhotoOptionsScreen(
                onTap: pickImage,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _inanimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (image != null) ...[
          Stack(
            children: [
              ScaleTransition(
                scale: _inanimation,
                child: Container(
                  width: mediaWidth(context, 4),
                  height: mediaHeight(context, 7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: mediaHeight(context, 3),
                    backgroundImage: Image.file(
                      image!,
                    ).image,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showSelectPhotoOptions(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: mediaAspectRatio(context, 1 / 37),
                    child: Icon(
                      Icons.camera_alt,
                      size: mediaAspectRatio(context, 1 / 40),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ] else ...[
          Stack(
            children: [
              Container(
                width: mediaWidth(context, 3),
                height: mediaHeight(context, 7),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: ClipOval(
                  child: widget.currentImageUrl != null
                      ? Image.asset(
                          widget.currentImageUrl!,
                          fit: BoxFit.cover,
                          width: mediaWidth(context, 4),
                          height: mediaHeight(context, 7),
                        )
                      : Image.asset(
                          'assets/images/profile.jpg',
                          scale: mediaWidth(context, 4),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showSelectPhotoOptions(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: mediaAspectRatio(context, 1 / 37),
                    child: Icon(
                      Icons.camera_alt,
                      size: mediaAspectRatio(context, 1 / 40),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ],
    );
  }
}
