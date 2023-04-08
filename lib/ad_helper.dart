import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2934735716'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // test ad unit id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/4411468910'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // test ad unit id 
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdVideoUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5135589807'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5135589807'; // test ad unit id 
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedInterstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6978759866'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/6978759866'; // test ad unit id
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1712485313'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // test ad unit id
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5662855259'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5662855259'; // test ad unit id
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}