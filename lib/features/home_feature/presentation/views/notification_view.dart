import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Soon',
          style: TextStyle(color: primaryColor, fontSize: 24),
        ),
      ),
    );
  }
}
