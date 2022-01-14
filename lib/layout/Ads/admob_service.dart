import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {


  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = BannerAd(
      size: AdSize.smartBanner,
      adUnitId: bannerAdUnitId,
      listener: AdListener(
        onAdLoaded: (Ad ad) => print("Ad is loaded"),
        onAdOpened: (Ad ad) => print("Ad is open"),
        onAdClosed: (Ad ad) => print("Ad is close"),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
      request: AdRequest(),
    );
    return ad;
  }

  static InterstitialAd _interstitialAd;
  static InterstitialAd createInterstitialAd(BuildContext context) {
    return InterstitialAd(
      adUnitId: interstitialAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          _interstitialAd.show();
        },
        onAdClosed: (Ad ad) {
          ad.dispose();
          Navigator.pop(context);
        },
        onAdOpened: (Ad ad) => print("ad is open"),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print("$error is failed");
          ad.dispose();
        },
        onApplicationExit: (Ad ad) {
          ad.dispose();
        },
      ),
    );
  }

  static void showInterstitialAd(BuildContext context) {
    // _interstitialAd.dispose();
    // _interstitialAd = null;
    if (_interstitialAd == null)
      _interstitialAd = createInterstitialAd(context);
    _interstitialAd.load();
  }
}
