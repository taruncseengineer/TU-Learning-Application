import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';
import 'package:http/http.dart' as http;

class DictionaryPage extends StatefulWidget {
  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  bool selected = false;
  String translateOutPut;
  List result;
  String url = 'https://owlbot.info/api/v4/dictionary/owl -s | json_pp';
  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController;
  String imageurl;
  Future<String> getDatafromApi(String input) async {
    try {
      String urlname = 'https://owlbot.info/api/v4/dictionary/';
      String token = '2786a4bab21d208fdb44a1d96825ba3ed387de6f';

      var response = await http
          .get(urlname + input, headers: {"Authorization": "Token " + token});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data != null) {
          setState(() {
            result = data['definitions'];
            imageurl = data['definitions'][0]['image_url'];
          });
        }
      }
      return "Data";
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
    return "Suceesful";
  }

  translotor(String inputText) async {
    GoogleTranslator googleTranslator = GoogleTranslator();
    var data = await googleTranslator.translate(inputText, to: 'hi');
    if (data != null) {
      setState(() {
        translateOutPut = data.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    selected = true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        leading: BackArrowAppBar(),
        title: AppName(),
        // actions: [
        //   MenuButtonAppBar(),
        //   SizedBox(
        //     width: 5,
        //   ),
        // ],
      ),
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: selected == true && result == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.white,
                        depth: 10,
                        intensity: 0.9,
                        shape: NeumorphicShape.concave,
                        surfaceIntensity: 0.5,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        height: 60,
                        width: size.width * 80,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter some word";
                            }
                            return null;
                          },
                          controller: textEditingController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Enter Word",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NeumorphicButton(
                    padding: EdgeInsets.all(20),
                    minDistance: -5,
                    onPressed: () async {
                      var connectivityResult =
                          await (Connectivity().checkConnectivity());
                      if (_formKey.currentState.validate()) {
                        if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                          setState(() {
                            translotor(textEditingController.text);
                            getDatafromApi(textEditingController.text);
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Internet is Disconnected",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.blue[900],
                              textColor: Colors.white,
                              fontSize: 20.0);
                        }
                      }
                      selected = false;
                    },
                    child: Text(
                      "English To Hindi\n\t\t\t\t\tDictionary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(milliseconds: 200),
                    style: NeumorphicStyle(
                      color: Colors.white,
                      depth: 20,
                      intensity: 0.9,
                    ),
                  ),
                ],
              )
            : Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      translateOutPut == null ? "" : translateOutPut,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(
                        imageurl == null
                            ? "https://image.shutterstock.com/z/stock-photo-error-wooden-letters-on-the-office-desk-informative-and-communication-background-1023011758.jpg"
                            : imageurl,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: result == null ? 0 : result.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              width: size.width * 0.90,
                              child: SingleChildScrollView(
                                child: ListTile(
                                  title: Text(
                                    "Type :- " + " " + result[index]['type'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                  // leading: result[index]['image_url'] != null
                                  //     ? CachedNetworkImage(
                                  //         imageUrl: result[index]['image_url'])
                                  //     : Container(),
                                  // leading: CachedNetworkImage(
                                  //   imageUrl: result[index]['image_url']!=null?result[index]['image_url'],
                                  //   placeholder: (context, url) =>
                                  //       CircularProgressIndicator(),
                                  //   errorWidget: (context, url, error) =>
                                  //       Image.asset(
                                  //           "https://image.shutterstock.com/z/stock-photo-error-wooden-letters-on-the-office-desk-informative-and-communication-background-1023011758.jpg"),
                                  // ),
                                  subtitle: Text(
                                    "example :- " + result[index]['definition'],
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
