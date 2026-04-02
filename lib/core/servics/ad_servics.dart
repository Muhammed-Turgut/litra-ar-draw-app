import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {

  InterstitialAd? _interstitialAd;
  bool _isAdReady = false;

  // Test ID (yayında kendi ID'ni kullan)
  static const String _adUnitId = 'ca-app-pub-6184842514914637/9423819240';

  // Reklamı yükle
  void loadAd() {
    InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdReady = true;

          // Reklam kapanınca dinle
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _isAdReady = false;
              _interstitialAd = null;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _isAdReady = false;
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isAdReady = false;
          debugPrint('Reklam yüklenemedi: $error');
        },
      ),
    );
  }

  // Reklamı göster, bitince sayfaya geç
  void showAdAndNavigate(BuildContext context, Function funTransition) {
    if (_isAdReady && _interstitialAd != null) {
      // Reklam bitince geçiş yap
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _isAdReady = false;
          _interstitialAd = null;

          // ✅ Reklam bitti → sayfaya geç
          funTransition();

        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          // Reklam gösterilemedi yine de geç
          funTransition();

        },
      );

      _interstitialAd!.show();
    } else {
        // Reklam hazır değil, direkt geç
        funTransition();

    }
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}