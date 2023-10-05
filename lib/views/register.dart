import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validation_key/controller/auth_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, pr, w) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: Form(
            key: pr.formKey,
            child: Column(children: [
              CusttomFormFiled(
                title: 'Name',
                func: pr.validName,
                controller: Provider.of<AuthController>(context).name,
              ),
              const SizedBox(
                height: 8,
              ),
              CusttomFormFiled(
                func: pr.validEmail,
                title: 'Email',
                controller: Provider.of<AuthController>(context).email,
              ),
              const SizedBox(
                height: 8,
              ),
              CusttomFormFiled(
                func: pr.validPassword,
                title: 'Password',
                controller: Provider.of<AuthController>(context).password,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AuthController>(context, listen: false)
                      .checkLogin();
                },
                child: const Text('Submit'),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class CusttomFormFiled extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final AhmadFunction func;
  const CusttomFormFiled({
    required this.title,
    required this.controller,
    required this.func,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: func,
      controller: controller,
      decoration: InputDecoration(hintText: title),
    );
  }
}

typedef String? AhmadFunction(String? x);
