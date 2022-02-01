import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telemedicine/service/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // 4
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Auth();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              //header..
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(height: 80),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Email Address",
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: _emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Email Required";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              //password

              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(), hintText: 'Password'),
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //sign in button
              Row(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // 1
                        user.login(
                            _emailController.text, _passwordController.text);
                      },
                      child: const Text('Login'),
                    ),
                  )
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {},
                child: const Text('Forget Password'),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      //  child: Image.asset('assets/facebook.png'),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/facebook.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      user.signInWithGoogle();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      //  child: Image.asset('assets/facebook.png'),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/google.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //sign up link ....

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      user.signup(
                          _emailController.text, _passwordController.text);
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
