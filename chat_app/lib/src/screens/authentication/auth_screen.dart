import 'package:chat_app/service_locators.dart';
import 'package:chat_app/src/controllers/auth_controllers.dart';
import 'package:chat_app/src/navigation/navigation_service.dart';
import 'package:chat_app/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String route = "authScreen";

  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _unCon = TextEditingController(),
      _passCon = TextEditingController();
  final AuthController _auth = locator<AuthController>();

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Login'),
    Tab(text: 'Register'),
  ];

  @override
  void initState() {
    _auth.addListener(handleLogin);
    super.initState();
  }

  @override
  void dispose() {
    _auth.removeListener(handleLogin);
    super.dispose();
  }

  void handleLogin() {
    if (_auth.currentUser != null) {
      locator<NavigationService>().pushReplacementNamed(HomeScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        //safearea secures the whole body to stay within the safe area (not to lapas nav items)
        child: Center(
          child: SingleChildScrollView(
            //tips for singlechildscrollview
            //used to not let thing overflow when dealing with keyboard
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
              child: Form(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState?.validate();
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(_auth.error?.message ?? ''),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Username'),
                      controller: _unCon,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      controller: _passCon,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // ElevatedButton(
                            //   onPressed:
                            //       (_formKey.currentState?.validate() ?? false)
                            //           ? () {
                            //               _auth.register(
                            //                   email: _unCon.text.trim(),
                            //                   password: _passCon.text.trim());
                            //             }
                            //           : null,
                            //   style: ElevatedButton.styleFrom(
                            //       padding: const EdgeInsets.all(15),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(5.0),
                            //       ),
                            //       primary: (_formKey.currentState?.validate() ??
                            //               false)
                            //           ? Theme.of(context).colorScheme.primary
                            //           : Colors.grey),
                            //   child: const Text('Register'),
                            // ),
                            ElevatedButton(
                              onPressed:
                                  (_formKey.currentState?.validate() ?? false)
                                      ? () {
                                          _auth.login(_unCon.text.trim(),
                                              _passCon.text.trim());
                                        }
                                      : null,
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  primary: (_formKey.currentState?.validate() ??
                                          false)
                                      ? Theme.of(context).colorScheme.secondary
                                      : Colors.grey),
                              child: const Text('Log in'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
