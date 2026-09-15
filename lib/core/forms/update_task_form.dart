// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_list_app/core/data/models/task_data_model.dart';
// import 'package:todo_list_app/core/shared/functions/show_error_dialog.dart';
// import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';
// import 'package:todo_list_app/features/home/presentation/manager/home_state.dart';

// class UpdateTaskForm extends StatefulWidget {
//   final TaskDataModel task;
//   const UpdateTaskForm({super.key, required this.task});

//   @override
//   State<UpdateTaskForm> createState() => _UpdateTaskFormState();
// }

// class _UpdateTaskFormState extends State<UpdateTaskForm> {
//   late final TextEditingController nameController;
//   late final TextEditingController descriptionController;
  
//   @override
//   void initState() {
//     super.initState();

//     nameController = TextEditingController(
//       text: widget.task.name,
//     );

//     descriptionController = TextEditingController(
//       text: widget.task.description,
//     );
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) async {
//         if (state is SuccessTaskUpdateState) {
//           Navigator.pop(context);
//         }

//         if (state is FailedToUpdateState) {
//           await showErrorDialog(
//             context,
//             errorMessage: state.errorMessage,
//           );
//         }
//       },
//       builder: (context, state) {
//         final bool isLoading =
//             state is LoadingTaskUpdateState;

//         return AlertDialog(
//           title: const Text('Update Task'),

//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Task name',
//                 ),
//               ),

//               const SizedBox(height: 16),

//               TextFormField(
//                 controller: descriptionController,
//                 maxLines: 3,
//                 decoration: const InputDecoration(
//                   labelText: 'Task description',
//                 ),
//               ),
//             ],
//           ),

//           actions: [
//             TextButton(
//               onPressed: isLoading
//                   ? null
//                   : () {
//                       Navigator.pop(context);
//                     },
//               child: const Text('Cancel'),
//             ),

//             ElevatedButton(
//               onPressed: isLoading
//                   ? null
//                   : () {
//                       final cubit = context.read<HomeCubit>();

//                       final updatedTask = TaskDataModel(
//                         id: widget.task.id,
//                         name: nameController.text.trim(),
//                         description: descriptionController.text.trim(),
//                         date: widget.task.date,
//                         isDone: widget.task.isDone,
//                       );

//                       cubit.updateTask(
//                         taskId: widget.task.id ?? '',
//                         newTask: updatedTask,
//                       );
//                     },
//               child: isLoading
//                   ? const SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                       ),
//                     )
//                   : const Text('Update'),
//             ),
//           ],
//         );
//       },
//     );
  
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/shared/functions/show_error_dialog.dart';
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

        return AlertDialog(
          title: const Text('Update Task'),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Task name',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Task description',
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  const Icon(Icons.calendar_today),

                  const SizedBox(width: 8),

                  Text(
                    '${widget.task.date.day}/'
                    '${widget.task.date.month}/'
                    '${widget.task.date.year}',
                  ),
                ],
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              child: const Text('Cancel'),
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

            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      final cubit =
                          context.read<HomeCubit>();

                      final updatedTask =
                          TaskDataModel(
                        id: widget.task.id,
                        name:
                            nameController.text.trim(),
                        description:
                            descriptionController.text
                                .trim(),
                        date: widget.task.date,
                        isDone: widget.task.isDone,
                      );

                      cubit.updateTask(
                        taskId: widget.task.id ?? '',
                        newTask: updatedTask,
                      );
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child:
                          CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}