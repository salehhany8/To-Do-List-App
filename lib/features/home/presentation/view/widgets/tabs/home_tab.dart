// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_list_app/core/style/color_manager.dart';
// import 'package:todo_list_app/core/utils/firebase/firebase_services.dart';
// import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';

// class HomeTab extends StatefulWidget {
//   const new({super.key});

//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> {

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => HomeCubit(FirebaseServices()),
//       child: const HomeView(),
//     );
    
//   }
// }

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       body: SafeArea(
//         child: Padding(
//           padding: .symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: .start,
//             children: [
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: .spaceBetween,
//                 crossAxisAlignment: .start,
//                 children: [
//                   const Column(
//                     crossAxisAlignment: .start,
//                     children: [
//                       Text(
//                         'Today',
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1E1E1E),
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Text(
//                         'Best platform for creating to-do lists',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF8A8A8E),
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.settings_outlined,
//                       color: Color(0xFF6B7280),
//                       size: 26,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 28),
//               // Card of task
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   //clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.04),
//                         blurRadius: 14,
//                         offset: Offset(0, 6),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 48,
//                         color: ColorManager.brandPrimaryColor,
//                       ),
//                       Padding(
//                         padding: .all(16),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   width: 36,
//                                   height: 36,
//                                   decoration: BoxDecoration(
//                                     color: ColorManager.brandPrimaryColor,
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: const Icon(
//                                     Icons.add,
//                                     color: Colors.white,
//                                     size: 22,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 14),
//                                 const Text(
//                                   'Tap plus to create a new task',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFF1E1E1E),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 16),
//                             const Divider(
//                               color: Color(0xFFEEEEEE),
//                               thickness: 1,
//                               height: 1,
//                             ),
//                             const SizedBox(height: 12),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Add your task',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Color(0xFF9E9E9E),
//                                   ),
//                                 ),
//                                 Text(
//                                   'Today . Mon 20 Jul 2022',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Color(0xFF9E9E9E),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




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
              //const SizedBox(height: 28),
              // Card of task
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     //clipBehavior: Clip.antiAlias,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(16),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.04),
              //           blurRadius: 14,
              //           offset: Offset(0, 6),
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       children: [
              //         Container(
              //           height: 48,
              //           color: ColorManager.brandPrimaryColor,
              //         ),
              //         Padding(
              //           padding: .all(16),
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   Container(
              //                     width: 36,
              //                     height: 36,
              //                     decoration: BoxDecoration(
              //                       color: ColorManager.brandPrimaryColor,
              //                       borderRadius: BorderRadius.circular(8),
              //                     ),
              //                     child: const Icon(
              //                       Icons.add,
              //                       color: Colors.white,
              //                       size: 22,
              //                     ),
              //                   ),
              //                   const SizedBox(width: 14),
              //                   const Text(
              //                     'Tap plus to create a new task',
              //                     style: TextStyle(
              //                       fontSize: 15,
              //                       fontWeight: FontWeight.w600,
              //                       color: Color(0xFF1E1E1E),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(height: 16),
              //               const Divider(
              //                 color: Color(0xFFEEEEEE),
              //                 thickness: 1,
              //                 height: 1,
              //               ),
              //               const SizedBox(height: 12),
              //               const Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Add your task',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       color: Color(0xFF9E9E9E),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Today . Mon 20 Jul 2022',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       color: Color(0xFF9E9E9E),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
  
