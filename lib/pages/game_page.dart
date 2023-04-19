import 'package:flutter/material.dart';
import 'package:gamee_hacker_app/ad_helper.dart';
import 'package:gamee_hacker_app/components/game_response_textfield.dart';
import 'package:gamee_hacker_app/components/game_submit_button.dart';
import 'package:gamee_hacker_app/components/game_textfield.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _scoreController = TextEditingController();
  bool _isLoading = false;
  bool _isResponseDialogVisible = false;
  String _responseText = "";
  int _adCounter = 0;

  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  AppOpenAd? _appOpenAd;


  @override
  void initState() {
    super.initState();

    _loadAppOpenAd();
  }

  void _loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _appOpenAd = ad;
            
            _appOpenAd?.show();
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an app open ad: ${err.message}');
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {

          setState(() {
            _interstitialAd = ad;
            
            _interstitialAd?.show();

          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {

          setState(() {
            _rewardedAd = ad;

            _rewardedAd?.show(
              onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem){
                num amount = rewardItem.amount;
                debugPrint('Reward amount: $amount');
              }
            );
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.dispose();
  }

  Future<void> _submitScore() async {
    setState(() {
      _isLoading = true;
    });

    const apiUrl = "https://tggameehacker-api.ba-students.uz/api/update_score/";
    const apiKey = "OAyg2PFssTRePEQ6qZh5PQ"; // get your api_key -> https://tggameehacker-api.ba-students.uz/docs
    
    final gameUrl = _urlController.text;
    final gameScore = _scoreController.text;

    final url = Uri.parse('$apiUrl?api_key=$apiKey&score=$gameScore&url=$gameUrl');
    
    print(_urlController.text);
    print(_scoreController.text);

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final jsonResponse = jsonDecode(response.body);
          print(jsonResponse);

          setState(() {
            _responseText = jsonResponse['message'];
            print(_responseText);
          });
        }
      } else {
        setState(() {
          _responseText = "Something went wrong";
          print(_responseText);
        });
      }
    } catch (error) {
      setState(() {
        _responseText = error.toString();
        print(_responseText);
      });
    } finally {
      setState(() {
        _isLoading = false;
        _isResponseDialogVisible = true;
        _adCounter++;
        
        _loadInterstitialAd();

        if (_adCounter % 2 == 0) {
          _loadRewardedAd();
        }
      });
      dialogBuilder(
        context: context,
        message: _responseText,
        onPressed: () {
          setState(() {
            _isResponseDialogVisible = false;
          });

          _loadInterstitialAd();

          if (_adCounter % 2 == 0) {
            _loadRewardedAd();
          }
          Navigator.of(context).pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gamee Hack"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameTextField(
                      controller: _urlController,
                      hintText: "Enter game url here",
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a game url';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    GameTextField(
                      controller: _scoreController,
                      hintText: "Enter score here",
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a score';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    GameSubmitButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _submitScore();
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    if (_bannerAd != null)
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: _bannerAd!.size.width.toDouble(),
                          height: _bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd!),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
