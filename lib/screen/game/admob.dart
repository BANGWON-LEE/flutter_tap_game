import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
  'ios': 'ca-app-pub-1752739692981009/2515782859',
  'android': 'ca-app-pub-1752739692981009/2515782859',
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
            height: 130,
            child: AdWidget(
              ad: banner,
            ),
          ),
        ]
        );
  }
}
