import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';
import 'package:tulearner/layout/Widget/selectimagebutton.dart';
import 'package:tulearner/layout/menu/ImageTranslation/imageTranslationPage.dart';

class SelectImage extends StatefulWidget {
  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File image;

  final picker = ImagePicker();
  Future getimage(ImageSource source) async {
    try {
      var imageData = await picker.getImage(source: source);
      if (imageData != null) {
        setState(() {
          cropImage(File(imageData.path));
        });
      } else {
        Fluttertoast.showToast(
          msg: "Something is wrong.\nPlease try again to pick image",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.blue[900],
          textColor: Colors.white,
          fontSize: 20.0,
        );
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<File> cropImage(File image) async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.grey[800],
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        ));
    if (cropped != null) {
      setState(() {
        image = cropped;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageTarnslate(
            cropedImage: image,
          ),
        ),
      );
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        centerTitle: true,
        leading: BackArrowAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 3,
          //left: 5,
          // right: 8,
          bottom: 2,
        ),
        height: size.height,
        width: size.width,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectImageButton(
              title: "Select Image From Camera",
              onPressed: () {
                getimage(ImageSource.camera);
              },
            ),
            SizedBox(
              height: 15,
            ),
            SelectImageButton(
              title: "Select Image From Gallery",
              onPressed: () {
                getimage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
