import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/Widget/backArrowAppBar.dart';

class ChemistryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: Colors.grey[300],
        title: AppName(),
        leading: BackArrowAppBar(),
        centerTitle: true,
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
              .loadString("assets/chemistryjsondata.json"),
          builder: (context, snapshot) {
            var chemistryData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: chemistryData == null ? 0 : 118,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade100,
                              Colors.grey.shade200,
                              Colors.grey.shade300,
                              Colors.grey.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                          border: Border.all(
                            width: 2,
                            color: Colors.black38,
                          )),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            chemistryData[index]['name']
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.redAccent.shade700,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            chemistryData[index]['Symbol'],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Atomic Number :- ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                chemistryData[index]['Atomic Number'],
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Atomic Mass :- ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                chemistryData[index]['Atomic Mass'],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent.shade700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            chemistryData[index]['Family'],
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
