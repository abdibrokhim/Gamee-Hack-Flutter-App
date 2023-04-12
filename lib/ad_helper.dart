import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/5966250695'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // test ad unit id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // test ad unit id 
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // test ad unit id
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/6453335851'; // test ad unit id 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5662855259'; // test ad unit id
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}