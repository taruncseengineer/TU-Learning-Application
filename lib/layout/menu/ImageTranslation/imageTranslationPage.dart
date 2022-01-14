import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';
import 'package:tulearner/layout/menu/Translate/translation.dart';

class ImageTarnslate extends StatefulWidget {
  final File cropedImage;

  const ImageTarnslate({Key key, this.cropedImage}) : super(key: key);
  @override
  _ImageTarnslateState createState() => _ImageTarnslateState();
}

class _ImageTarnslateState extends State<ImageTarnslate> {
  String langauge;
  String result;
  String translate;
  Future readTextFromImage() async {
    result = '';
    FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(widget.cropedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);
    for (TextBlock block in visionText.blocks) {
      for (TextLine textLine in block.lines) {
        for (TextElement words in textLine.elements) {
          if (words.text != null) {
            setState(() {
              result = result + " " + words.text;
            });
          }
        }
      }
    }
    setState(() {
      if (result != null) {
        translator(result, langauge);
      } else {
        Fluttertoast.showToast(
          msg: "Something is wrong.\nPlease try again later",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.blue[900],
          textColor: Colors.white,
          fontSize: 20.0,
        );
      }
    });
  }

  translator(String input, String language) async {
    translate = '';
    GoogleTranslator googleTranslator = GoogleTranslator();
    var data = await googleTranslator.translate(input, to: language);
    if (data != null) {
      setState(() {
        translate = data.toString();
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TranslateOutputPage(
            input: result,
            output: translate,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        leading: BackArrowAppBar(),
        // actions: [
        //   MenuButtonAppBar(),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 3,
          bottom: 2,
        ),
        height: size.height,
        width: size.width,
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 35,
                  top: 20,
                ),
                child: Container(
                  height: size.height * 0.72,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.black38,
                    ),
                    image: DecorationImage(
                      image: FileImage(widget.cropedImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //child: Placeholder(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: size.width * 0.90,
                child: DropdownButton<String>(
                  hint: Text(
                    "Select your Language",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      langauge = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: "hi",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Hindi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "en",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "mr",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Marathi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "pa",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Punjabi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "ta",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Tamil",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "ur",
                      onTap: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            readTextFromImage();
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Internet is Disconnected",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.blue[900],
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          "Urdu",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
