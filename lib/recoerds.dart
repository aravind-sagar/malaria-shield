import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class records extends StatefulWidget {
  const records({Key? key}) : super(key: key);

  @override
  State<records> createState() => _recordsState();
}

class _recordsState extends State<records> {
  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RECORDS PAGE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Picm Image From Gallery',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () {
                pickImageFromGallery();
              },
            ),
            MaterialButton(
              color: Colors.red,
              child: const Text(
                'Picm Image From Camera',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () {
                pickImageFromCamera();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            _selectImage != null
                ? Image.file(_selectImage!)
                : Text('Please select An Image')
          ],
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectImage = File(returnedImage.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectImage = File(returnedImage.path);
    });
  }
}
