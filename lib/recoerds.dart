import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
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
    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnedImage == null) return;
      setState(() {
        _selectImage = File(returnedImage.path);
      });
    } catch (e) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        print('Access Denied');
        showAlertDialog(context);
      }
    }
  }

  Future pickImageFromCamera() async {
    try{
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectImage = File(returnedImage.path);
    });
    }catch (e) {
      var status = await Permission.photos.status;
      if (status.isDenied) {
        print('Access Denied');
        showAlertDialog(context);
      }
    }
  }

  showAlertDialog(context) => showCupertinoDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Premission Denied'),
      content: Text('Allow Access To Gallery And Photos'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancle'),
        ),
          CupertinoDialogAction(
            isDefaultAction: true,
          onPressed: () => openAppSettings(),
          child: const Text('Settings'),
        )
      ]
    )
  );
}
