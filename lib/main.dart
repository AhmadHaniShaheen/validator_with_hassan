import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_key/controller/auth_controller.dart';
import 'package:validation_key/helpers/app_router.dart';
import 'package:validation_key/views/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthController>(
      create: (context){
        return AuthController();
      },
      child: Builder(
        builder: (context) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const RegisterView(),
          );
        }
      ),
    );
  }
}
