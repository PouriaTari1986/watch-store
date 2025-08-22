
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler {

  File? _image;

  // ignore: strict_top_level_inference
  Future<void> pickAndCropImage({required ImageSource  source})async{

    try {
          final image = await ImagePicker().pickImage(source: source);
    if (image== null) return;
      File? img = File(image.path);

      img = await _cropImage(imageFile: img);
    _image = img;
      
    } catch (e) {
      debugPrint("e");
    }


      
    }
    Future<File?> _cropImage({required File imageFile})async{

      CroppedFile? croppedImge = await ImageCropper().cropImage(sourcePath: imageFile.path);

      if (croppedImge == null) return null;
      return File(croppedImge.path);
    }



    File? get getImage => _image;
  }

