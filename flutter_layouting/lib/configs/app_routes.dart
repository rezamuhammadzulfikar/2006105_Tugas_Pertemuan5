import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_layouting/modul/news_detail/news_detail.dart';
import 'package:flutter_layouting/modul/splash_screen/splash_screen.dart';
import '../models/user.dart';
import '../modul/home_screen/home_screen.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String profile = "profile";
  static const String newsDetail = "news-detail";

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  static Page _homeScreenRoutePageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User(
        id: 002,
        name: "Reza Muhammad Zulfikar",
        userName: "2006105",
        email: "2006105@itg.ac.id",
        profileImage:
            "https://th.bing.com/th/id/R.6ae74c5f86466ef4f6fc6253c767381a?rik=5DSgIRvIaK7UPw&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fProfile-Avatar-PNG.png&ehk=GVMh4KTpyOBERsOt5H%2b8TcGp%2bS8DdbR6niBs54kRaYA%3d&risl=&pid=ImgRaw&r=0",
        phoneNumber: "0895358125995",
      );
    }

    return CustomTransitionPage(
      child: HomeScreen(
        key: state.pageKey,
        user: user,
      ),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Page _newsDetailScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.params["id"] != null) {
      return MaterialPage(
        key: state.pageKey,
        child: NewsDetailScreen(
          newsId: state.params["id"]!,
        ),
      );
    } else {
      return const MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text("Data Not Found"),
          ),
        ),
      );
    }
  }

  static final GoRouter goRouter = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRoutePageBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail/:id",
            pageBuilder: _newsDetailScreenRouteBuilder,
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}
