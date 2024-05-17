// ignore_for_file: depend_on_referenced_packages

import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(Registrar registrar) {
  ImageCropperPlugin.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
