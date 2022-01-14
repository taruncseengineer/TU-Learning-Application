import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';

class ImageView extends StatefulWidget {
  final String imagedata;

  const ImageView({Key key, this.imagedata}) : super(key: key);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        leading: BackArrowAppBar(),
        automaticallyImplyLeading: false,
        centerTitle: true,
        // actions: [
        //   MenuButtonAppBar(),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        height: size.height,
        width: size.width,
        child: PhotoView(
          maxScale: 3.0,
          minScale: 0.3,
          enableRotation: true,
          basePosition: Alignment.center,
          backgroundDecoration: BoxDecoration(color: Colors.white),
          imageProvider: AssetImage("images/math/${widget.imagedata}"),
        ),
      ),
    );
  }
}
