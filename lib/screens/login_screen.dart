import 'package:first_application/provider/password_toggle.dart';
import 'package:first_application/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginStateState();
}

class _LoginStateState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    ref.read(animationProvider.notifier).state = true;

    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    ref.read(animationProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text('Welcome $name', style: TextStyle(fontSize: 30)),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email_sharp),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "email can't be empty";
                            } else if (!value.contains('@')) {
                              return 'email must contain @';
                            }
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "password cann't be empty";
                            } else if (value.length < 6) {
                              return "Password must contain atleast 6 character";
                            }
                          },
                        ),
                        SizedBox(height: 50),
                        Material(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),

                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              height: 50,
                              width: changeContainer ? 50 : 140,
                              alignment: Alignment.center,

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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
