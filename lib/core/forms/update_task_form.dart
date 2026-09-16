import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/shared/functions/show_error_dialog.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_state.dart';

class UpdateTaskForm extends StatefulWidget {
  final TaskDataModel task;

  const UpdateTaskForm({
    super.key,
    required this.task,
  });

  @override
  State<UpdateTaskForm> createState() => _UpdateTaskFormState();
}

class _UpdateTaskFormState extends State<UpdateTaskForm> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.task.name,
    );

    descriptionController = TextEditingController(
      text: widget.task.description,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state is SuccessTaskUpdateState) {
          Navigator.pop(context);
        }

        if (state is SuccessTaskDeleteState) {
          Navigator.pop(context);
        }

        if (state is FailedToUpdateState) {
          await showErrorDialog(
            context,
            errorMessage: state.errorMessage,
          );
        }

         if (state is FailedToDeleteState) {
          await showErrorDialog(
            context,
            errorMessage: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        final bool isLoading =
            state is LoadingTaskUpdateState ||
            state is LoadingTaskDeleteState;

        return Dialog(
          backgroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        

          child: SizedBox(
            width: 350,
            height: 290,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Task name :',
                    ),
                  ),
              
                  const SizedBox(height: 16),
              
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Task description : ',
                    ),
                  ),
              
                  const SizedBox(height: 16),
              
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
              
                      const SizedBox(width: 8),
              
                      Text(
                        '${widget.task.date.day}/'
                        '${widget.task.date.month}/'
                        '${widget.task.date.year}',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                    TextButton(
                      
                  onPressed: () {
                          Navigator.pop(context);
                        },
                  child: const Text('Cancel',style: TextStyle(color: Color.fromARGB(255, 50, 52, 56)),),
                ),
              
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                        final cubit = context.read<HomeCubit>();
              
                        cubit.deleteTask(
                          taskId: widget.task.id ?? '',
                        );
                      },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: ColorManager.errorDefaultColor,
                    ),
                  ),
                ),
              
                CustomMainButton(
                  btnTitle: "Update",
                  fontSize: 16,
                  width: 70,
                  height: 40,
                  onPressed: () {
                          final cubit = context.read<HomeCubit>();
              
                          final updatedTask =
                              TaskDataModel(
                            id: widget.task.id,
                            name:nameController.text.trim(),
                            description:descriptionController.text.trim(),
                            date: widget.task.date,
                            isDone: widget.task.isDone,
                          );
              
                          cubit.updateTask(
                            taskId: widget.task.id ?? '',
                            newTask: updatedTask,
                          );
                        },
                ),
                  ],),
                  
                ],
              
              ),
            ),
          ),
        );
      },
    );
  }
}