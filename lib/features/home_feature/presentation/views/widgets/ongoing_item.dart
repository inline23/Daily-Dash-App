
import 'package:flutter/material.dart';

class OnGoingItem extends StatelessWidget {
  const OnGoingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF546E7A), // bluish-grey
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Task info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mobile App Wireframe',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Team members',
                  style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Due on : 21 March',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          // Right side: Progress indicator
          SizedBox(
            width: 70,
            height: 70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 5,
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFED36A)),
                ),
                Text(
                  '75%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
