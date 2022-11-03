import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class PickImagePage extends StatefulWidget {
  const PickImagePage({super.key});

  @override
  State<PickImagePage> createState() => _PickImagePageState();
}

class _PickImagePageState extends State<PickImagePage> {
  File? image;

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    setState(() {
      image = File(croppedFile!.path);
    });
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageGallery!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    setState(() {
      image = File(croppedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Image'),
      ),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text("Pick Image from Gallery",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)),
            onPressed: openGallery,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
              color: Colors.blue,
              child: const Text("Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold)),
              onPressed: openCamera),
          const SizedBox(
            height: 10,
          ),
          image != null ? Image.file(image!) : const SizedBox(),
        ],
      )),
    );
  }
}
