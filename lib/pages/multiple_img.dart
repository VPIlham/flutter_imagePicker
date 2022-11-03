import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePage extends StatefulWidget {
  const MultipleImagePage({super.key});

  @override
  State<MultipleImagePage> createState() => _MultipleImagePageState();
}

class _MultipleImagePageState extends State<MultipleImagePage> {
  File? image;
  List<XFile>? _imageFileList;

  Future openGalleryMultiple() async {
    final List<XFile> pickedFileList = await ImagePicker().pickMultiImage();

    setState(() {
      _imageFileList = pickedFileList;
    });

    print(_imageFileList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Image Multiple'),
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
              child: const Text("Pick Image Multiple from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold)),
              onPressed: openGalleryMultiple,
            ),
            const SizedBox(
              height: 10,
            ),
            _imageFileList != null
                ? ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Image.file(File(_imageFileList![index].path));
                    },
                    itemCount: _imageFileList!.length,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
