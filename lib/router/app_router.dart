import 'package:flutterlab/modules/dashboard/dashboard.dart';
import 'package:flutterlab/modules/media/media_page.dart';
import 'package:flutterlab/modules/numbers/numbers_page.dart';
import 'package:flutterlab/modules/settings/settings_page.dart';
import 'package:flutterlab/modules/text/text_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (context, state) => DashboardPage(),
      ),
      GoRoute(
        path: '/numbers',
        name: 'numbers',
        builder: (context, state) {
          return const NumbersPage();
        },
      ),

      GoRoute(
        path: '/text',
        name: 'text',
        builder: (context, state) {
          return const TextPage();
        },
      ),

      GoRoute(
        path: '/media',
        name: 'media',
        builder: (context, state) {
          return const MediaPage();
        },
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) {
          return const SettingsPage();
        },
      ),
    ],
  );
}
