import 'package:flutter/material.dart';
import 'package:tulearner/layout/Ads/admob_service.dart';

class BackArrowAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue[900],
        ),
        onPressed: () {
          Navigator.pop(context);
          // AdMobService.showInterstitialAd(context);
        });
  }
}
