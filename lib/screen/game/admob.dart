import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

String ios_key = dotenv.env['IOS_ADMOB']!;
String android_key = dotenv.env['ANDROID_ADMOB']!;

final Map<String, String> UNIT_ID = kReleaseMode
    ? {
  'ios': ios_key,
  'android': android_key,
}
    : {
  'ios': 'ca-app-pub-3940256099942544/2934735716',
  'android': 'ca-app-pub-3940256099942544/6300978111',
};

class Admob extends StatelessWidget {
  const Admob({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();

    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.banner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: AdRequest(),
    )..load();

    return

        Stack(
          children:[ Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: AdWidget(
              ad: banner,
            ),
          ),
        ]
        );
  }
}
