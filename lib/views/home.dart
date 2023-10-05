import 'package:flutter/material.dart';
import 'package:validation_key/views/register.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<bool> hassanFunc(BuildContext context) async {
    bool result = false;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('sure?'),
            content: const Text('are you sour'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = true;
                    });
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const RegisterView();
                    }));
                  },
                  child: const Text('Yas')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = false;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('No')),
            ],
          );
        });
    return Future.value(result);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        return hassanFunc(context);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
      ),
    );
  }
}
