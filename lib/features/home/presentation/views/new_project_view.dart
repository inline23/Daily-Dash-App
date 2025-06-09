import 'package:daily_dash_app/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:daily_dash_app/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/features/home/models/project_model.dart';
import 'package:daily_dash_app/features/home/presentation/views/home_view.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewProjectView extends StatelessWidget {
  const NewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: NewProjectBody()));
  }
}

class NewProjectBody extends StatefulWidget {
  const NewProjectBody({super.key});

  @override
  State<NewProjectBody> createState() => _NewProjectBodyState();
}

class _NewProjectBodyState extends State<NewProjectBody> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFFED36A),
              onPrimary: Colors.black,
              surface: Color(0xFF263238),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Color(0xFF212832),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay(hour: 10, minute: 0),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFFED36A),
              onPrimary: Colors.black,
              surface: Color(0xFF263238),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Color(0xFF212832),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String get formattedDate {
    if (selectedDate == null) return 'Select Date';
    return '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}';
  }

  String get formattedTime {
    if (selectedTime == null) return 'Select Time';
    final hour =
        selectedTime!.hourOfPeriod == 0 ? 12 : selectedTime!.hourOfPeriod;
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    final period = selectedTime!.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: 'Create New Project'),
            const SizedBox(height: 39),
            Text(
              'Task Title',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: taskTitleController,
              onChanged:
                  (value) => WriteDataCubit.get(context).updateTitle(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
              ),
            ),
            const SizedBox(height: 44),
            Text(
              'Task Details',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              maxLines: 3,
              onChanged:
                  (value) =>
                      WriteDataCubit.get(context).updateDescription(value),
              controller: taskDetailsController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                fillColor: Color(0xFF455A64),
                filled: true,
              ),
            ),
            const SizedBox(height: 38),
            Text(
              'Time & Date',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _pickTime(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFED36A),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, color: Color(0xFF455A64)),
                          const SizedBox(width: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF455A64),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _pickDate(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFED36A),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            color: Color(0xFF455A64),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF455A64),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            MyButton(
              onTap: () {
                if (taskTitleController.text.isNotEmpty &&
                    taskDetailsController.text.isNotEmpty) {
                  WriteDataCubit.get(context).addProject();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                }
              },
              text: "Create",
            ),
          ],
        ),
      ),
    );
  }
}
