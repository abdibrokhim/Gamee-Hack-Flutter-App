import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/5966250695'; 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4779220143200061/2989018979'; 
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/8016864813'; 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4779220143200061/8321236704'; 
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/9138374790'; 
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4779220143200061/6809678636';
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4779220143200061/6453335851';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4779220143200061/1473553484'; 
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}