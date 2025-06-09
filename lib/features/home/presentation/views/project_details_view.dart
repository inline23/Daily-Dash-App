import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/models/project_model.dart';
import 'package:daily_dash_app/features/home/models/task_model.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/all_tasks_list_view.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/project_detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProjectDetailsView extends StatefulWidget {
  final ProjectModel project;
  const ProjectDetailsView({super.key, required this.project});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  final TextEditingController _taskTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: const Color(0xFF263238),
            title: Text(
              'Add New Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              controller: _taskTitleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter task title',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _taskTitleController.clear();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_taskTitleController.text.isNotEmpty) {
                    setState(() {
                      widget.project.addTask(_taskTitleController.text);
                    });
                    Navigator.pop(context);
                    _taskTitleController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: Text('Save', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFF263238),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButton(onTap: _showAddTaskDialog, text: "Add Task"),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProjectDetailsViewBody(project: widget.project),
          ),
          SliverToBoxAdapter(
            child: AllTasksListView(
              tasks: widget.project.allTasks,
              onDelete: (task) async {
                setState(() {
                  widget.project.allTasks.remove(task);
                });

                // Save to Hive
                final box = Hive.box<ProjectModel>('projects');
                await box.put(widget.project.projectId, widget.project);
              },
              onToggleCompletion: (task) async {
                final index = widget.project.allTasks.indexOf(task);
                if (index != -1) {
                  setState(() {
                    // Create a new ToDo object with toggled isDone status
                    final updatedTask = TaskModel(
                      taskTitle: task.taskTitle,
                      isDone: !task.isDone,
                    );
                    widget.project.allTasks[index] = updatedTask;
                  });

                  // Save to Hive
                  final box = Hive.box<ProjectModel>('projects');
                  await box.put(widget.project.projectId, widget.project);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
