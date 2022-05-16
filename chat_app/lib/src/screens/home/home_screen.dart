import 'package:chat_app/service_locators.dart';
import 'package:chat_app/src/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _auth = locator<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              _auth.logout();
            },
            icon: const Icon(Icons.logout),
            color: Theme.of(context).primaryColor),
        title: const Text('Welcome User!'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text("Signed - in 😊"),
              IconButton(
                  onPressed: () async {
                    _auth.logout();
                  },
                  icon: const Icon(Icons.logout),
                  color: Theme.of(context).colorScheme.secondary)
            ],
          ),
        ],
      )),
    );
  }
}
