import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/forms/validators.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/shared/widgets/custom_textformfield.dart';
import 'package:todo_list_app/core/style/text_styles.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _mailController =
      TextEditingController();

  final TextEditingController _passController =
      TextEditingController();

  @override
  void dispose() {
    _mailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          context.pushReplacement(
            Routes.loginPageRoute,
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
                "Create account",
                style: TextStyles.BlackM26,
              ),

              Text(
                "Create your account and feel the benefits",
                style: TextStyles.textStyleGreyR14,
              ),

              SizedBox(
                height: 30,
              ),

              Form(
                key: _formState,
                child: Column(
                children: [
                  Padding(
                    padding: const .all(15),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyles.BlackB16,
                        ),

                        SizedBox(
                          height: 6,
                        ),

                        CustomTextFormField(
                          controller: _mailController,
                          validator: (value) =>
                              Validators.validateEmail(value),
                          fieldInnerText: "name@example.com",
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          "Password",
                          style: TextStyles.BlackB16,
                        ),

                        SizedBox(
                          height: 6,
                        ),

                        CustomTextFormField(
                          controller: _passController,
                          isPassword: true,
                          validator: (value) =>
                              Validators.validatePassword(value),
                          fieldInnerText: "Enter your password",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 360,
                  ),

                  CustomMainButton(
                    onPressed:(){
                      if (_formState.currentState!.validate()){
                        context.read<AuthCubit>().createAccount(
                          email:_mailController.text.trim(),
                          password:_passController.text,
                        );
                      }
                      
                    },
                    btnTitle: isLoading
                        ? "Creating..."
                        : "Sign Up",
                  ),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}