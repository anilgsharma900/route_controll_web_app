import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:route_authentication/auth_service.dart';
import 'package:route_authentication/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static MyAppState of(BuildContext context) => context.findAncestorStateOfType<MyAppState>()!;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.loginRoute,
      getPages: AppRoutes.routes,
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                AuthService.authenticated = true;
                Get.toNamed(AppRoutes.dashboardRoute);
                // GoRouter.of(context).go(AppRoutes.DashboardRoute);
              },
              child: const Text("Login")),
        ));
  }
}
