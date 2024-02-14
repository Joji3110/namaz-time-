import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_namaz/navigation/navigation_menu.dart';
import 'package:time_namaz/pages/namaz/details_page.dart';
import 'package:time_namaz/pages/namaz/namaz_page.dart';
import 'package:time_namaz/pages/time/country_selection.dart';
import 'package:time_namaz/pages/time/time_page.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/home';

  static bool isCountrySelectionShown = false;

  // Private Navigator Keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorNamazKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellNamaz');

  // Go Router
  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Navigation Menu
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationMenu(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // Branch Home
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHomeKey,
            routes: [
              GoRoute(
                redirect: ((context, state) {
                  if (isCountrySelectionShown) {
                    return '/home/countrySelection';
                  } else {
                    return '/home';
                  }
                }),
                path: '/home',
                builder: (context, state) {
                  return TimePage(
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: '/home/countrySelection',
                builder: (context, state) => CountrySelection(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          // Branch Namaz
          StatefulShellBranch(
            navigatorKey: _rootNavigatorNamazKey,
            routes: [
              GoRoute(
                path: '/namaz',
                name: 'Namaz',
                builder: (context, state) {
                  return NamazPage(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'details',
                    name: 'details',
                    builder: (context, state) => DeatailsPage(
                      key: state.pageKey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
