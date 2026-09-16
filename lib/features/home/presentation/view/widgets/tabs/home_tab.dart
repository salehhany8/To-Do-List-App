import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/shared/widgets/custom_appbar.dart';
import 'package:todo_list_app/core/shared/widgets/task_item.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_state.dart';

class HomeTab extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final Stream<List<TaskDataModel>> tasksStream;

  @override
  void initState() {
    super.initState();

  tasksStream = context.read<HomeCubit>().getTasks();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 8,),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return StreamBuilder<List<TaskDataModel>>(
                      stream: tasksStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              'Failed to get tasks',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF8A8A8E),
                              ),
                            ),
                          );
                        }
                        final tasks = snapshot.data ?? [];

                        if (tasks.isEmpty) {
                          return const Center(
                            child: Text(
                              'No tasks yet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF8A8A8E),
                              ),
                            ),
                          );
                        }
                        return ListView.separated(
                          itemCount: tasks.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return TaskItem(
                              task: tasks[index],
                            );
                          },
                        );
                                },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
  
