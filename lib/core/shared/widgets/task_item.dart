import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/shared/functions/show_edit_task_dialog.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';


class TaskItem extends StatefulWidget {
  final TaskDataModel task;

  const TaskItem({super.key,required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return GestureDetector(
      onLongPress: () {
        showEditTaskDialog(
          context: context,
          task: widget.task,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ]
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              color: ColorManager.brandPrimaryColor,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: widget.task.isDone,
                        activeColor: ColorManager.brandPrimaryColor,
                        onChanged: (value) {
                          if (value == null )return;
                          setState((){
                            widget.task.isDone =value;
                          });
                          cubit.updateTask(
                              taskId: widget.task.id ??'',
                              newTask : TaskDataModel(
                                name: widget.task.name, 
                                description: widget.task.description, 
                                date: widget.task.date,
                                isDone: value
                              )
                          );  
                        },
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Text(
                          widget.task.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                      ),
                      Text(
                        '${widget.task.date.day}/${widget.task.date.month}/${widget.task.date.year}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFEEEEEE),
                    thickness: 1,
                    height: 1,
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.task.description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ),

                      
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}