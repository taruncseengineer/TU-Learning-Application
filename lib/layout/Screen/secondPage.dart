import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tulearner/layout/Ads/admob_service.dart';
import 'package:tulearner/layout/Widget/LlistViewContainerWidget.dart';
import 'package:tulearner/layout/Widget/appBarWidget.dart';
import 'package:tulearner/layout/menu/Dictionary/dictionaryPage.dart';
import 'package:tulearner/layout/menu/ImageTranslation/selectImage.dart';
import 'package:tulearner/layout/menu/Math/mathFormulaList.dart';
import 'package:tulearner/layout/menu/chemistry/chemistryPage.dart';
import 'package:tulearner/layout/menu/sentanceTranslation/sentanceTranslation.dart';

class FeatureMenu extends StatefulWidget {
  @override
  _FeatureMenuState createState() => _FeatureMenuState();
}

class _FeatureMenuState extends State<FeatureMenu> {
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
        //     width: 10,
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 12,
          left: 8,
          right: 8,
          bottom: 2,
        ),
        height: size.height,
        width: size.width,
        color: Colors.grey[300],
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          mainAxisSpacing: 10,
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
              name1: "Maths",
              name2: "Formula",
              imgname: "images/face/ToyFaces5.png",
              color: Colors.pinkAccent,
            ),
            // ListviewContainer(
            //   onpressed: () {},
            //   name1: "Physics",
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
              name2: "Formula",
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
    );
  }
}
