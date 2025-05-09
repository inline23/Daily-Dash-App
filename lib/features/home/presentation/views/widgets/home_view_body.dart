import 'package:daily_dash_app/features/home/presentation/views/widgets/completed_tasks_list_view.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/ongoing_lsit_view.dart';
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
