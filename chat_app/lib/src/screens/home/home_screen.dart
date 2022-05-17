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
        child: Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(5, 10), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Signed - in 😊"),
                    Container(
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  5, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                            onPressed: () async {
                              _auth.logout();
                            },
                            icon: const Icon(Icons.logout),
                            color: Theme.of(context).colorScheme.secondary)),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
