import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(userId);
  }

  Future<void> logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'E-mail');
  }

  Future<void> logUserDetailsAdded() async {
    await _analytics.logEvent(name: 'User Details added');
  }

  Future<void> logSignIn() async {
    await _analytics.logLogin(loginMethod: 'E-mail');
  }

  Future<void> logSignOut() async {
    await _analytics.logEvent(name: 'Signed out');
  }

  Future<void> logIndicatorAdded(String name) async {
    await _analytics.logEvent(name: name);
  }
}
