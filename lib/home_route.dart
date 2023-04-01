import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});


  Future<InitializationStatus> _initGoogleMobileAds() {

    return MobileAds.instance.initialize();
  }
  
  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }
}