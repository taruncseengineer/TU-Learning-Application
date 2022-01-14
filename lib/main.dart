import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tulearner/layout/Ads/admob_service.dart';
import 'package:tulearner/layout/BottomNavigation/bottomNavBar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   AdMobService.initialize();
  runApp(TuLearner());
}

class TuLearner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[900],
        primarySwatch: Colors.purple,
      ),
      title: "TULearning",
      home: SplashScreen(
        useLoader: false,
        seconds: 5,
        photoSize: 120,
        image: Image.asset(
          "images/logo/logo_4.jpg",
          alignment: Alignment.center,
        ),
        loadingText: Text(
          "TULearning",
          style: TextStyle(
            fontSize: 35,
            wordSpacing: 1.5,
            letterSpacing: 1.5,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        navigateAfterSeconds: BottomNav(),
      ),
    );
  }
}

// Banner{
//   appId:ca-app-pub-4838731984025359~9576337387
//   unitId:ca-app-pub-4838731984025359/8538587886
// }
