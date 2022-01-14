import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';
import 'package:tulearner/layout/menu/Math/mathequationpage.dart';

class MathFormulaList extends StatefulWidget {
  @override
  _MathFormulaListState createState() => _MathFormulaListState();
}

class _MathFormulaListState extends State<MathFormulaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        centerTitle: true,
        leading: BackArrowAppBar(),
        automaticallyImplyLeading: false,
        // actions: [
        //   MenuButtonAppBar(),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/mathjsondata.json"),
          builder: (context, snapshot) {
            var mathData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: mathData == null ? 0 : 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ImageView(
                              imagedata: mathData[index]['image'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        //margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.5,
                            color: Colors.black38,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Text(
                          mathData[index]['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
