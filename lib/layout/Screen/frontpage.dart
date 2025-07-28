import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:forceupdate/forceupdate.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:translator/translator.dart';
import 'package:tulearner/layout/Ads/admob_service.dart';
import 'package:tulearner/layout/Widget/LlistViewContainerWidget.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:http/http.dart' as http;
import 'package:tulearner/layout/Widget/errorshowWidget.dart';
import 'package:tulearner/layout/menu/Dictionary/dictionaryPage.dart';
import 'package:tulearner/layout/menu/ImageTranslation/selectImage.dart';
import 'package:tulearner/layout/menu/Math/mathFormulaList.dart';
import 'package:tulearner/layout/menu/chemistry/chemistryPage.dart';
import 'package:tulearner/layout/menu/sentanceTranslation/sentanceTranslation.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List result;
  Future fetchData() async {
    String url = "";
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        setState(() {
          result = decodeData;
        });
        print(result[0]['q']);
      }
      googletranslate(result == null ? "" : result[0]['q']);
    } catch (e) {
      if (e is SocketException) {
        Fluttertoast.showToast(
            msg: "Network is slow,Please restart the application",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.blue[900],
            textColor: Colors.white,
            fontSize: 20.0);
      } else if (e is TimeoutException) {
        Fluttertoast.showToast(
            msg: "Network is slow,Please restart the application",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.blue[900],
            textColor: Colors.white,
            fontSize: 20.0);
      } else if (e is HandshakeException) {
        Fluttertoast.showToast(
            msg: "Network is slow,Please restart the application",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.blue[900],
            textColor: Colors.white,
            fontSize: 20.0);
      } else {
        Fluttertoast.showToast(
            msg: "Network is slow,Please restart the application",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.blue[900],
            textColor: Colors.white,
            fontSize: 20.0);
      }
    }
  }

  String output = '';
  googletranslate(String input) async {
    final translate = GoogleTranslator();
    try {
      var tranlateWord = await translate.translate(input, to: 'hi');
      if (tranlateWord != null) {
        setState(() {
          output = tranlateWord.toString();
        });
      }
      print(output);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.blue[900],
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }

  StreamSubscription subscription;
  bool isConnected = false;
  Future<bool> networkconnect() async {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isConnected = (result != ConnectivityResult.none);
        if (isConnected == true) {
          setState(() {
            fetchData();
          });
        }
      });
    });
    return isConnected;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      networkconnect();
      // _checkUpdate();
    });
  }

  // Future _checkUpdate() async {
  //   final checkVersion = CheckVersion(context: context);
  //   final appStatus = await checkVersion.getVersionStatus();
  //   if (appStatus.canUpdate) {
  //     checkVersion.showUpdateDialog("", "");
  //   }
  // }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.8,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        // actions: [
        //   MenuButtonAppBar(),
        //   SizedBox(
        //     width: 5,
        //   ),
        // ],
      ),
      body: isConnected
          ? Container(
              padding: EdgeInsets.only(
                top: 12,
                left: 8,
                right: 8,
                bottom: 2,
              ),
              height: size.height,
              width: size.width,
              color: Colors.grey[300],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      height: 220,
                      width: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ListviewContainer(
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectImage(),
                                ),
                              );
                            },
                            name1: "Image",
                            name2: "Translator",
                            imgname: "images/face/ToyFaces7.png",
                            color: Colors.orangeAccent,
                          ),
                          ListviewContainer(
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SentenceInputPage(),
                                ),
                              );
                            },
                            name1: "Sentence",
                            name2: "Translator",
                            imgname: "images/face/ToyFaces8.png",
                            color: Colors.greenAccent,
                          ),
                          ListviewContainer(
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DictionaryPage(),
                                ),
                              );
                            },
                            name1: "Dictionary",
                            name2: "(English to \nHindi)",
                            imgname: "images/face/ToyFaces2.png",
                            color: Colors.yellowAccent,
                          ),
                          ListviewContainer(
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MathFormulaList(),
                                ),
                              );
                            },
                            name1: "Math's",
                            name2: "Formula",
                            imgname: "images/face/ToyFaces5.png",
                            color: Colors.pinkAccent,
                          ),
                          // ListviewContainer(
                          //   onpressed: () {},
                          //   name1: "Physic's",
                          //   name2: "Formula",
                          //   imgname: "image/1.jpg",
                          //   color: Colors.greenAccent,
                          // ),
                          ListviewContainer(
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChemistryList(),
                                ),
                              );
                            },
                            name1: "Chemistry",
                            name2: "",
                            imgname: "images/face/ToyFaces6.png",
                            color: Colors.redAccent[100],
                          ),
                          ListviewContainer(
                            onpressed: () {
                              return showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // backgroundColor: Colors.grey[500],
                                      title: Text(
                                        "Computer Programming",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      contentTextStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      content: Text(
                                          '''We are working now for collecting the easy and suitable content for you to understand the concept about computer programming.We will provide so many Programming Languages and Quiz.We will launch soon as possible for you.\nThank You'''),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            name1: "Computer",
                            name2: "Programming",
                            imgname: "images/face/ToyFaces4.png",
                            color: Colors.purpleAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    NeumorphicText(
                      "  Today Life Quotes........",
                      curve: Neumorphic.DEFAULT_CURVE,
                      style: NeumorphicStyle(
                        shadowDarkColor: Colors.black12,
                        depth: 18,
                        intensity: 0.9,
                        color: Colors.black,
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Container(
                    //   height: 50,
                    //   child:
                    //       AdWidget(ad: AdMobService.createBannerAd()..load()),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            depth: -20,
                            intensity: 0.9,
                            color: Colors.grey[200],
                          ),
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 20,
                            right: 15,
                          ),
                          child: SizedBox(
                            height: 280,
                            width: 300,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    result == null
                                        ? "Please Waiting..."
                                        : "''.." + result[0]['q'] + "..''",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    output,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    result == null
                                        ? ""
                                        : "Auther :- " + result[0]['a'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: 1.5,
                                      color: Colors.pinkAccent.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          : ErrorShowWidget(size: size),
    );
  }
}
