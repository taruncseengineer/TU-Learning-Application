import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';
import 'package:tulearner/layout/menu/Translate/translation.dart';

class SentenceInputPage extends StatefulWidget {
  @override
  _SentenceInputPageState createState() => _SentenceInputPageState();
}

class _SentenceInputPageState extends State<SentenceInputPage> {
  final _formKey = GlobalKey<FormState>();
  String translateOutPut;
  TextEditingController textEditingController = TextEditingController();
  Future translotor(String inputText, String language) async {
    translateOutPut = '';
    GoogleTranslator googleTranslator = GoogleTranslator();
    var data = await googleTranslator.translate(inputText, to: language);
    if (data != null) {
      setState(() {
        translateOutPut = data.toString();
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TranslateOutputPage(
            input: textEditingController.text,
            output: translateOutPut.toString(),
          ),
        ),
      );
    }
    return translateOutPut;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        centerTitle: true,
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
        child: Form(
          key: _formKey,
          child: Column(
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter some sentence";
                        }
                        return null;
                      },
                      controller: textEditingController,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // disabledBorder: InputBorder.none,
                          hintText: "Enter Your Sentence",
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
                        translotor(textEditingController.text, 'hi');
                      });
                    } else {
                      Fluttertoast.showToast(
                          msg: "Internet is Disconnected",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.blue[900],
                          textColor: Colors.white,
                          fontSize: 22.0);
                    }
                  }
                },
                child: Text(
                  "Hindi Translate",
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
          ),
        ),
      ),
    );
  }
}
