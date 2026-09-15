import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_list_app/core/navigation/routes.dart';
import 'package:todo_list_app/core/shared/widgets/custom_main_button.dart';
import 'package:todo_list_app/core/shared/widgets/custom_text_button.dart';
import 'package:todo_list_app/core/shared/widgets/onboarding_item.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/text_styles.dart';
import 'package:todo_list_app/core/utils/units.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int curIndex =0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  Widget buildPage(OnboardingItem item){
    return Center(
      child: Stack(     
              alignment: .centerStart,
              children: [
                SizedBox(
                  width: 470,
                  height: 470,
                  // width: Units.getWidth(context: context, WidgetWidth: 375),
                  // height: Units.getHeight(context: context, WidgetHeight: 392),
                  child: Image.asset(item.img)
                ),
                Positioned(
                  //top:Units.getHeight(context: context, WidgetHeight: 184),
                  top:200,
                  child: 
                  Container(
                    //padding: .only(top: Units.getHeight(context: context, WidgetHeight: 185)),
                    // width: Units.getWidth(context: context, WidgetWidth: 375),
                    // height: Units.getHeight(context: context, WidgetHeight: 208),
                    height: 230,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: .bottomCenter,
                        end: .topCenter,
                        colors: [
                        ColorManager.white,
                        ColorManager.white,
                        ColorManager.white.withAlpha(0),
                      ]
                      )
                    ),
                 ),
                ),
                Positioned(
                  // top:Units.getHeight(context: context, WidgetHeight: 315),
                  // left:Units.getWidth(context: context, WidgetWidth: 70),
                  top:300,
                  left: 80,
                  child: 
                  Text(
                    item.txt1,
                    style: 
                      TextStyles.BlackB26,
                      textAlign: .center,
                  ),
                ),
                Positioned(
                  // top: Units.getHeight(context: context, WidgetHeight: 393),
                  // left:Units.getWidth(context: context, WidgetWidth: 41),
                  top: 380,
                  left: 50,
                  child: 
                  Text(
                    item.txt2,
                    style:
                      TextStyles.textStyleGreyR14,
                      textAlign : .center
                  ),
                ),
              ],
              
            ),
    );
  }

  void continueButton(){
    if (curIndex < onboardingPages.length -1){
      _controller.nextPage(
        duration: Duration(milliseconds: 400), 
        curve: Curves.easeInOut);
    }
    else {
      context.pushReplacement(Routes.welcomePageRoute);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              padding: .only(top: Units.getHeight(context: context, WidgetHeight: 68)),
              alignment: .topEnd,
              child: CustomTextButton(
                onPressed: (){
                  context.pushReplacement(Routes.welcomePageRoute);
                }, 
                btnTitle: 'skip',
            )
            ),
            
            
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (index){
                  setState(() {
                    curIndex=index;
                  });
                },
                itemBuilder: (context, index) {
                  return buildPage(onboardingPages[index]);
                },
              ),
            ),
            SizedBox(
              //height: Units.getHeight(context: context, WidgetHeight: 32),
              height: 0,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller, 
                count: onboardingPages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: ColorManager.brandPrimaryColor,
                  dotColor: ColorManager.dotsColor,
                  radius: 4.0,
        
                ),
              ),
            ),
            
            SizedBox(
              // height: Units.getHeight(context: context, WidgetHeight: 86),
              height: 100,
            ),
            Container(
              child: CustomMainButton(
                onPressed: ()=> continueButton(), 
                btnTitle: "Continue"
              ),
            ),
            
            SizedBox(
              height: Units.getHeight(context: context, WidgetHeight: 50),
            )
          ],
        ),
      )
    );
  }

  
}