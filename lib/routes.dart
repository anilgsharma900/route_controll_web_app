import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_authentication/auth_service.dart';
import 'package:route_authentication/dashbaord_view.dart';
import 'package:route_authentication/details_view.dart';
import 'package:route_authentication/main.dart';

class AppRoutes {
  static const loginRoute = "/";
  static const dashboardRoute = "/Dashboard";
  static const detailsRoute = "/Details";

  static final List<GetPage> routes = [
    GetPage(name: loginRoute, page: () => const LoginView()),
    GetPage(name: dashboardRoute, page: () => const DashboardView(), middlewares: [RouteMiddleWare()]),
    GetPage(name: detailsRoute, page: () => const DetailsView(), middlewares: [RouteMiddleWare()]),
  ];

// static final GoRouter routes = GoRouter(routes: <GoRoute>[
//   GoRoute(
//     path: loginRoute,
//     builder: (BuildContext context, state) => const LoginView(),
//   ),
//   GoRoute(
//     path: DashboardRoute,
//     builder: (_, state) => const DashboardView(),
//     redirect: (context, state) => _redirect(context),
//   ),
//   GoRoute(
//     path: DetailsRoute,
//     builder: (_, state) => const DetailsView(),
//     redirect: (context, state) => _redirect(context),
//   ),
// ]);

// static String? _redirect(BuildContext context) {
//   return AuthService.authenticated ? null : context.namedLocation("/");
// }
}

class RouteMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return !AuthService.authenticated ? const RouteSettings(name: AppRoutes.loginRoute) : null;
  }
}
