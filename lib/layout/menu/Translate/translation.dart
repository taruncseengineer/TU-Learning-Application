import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';

class TranslateOutputPage extends StatefulWidget {
  final String input;
  final String output;

  const TranslateOutputPage({Key key, this.input, this.output})
      : super(key: key);
  @override
  _TranslateOutputPageState createState() => _TranslateOutputPageState();
}

class _TranslateOutputPageState extends State<TranslateOutputPage> {
  FlutterTts flutterTts = FlutterTts();

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
          // left: 5,
          // right: 5,
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
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.40,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.black38,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.input,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.45,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 2.5,
                      color: Colors.black38,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.28,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.output,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 15,
                            bottom: 4,
                          ),
                          height: size.height * 0.13,
                          width: size.width * 0.50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.copy,
                                  color: Colors.black54,
                                  size: 43,
                                ),
                                onPressed: () {
                                  if (widget.output != null) {
                                    setState(() {
                                      FlutterClipboard.copy(widget.output);
                                    });
                                    Fluttertoast.showToast(
                                      msg: "Text Copied!",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 5,
                                      backgroundColor: Colors.blue[900],
                                      textColor: Colors.white,
                                      fontSize: 20.0,
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.contactless,
                                  color: Colors.black54,
                                  size: 50,
                                ),
                                onPressed: () async {
                                  await flutterTts.awaitSpeakCompletion(true);
                                  await flutterTts.speak(widget.output);
                                  await flutterTts.isLanguageInstalled("hi-IN");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
