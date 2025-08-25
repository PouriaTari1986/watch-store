import 'dart:io';
import 'dart:ui' as ui;
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageHandler {
  File? _image;

  File? get getImage => _image;

  // ignore: strict_top_level_inference
  Future<File?> pickAndCropImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return null;

      File imageFile = File(pickedFile.path);
      // ignore: use_build_context_synchronously
      final croopedFile = await Navigator.of(context).push<File>(
        MaterialPageRoute(
          builder: (_) => CropImageScrren(imageFile: imageFile),
        ),
      );
      if (croopedFile != null) {
        _image = croopedFile;
      }
      return _image;
    } catch (e) {
      debugPrint("Error picking/crooped imag: $e");
      return null;
    }
  }
}

class CropImageScrren extends StatefulWidget {
  final File imageFile;

  const CropImageScrren({super.key, required this.imageFile});

  @override
  State<CropImageScrren> createState() => _CropImageScrrenState();
}

class _CropImageScrrenState extends State<CropImageScrren> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("برش تصویر"),
        actions: [
          TextButton(
            onPressed: () => cropAndSave(),

            child: Text("تایید", style: LightAppTextStyle.title),
          ),
        ],
      ),
      body: ExtendedImage.file(
        widget.imageFile,
        fit: BoxFit.contain,
        mode: ExtendedImageMode.editor,
        extendedImageEditorKey: editorKey,
        enableLoadState: true,
        cacheRawData: true,
        initEditorConfigHandler: (state) {
          return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: EdgeInsets.all(20.0),
            hitTestSize: 20.0,
            cropAspectRatio: 1.0,
          );
        },
      ),
    );
  }

  Future<void> cropAndSave() async {
    final state = editorKey.currentState;
    if (state == null) return;

    final cropRect = state.getCropRect();
    final rawImageData = state.rawImageData;
    if (cropRect == null) return;

    final ui.Image image = await decodeImageFromList(rawImageData);
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final paint = Paint();

    canvas.drawImageRect(
      image,
      cropRect,
      Rect.fromLTWH(0, 0, cropRect.width, cropRect.height),
      paint,
    );
    final croppedImage = await recorder.endRecording().toImage(
      cropRect.width.toInt(),
      cropRect.height.toInt(),
    );
    final byteData = await croppedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    if (byteData != null) {
      final buffer = byteData.buffer;
      final temDir = await getTemporaryDirectory();
      final file = File("${temDir.path}/cropped_image.png");
      await file.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context, file);
    }
  }
}
