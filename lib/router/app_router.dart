import 'package:flutter/material.dart';
import 'package:flutterlab/core/layouts/app_shell.dart';
import 'package:flutterlab/modules/dashboard/dashboard.dart';
import 'package:flutterlab/modules/forms/forms_page.dart';
import 'package:flutterlab/modules/media/media_page.dart';
import 'package:flutterlab/modules/numbers/numbers_page.dart';
import 'package:flutterlab/modules/settings/settings_page.dart';
import 'package:flutterlab/modules/text/rich_text_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },

        routes: [
          GoRoute(
            path: '/',
            name: 'dashboard',
            builder: (_, _) => const DashboardPage(),
          ),
          GoRoute(
            path: '/numbers',
            name: 'numbers',
            pageBuilder: (_, _) => const MaterialPage(child: NumbersPage()),
          ),

          GoRoute(
            path: '/text',
            name: 'text',
            builder: (_, _) => const RichTextPage(),
          ),

          GoRoute(
            path: '/media',
            name: 'media',
            builder: (_, _) => const MediaPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (_, _) => const SettingsPage(),
          ),
          GoRoute(
            path: '/forms',
            name: 'forms',
            builder: (_, _) => const FormsPage(),
          ),
        ],
      ),
    ],
  );
}
