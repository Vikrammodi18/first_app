import 'package:first_application/provider/password_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleIcon = ref.watch(toggleProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/loginImage.png'),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_sharp),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: toggleIcon,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(
                              toggleIcon
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              ref.read(toggleProvider.notifier).state =
                                  !toggleIcon;
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                        onPressed: () {
                          print("vikram");
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
