import 'package:daily_dash_app/features/home/presentation/widgets/completed_tasks_list_view.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/ongoing_lsit_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, r});
  // required this.use
  // final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          //user.displayName ?? "User"
          SliverToBoxAdapter(child: HomeAppBar(name: "Waleed")),
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
