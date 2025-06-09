import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/presentation/views/calendar_view.dart';
import 'package:daily_dash_app/features/home/presentation/views/chat_view.dart';
import 'package:daily_dash_app/features/home/presentation/views/new_project_view.dart';
import 'package:daily_dash_app/features/home/presentation/views/notification_view.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});
  //, required this.user
  @override
  State<HomeView> createState() => _HomeViewState();
  // final User user;
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [HomeViewBody(), ChatView(), CalendarView(), NotificationView()];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF263238),
        elevation: 0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.chat, 'Chat', 1),
              // Center button placeholder
              SizedBox(width: 56),
              _buildNavItem(Icons.calendar_month, 'Calendar', 2),
              _buildNavItem(Icons.notification_add, 'Alerts', 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: Icon(Icons.add, color: Colors.black, size: 32),
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => NewProjectView()));
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? primaryColor : const Color(0xFF455A64),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? primaryColor : const Color(0xFF455A64),
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
