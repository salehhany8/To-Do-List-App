//using Units :

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:todo_list_app/core/navigation/routes.dart';
// import 'package:todo_list_app/core/shared/custom_main_button.dart';
// import 'package:todo_list_app/core/style/assets_manager.dart';
// import 'package:todo_list_app/core/style/color_manager.dart';
// import 'package:todo_list_app/core/style/text_styles.dart';
// import 'package:todo_list_app/core/utils/units.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(height: Units.getHeight(context: context, WidgetHeight: 76),),
//               Row(
//                 mainAxisAlignment: .center,
//                 children: [
//                   Text("Welcome to ",style: TextStyles.BlackM28,textAlign: .center,),
//                   Text("Todyapp",style: TextStyles.todyStyle,textAlign: .center)
//                 ],
//               ),
//               SizedBox(height: Units.getHeight(context: context, WidgetHeight: 58),),
//               Container(
//                 width: Units.getWidth(context: context, WidgetWidth: 325),
//                 height: Units.getHeight(context: context, WidgetHeight: 379),
//                 child: Image.asset(AssetsManager.welcomeImage),
//               ),
//               SizedBox(height: Units.getHeight(context: context, WidgetHeight: 59), ),
//               CustomMainButton(
//                 width: 340,
//                 height: 60,   
//                 svgIconPath: AssetsManager.mailSvg,
//                 onPressed: (){
//                   context.pushReplacement(Routes.emailLoginPageRoute);
//                 }, 
//                 btnTitle: "Continue with email"),
//               //Row(
// //                 children: [
// //                     Expanded(child: Divider(color: Color(0xFFE5E7EB), thickness: 1.5)),
// //                       Text(
// //                         "or continue with",
// //                         style: TextStyles.textStyleGreyR14,
// //                       ),
// //                     Expanded(child: Divider(color: Color(0xFFE5E7EB), thickness: 1.5)),
// //                 ],
// //               ),
//               Text(
//                 "_________________ or continue with _______________",
//                 style:
//                   TextStyles.textStyleGreyR14,
//                   textAlign : .center
//               ),
//               Row(
//                 mainAxisAlignment: .center,
//                 children: [
//                   CustomMainButton(
//                     width: Units.getWidth(context: context, WidgetWidth: 155),
//                     height: Units.getHeight(context: context, WidgetHeight: 56),
//                     onPressed: (){}, 
//                     btnTitle: "Facebook",
//                     fontSize: 17,
//                     btnColor: ColorManager.neutralBackgroundColor,
//                     textColor: ColorManager.black,
//                     ),
//                     CustomMainButton(
//                       width: Units.getWidth(context: context, WidgetWidth: 155),
//                     height: Units.getHeight(context: context, WidgetHeight: 56),
//                       onPressed: (){}, 
//                       btnTitle: "Google",
//                       fontSize: 17,
//                       btnColor: ColorManager.neutralBackgroundColor,
//                       textColor: ColorManager.black,
//                     )
//                 ],
//               )
              
//             ],
//           ),
          
//         )
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/style/assets_manager.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/text_styles.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_cubit.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 90,),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text("Welcome to ",style: TextStyles.BlackM28,textAlign: .center,),
                  Text("Todyapp",style: TextStyles.todyStyle,textAlign: .center)
                ],
              ),
              SizedBox(height: 50,),
              Container(
                width: 400,
                height: 370,
                child: Image.asset(AssetsManager.welcomeImage),
              ),
              SizedBox(height: 40,),
              CustomMainButton(
                svgIconPath: AssetsManager.mailSvg,
                width: 340,
                height: 60,   
                onPressed: (){
                  context.pushReplacement(Routes.loginPageRoute);
                }, 
                btnTitle: "Log in"),
                SizedBox(height: 3,),
                Row(
                children: [
                    Expanded(child: const Divider(color: Color(0xFFE5E7EB), thickness: 1.5)),
                      Text(
                        "or continue with",
                        style: TextStyles.textStyleGreyR14,
                      ),
                    Expanded(child: const Divider(color: Color(0xFFE5E7EB), thickness: 1.5)),
                ],
              ),
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: .center,
                children: [
                  CustomMainButton(
                    width: 170,
                    height: 50,
                    onPressed: (){}, 
                    btnTitle: "Facebook",
                    fontSize: 17,
                    btnColor: ColorManager.neutralBackgroundColor,
                    textColor: ColorManager.black,
                    svgIconPath: AssetsManager.facebookSvg
                    ),
                    CustomMainButton(
                      width: 160,
                      height: 50,
                      onPressed: () {}, 
                      btnTitle: "Google",
                      fontSize: 17,
                      btnColor: ColorManager.neutralBackgroundColor,
                      textColor: ColorManager.black,
                      svgIconPath: AssetsManager.googleSvg,
                    )
                ],
              )
              
            ],
          ),
          
        )
      ),
    );
  }
}

