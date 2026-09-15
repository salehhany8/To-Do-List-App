import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/data/models/task_data_model.dart';
import 'package:todo_list_app/core/forms/validators.dart';
import 'package:todo_list_app/core/shared/functions/show_error_dialog.dart';
import 'package:todo_list_app/core/shared/functions/show_success_dialog.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/shared/widgets/custom_textformfield.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/utils/firebase/firebase_services.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_state.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _tskNameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? selectedDate;

  final FirebaseServices _firebaseServices =FirebaseServices();

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2060),
    );

    if (pickedDate != null) {
      setState(() {
      selectedDate = pickedDate;
    });
    }
  }

  Future<void> _saveTask()async{
    final TaskDataModel task = TaskDataModel(
      name: _tskNameController.text, 
      description: _descController.text, 
      date: selectedDate ?? DateTime.now(),
      isDone: false
    );

    //await _firebaseServices.createTask(task);
    context.read<HomeCubit>().createTask(
      task: task,
    );
    //Navigator.pop(context);
  }

  @override
  void dispose() {
    _tskNameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listenWhen: (previous, current) {
        return current is SuccessCreationState ||
        current is FailedToCteateState;
      },
      listener: (context,state) async{
        if (state is SuccessCreationState) {
          await showSuccessDialog(context);

          //if (!context.mounted) return;

          Navigator.pop(context);
        }
        if (state is FailedToCteateState) {
          await showErrorDialog(
            context,
            errorMessage: state.errorMessage,
          );
        }
      },
      buildWhen: (previous, current){
         return current is InitialTaskCreationState ||
            current is LoadingCreationState;
      },
      builder: (context,state){
        final bool isLoading =
            state is LoadingCreationState;
        return Form(child: 
          Column(
            children: [
              CustomTextFormField(
                controller: _tskNameController, 
                validator: (value)=> Validators.validateTskName(value),
                fieldInnerText: "eg : Meeting with client"
              ),
              CustomTextFormField(
                controller: _descController, 
                validator: (value)=> null,
                fieldInnerText: "Description"
              ),
              CustomMainButton(
                width: 150,
                height: 50,
                btnColor: ColorManager.successLineColor,
                onPressed: () => _selectDate(),
                //()=> _selectDate(), 
                btnTitle: selectedDate == null ?
                "choose date 🗓️"
                : '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
              ),
              SizedBox(height: 4,),
              CustomMainButton(
                onPressed: (){isLoading ? null 
                : _saveTask();},
                btnTitle: isLoading ? "Loading..." :
                "save",
                //width: 100,
                //height: 30,
              )
            ],
          )
        );
        });
  }
}