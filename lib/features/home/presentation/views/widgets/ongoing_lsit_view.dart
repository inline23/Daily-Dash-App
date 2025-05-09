
import 'package:daily_dash_app/features/home/presentation/views/widgets/ongoing_item.dart';
import 'package:flutter/material.dart';

class OngoingListView extends StatelessWidget {
  const OngoingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const OnGoingItem();
      },
    );
  }
}