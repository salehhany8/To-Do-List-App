// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:todo_list_app/core/forms/validators.dart';
// import 'package:todo_list_app/core/navigation/routes.dart';
// import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
// import 'package:todo_list_app/core/shared/widgets/custom_text_button.dart';
// import 'package:todo_list_app/core/shared/widgets/custom_textformfield.dart';
// import 'package:todo_list_app/core/style/color_manager.dart';
// import 'package:todo_list_app/core/style/text_styles.dart';
// import 'package:todo_list_app/features/home/presentation/manager/auth_cubit.dart';

// class loginPage extends StatefulWidget {
//   const loginPage({super.key});

//   @override
//   State<loginPage> createState() => _loginPageState();
// }

// class _loginPageState extends State<loginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 80,),
//           Text("Welcome Back!",style: TextStyles.BlackM26,),
//           Text("Your work faster and structured with Todyapp",style: TextStyles.textStyleGreyR14,),
//           SizedBox(height: 30,),
//           Padding(
//             padding: const .all(15),
//             child: Column(
//               crossAxisAlignment: .start,
//               children: [
//                 Text("Email Address",style: TextStyles.BlackB16,),
//                 SizedBox(height: 6,),
//                 CustomTextFormField(
//                   controller: _emailController, 
//                   validator: (value)=>Validators.validateEmail(value), 
//                   fieldInnerText: "name@example.com"
//                 ),
//                 SizedBox(height: 6,),
//                 Text("Password",style: TextStyles.BlackB16,),
//                 SizedBox(height: 6,),
//                 CustomTextFormField(
//                   isPassword: true,
//                   controller: _passController, 
//                   validator: (value)=>Validators.validatePassword(value), 
//                   fieldInnerText: "Enter your password"
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 330,),
//           Row(
//             mainAxisAlignment: .center,
//             children: [
//               Text(
//                 "Don't you have an account?",
//                 style: TextStyles.BlackB16,
//               ),
//               CustomTextButton(
//                 onPressed: (){
//                   context.go(Routes.createAccountRoute);
//                 }, 
//                 btnTitle: "Sign Up!",
//                 btnColor : ColorManager.brandPrimaryColor
//               )
//             ],
//           ),
          
//           CustomMainButton(
//             onPressed: (){
//             isLoading ? null
//               : () {
//                   context.read<AuthCubit>().login(
//                     email: _emailController.text.trim(),
//                     password: _passController.text,
//                   );
//                 },},
//             //(){

//               //context.pushReplacement(Routes.homePageRoute);
//             //}, 
//             btnTitle: "Log in"
//           ),
          
//           SizedBox(height: 50,),
          
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/forms/validators.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/shared/widgets/custom_text_button.dart';
import 'package:todo_list_app/core/shared/widgets/custom_textformfield.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/text_styles.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_state.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          context.pushReplacement(
            Routes.homePageRoute,
          );
        }

        if (state is FailedAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },

      builder: (context, state) {
        final bool isLoading =
            state is LoadingAuthState;

        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 80,
              ),

              Text(
                "Welcome Back!",
                style: TextStyles.BlackM26,
              ),

              Text(
                "Your work faster and structured with Todyapp",
                style: TextStyles.textStyleGreyR14,
              ),

              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const .all(15),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyles.BlackB16,
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    CustomTextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          Validators.validateEmail(value),
                      fieldInnerText: "name@example.com",
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    Text(
                      "Password",
                      style: TextStyles.BlackB16,
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    CustomTextFormField(
                      isPassword: true,
                      controller: _passController,
                      validator: (value) =>
                          Validators.validatePassword(value),
                      fieldInnerText: "Enter your password",
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 330,
              ),

              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Don't you have an account?",
                    style: TextStyles.BlackB16,
                  ),

                  CustomTextButton(
                    onPressed: () {
                      context.go(
                        Routes.createAccountRoute,
                      );
                    },
                    btnTitle: "Sign Up!",
                    btnColor:
                        ColorManager.brandPrimaryColor,
                  ),
                ],
              ),

              CustomMainButton(
                onPressed:(){
                        context.read<AuthCubit>().login(
                              email:_emailController.text.trim(),
                              password:_passController.text,
                            );
                      },
                btnTitle: isLoading
                    ? "Logging in..."
                    : "Next",
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}