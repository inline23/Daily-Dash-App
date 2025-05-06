import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/calendar_view.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/chat_view.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/notification_view.dart';
import 'package:daily_dash_app/features/home_feature/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List screens = [
    HomeViewBody(),
    ChatView(),
    CalendarView(),
    NotificationView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: currentIndex,
        unselectedItemColor: Color(0xFF455A64),
        backgroundColor: Color(0xFF263238),
        selectedItemColor: primaryColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
