import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
 // change this page Use CustomScrollView
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => CompletedTaskItem(),
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ongoing Tasks',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CompletedTaskItem extends StatelessWidget {
  const CompletedTaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: 175,
      height: 175,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Real Estate Website Design',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
