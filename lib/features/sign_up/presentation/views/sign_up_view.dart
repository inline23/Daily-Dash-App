import 'package:daily_dash_app/core/utils/firebase_service.dart';
import 'package:daily_dash_app/core/utils/google_button.dart';
import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/presentation/views/home_view.dart';
import 'package:daily_dash_app/features/sign_in/presentation/views/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Create your account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Full Name'),
                prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
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
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Password'),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
              ),
            ),

            const SizedBox(height: 40),
            MyButton(
              text: 'Sign Up',
              onTap: () async {
                FirebaseService service = FirebaseService();
                User? user = await service.signUp(
                  nameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                }
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
                  'Already have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignInView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Login',
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
