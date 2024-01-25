import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ElevatedButton(onPressed: () {
              pickImageGallery();
            }, child: Text('Pick from Gallery ')),
            ElevatedButton(onPressed: () {
              pickImageCamera();
            }, child: Text('Pick from Camera ')),
            selectedImage == null
                ?  Text('Please select an image')
                :Image.file(selectedImage!)

          ],
        ),
      ),
    );
  }
//Functions for selecting imges from gallery or camera
  Future pickImageGallery() async {
    final returedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage =File(returedImage!.path);
    });
  }

  Future pickImageCamera() async {
    final returedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage =File(returedImage!.path);
    });
  }
}
