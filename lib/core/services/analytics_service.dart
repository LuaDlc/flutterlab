import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final _analytics = FirebaseAnalytics.instance;

  Future<void> setUserType(String type) async {
    await _analytics.setUserProperty(
      name: 'user_type',
      value: 'advanced',
    );
  }

  Future<void> logEvent(String name,
      {Map<String, Object>? params}) async {
    await _analytics.logEvent(
      name: name,
      parameters: params,
    );
  }
}
