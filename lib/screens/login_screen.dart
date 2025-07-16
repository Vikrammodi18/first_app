import 'package:first_application/provider/password_toggle.dart';
import 'package:first_application/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleIcon = ref.watch(toggleProvider);
    String name = ref.watch(nameProvider);
    final changeContainer = ref.watch(animationProvider);
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
                      Text('Welcome $name', style: TextStyle(fontSize: 30)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_sharp),
                        ),
                        onChanged: (value) {
                          ref.read(nameProvider.notifier).state = value;
                        },
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
                      SizedBox(height: 50),
                      InkWell(
                        onTap: () async {
                          ref.watch(animationProvider.notifier).state =
                              !changeContainer;
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: 50,
                          width: changeContainer ? 50 : 140,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: changeContainer
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  'Login',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
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
