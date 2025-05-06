import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/logo.png', width: 85)),
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
            MyButton(text: 'Sign In', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
