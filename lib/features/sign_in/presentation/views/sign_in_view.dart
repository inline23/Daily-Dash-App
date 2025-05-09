import 'package:daily_dash_app/core/utils/google_button.dart';
import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/presentation/views/home_view.dart';
import 'package:daily_dash_app/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // عدل المدة حسب طول الأنيميشن
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Lottie.asset(
                  'assets/images/person.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.forward();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
                prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Password'),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password?', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 40),
            MyButton(
              text: 'Sign In',
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomeView();
                }));
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                Text(
                  'Or continue with',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            GoogleButton(onTap: () {}),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
