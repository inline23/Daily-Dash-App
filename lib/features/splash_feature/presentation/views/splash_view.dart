import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/sign_in_feature/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust this duration as needed
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Lottie.asset(
                  'assets/images/calendar.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.forward();
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Manage\nYour\nTask with',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: .9,
              ),
            ),

            Text(
              'DailyDash',
              style: TextStyle(
                fontSize: 60,
                color: primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            MyButton(
              text: 'Let\'s Get Started',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
