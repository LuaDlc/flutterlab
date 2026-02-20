import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero, // só para estudo
      ),
    );

    await _remoteConfig.setDefaults({'advanced_feature_variant': false});

    await _remoteConfig.fetchAndActivate();
  }

  bool get isAdvancedFeatureEnabled =>
      _remoteConfig.getBool('advanced_feature_enabled');

  String get featureVariant =>
      _remoteConfig.getString('advanced_feature_variant');
}
