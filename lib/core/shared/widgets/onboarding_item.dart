import 'package:todo_list_app/core/style/assets_manager.dart';

class OnboardingItem {
  String img;
  String txt1;
  String txt2;

  OnboardingItem({
    required this.img,
    required this.txt1,
    required this.txt2,
  });

}

final List<OnboardingItem> onboardingPages =[
    OnboardingItem(
      img: AssetsManager.onboardingImage1, 
      txt1: "Your convenience in \nmaking a todo list", 
      txt2: "Here's a mobile platform that helps you create task\nor to list so that it can help you in every job\neasier and faster. "),
    OnboardingItem(
      img: AssetsManager.onboardingImage2, 
      txt1: "Find the practicality in \nmaking your todo list", 
      txt2: "Easy-to-understand user interface  that makes you\nmore comfortable when you want to create a task or\nto do list, Todyapp can also improve productivity "),
  ];

