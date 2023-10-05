import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:validation_key/helpers/app_router.dart';
import 'package:validation_key/views/home.dart';

class AuthController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String userName = 'Ahmad';
  String userEmail = 'ahmadshaheen@gmail.com';
  String userPass = 'Ahmad!@#\$1234';

  checkLogin() {
    if (formKey.currentState!.validate()) {
      if (name.text == userName &&
          email.text == userEmail &&
          password.text == userPass) {
        Navigator.of(AppRouter.navKey!.currentContext!).push(
          MaterialPageRoute(
            builder: (context) {
              return const HomeView();
            },
          ),
        );
      } else {
        showDialog(
            context: AppRouter.navKey!.currentContext!,
            builder: (context) {
              return AlertDialog(
                title: const Text('error'),
                content: const Text('passowrd || email is error '),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('ok'))
                ],
              );
            });
      }
    }
    ;
  }

  String? validName(String? value) {
    if (value == null || value.isEmpty) {
      return 'name is null';
    } else if (value.length < 5) {
      return 'at least should be 4';
    } else {
      return null;
    }
  }

  String? validEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '*requered email';
    } else if (!isEmail(value)) {
      return 'enter avalid Email';
    } else {
      return null;
    }
  }

  String? validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is null';
    } else if (value.length < 5) {
      return 'at least should be 4';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'should have capital charcter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'should have small charcter';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'should have Numbers';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'should have !@#\$%^';
    } else {
      return null;
    }
  }
}
