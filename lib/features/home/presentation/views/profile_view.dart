import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/profile_info_item.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              CustomAppBar(title: 'Profile'),
              const SizedBox(height: 50),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 63.5,
              ),
              const SizedBox(height: 30),
              ProfileInfoItem(title: 'Waleed', icon: Icons.person_outline),
              ProfileInfoItem(
                title: 'waleed@gmail.com',
                icon: Icons.email_outlined,
              ),
              ProfileInfoItem(title: 'password', icon: Icons.lock_outline),
              Spacer(),
              MyButton(onTap: () {}, text: 'Logout'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
