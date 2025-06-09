import 'package:daily_dash_app/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:daily_dash_app/controllers/read_data_cubit/read_data_cubit_states.dart';
import 'package:daily_dash_app/features/home/presentation/widgets/ongoing_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OngoingListView extends StatefulWidget {
  const OngoingListView({super.key});

  @override
  State<OngoingListView> createState() => _OngoingListViewState();
}

class _OngoingListViewState extends State<OngoingListView> {
  late ReadDataCubit readDataCubit;

  @override
  void initState() {
    super.initState();
    readDataCubit = ReadDataCubit();
    readDataCubit.getMethod(); // ✅ هنا بتشغل الدالة
  }

  @override
  void dispose() {
    readDataCubit.close(); // ✅ مهم
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<ReadDataCubit>.value(
      value: readDataCubit,
      child: BlocBuilder<ReadDataCubit, ReadDataCubitStates>(
        builder: (context, state) {
          if (state is ReadDataCubitLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ReadDataCubitSuccessState) {
            final projects = state.models;

            if (projects.isEmpty) {
              return const Center(
                child: Text(
                  'No Projects Yet',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: projects.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final project = projects[index];
                return OnGoingItem(project: project);
              },
            );
          }

          if (state is ReadDataCubitFailureState) {
            return Center(child: Text(state.message));
          }

          return const Center(
            child: Text('NON', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}

