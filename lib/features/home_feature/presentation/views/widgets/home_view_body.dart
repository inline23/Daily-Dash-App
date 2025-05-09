import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/widgets/completed_tasks_list_view.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/widgets/ongoing_lsit_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomAppBar()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Completed Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CompletedTasksListView(),
                  const SizedBox(height: 34),
                  Text(
                    'Ongoing Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OngoingListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(color: primaryColor, fontSize: 12),
              ),
              Text(
                'Waleed Mohammed',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ],
      ),
    );
  }
}
