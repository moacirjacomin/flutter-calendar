import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 
 
import '../../features/calendar/presentation/screens/calendar_main_screen.dart';
import '../utils/shared_preference.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
List<String>? cookies = ShardPrefHelper.getCookie();

String setInitialLocation() {
  return (cookies == null || cookies!.isEmpty) ? '/' : '/home/false';
}

final GoRouter router = GoRouter(
    initialLocation: setInitialLocation(),
    // initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'calendarScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const CalendarMainScreen();
        },
      ),
     
    ]);
