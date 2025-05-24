import 'package:flutter/material.dart';
import 'package:news/features/view/article_details/article_details.dart';
import 'package:news/features/view/home_page/home_page.dart';
import 'package:news/features/view/search_screen/search_screen.dart';
import 'package:news/util/routes/routes_name.dart';

class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Control Navigation Routing at the Application
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePageScreen(),
        );
      case Routes.articleDetailsPage:
        return MaterialPageRoute(
          builder: (_) => const ArticleDetailScreen(),
        );
      case Routes.searchPage:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  ///Use the empty page
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Unknown Route'),
        ),
        body: const Center(
          child: Text('Unknown Route'),
        ),
      ),
    );
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    String untilRoute, {
    dynamic args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(untilRoute),
      arguments: args,
    );
  }

  /// To Back To First Page
  static void backToRoot() {
    navigatorKey.currentState!
        .popUntil((Route<dynamic> route) => route.isFirst);
  }

  static Future<dynamic> startNewRoute(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
