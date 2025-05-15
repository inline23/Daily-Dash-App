import 'package:daily_dash_app/core/utils/my_button.dart';
import 'package:daily_dash_app/core/utils/styles.dart';
import 'package:daily_dash_app/features/home/domain/entities/project_entity.dart';
import 'package:daily_dash_app/features/home/domain/entities/to_do.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/all_tasks_list_view.dart';
import 'package:daily_dash_app/features/home/presentation/views/widgets/project_detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProjectDetailsView extends StatefulWidget {
  final ProjectEntity project;
  const ProjectDetailsView({super.key, required this.project});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  final TextEditingController _taskTitleController = TextEditingController();
  late ProjectEntity _currentProject;

  @override
  void initState() {
    super.initState();
    _loadProjectData();
  }

  Future<void> _loadProjectData() async {
    final box = Hive.box<ProjectEntity>('projects');
    final savedProject = box.get(widget.project.id);
    if (savedProject != null) {
      setState(() {
        _currentProject = savedProject;
      });
    } else {
      setState(() {
        _currentProject = widget.project;
      });
    }
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
                      _currentProject.toDos.add(
                        ToDo(title: _taskTitleController.text, isDone: false),
                      );
                    });

                    // Save to Hive
                    final box = Hive.box<ProjectEntity>('projects');
                    await box.put(_currentProject.id, _currentProject);

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
            child: ProjectDetailsViewBody(project: _currentProject),
          ),
          SliverToBoxAdapter(
            child: AllTasksListView(
              tasks: _currentProject.toDos,
              onDelete: (task) async {
                setState(() {
                  _currentProject.toDos.remove(task);
                });

                // Save to Hive
                final box = Hive.box<ProjectEntity>('projects');
                await box.put(_currentProject.id, _currentProject);
              },
            ),
          ),
        ],
      ),
    );
  }
}
