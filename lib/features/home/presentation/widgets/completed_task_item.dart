import 'package:flutter/material.dart';

class CompletedTaskItem extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  const CompletedTaskItem({
    super.key,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      color: bgColor,
      width: 175,
      height: 175,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Real Estate Website Design',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed',
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                  Text(
                    '100%',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: 1.0, // 100%
                  minHeight: 12,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor,
                  ), // dark color
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
