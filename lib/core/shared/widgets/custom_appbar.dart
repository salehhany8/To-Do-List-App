import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/utils/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Constants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      elevation: 20,
      automaticallyImplyLeading: false,
      title :Column(
        //mainAxisSize: .max,
      
        crossAxisAlignment: .start,
          //crossAxisAlignment: .center,
          children: [
            Text(
              'Tody App',
              style: TextStyle(
                //fontSize: 26,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorManager.brandPrimaryColor,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Best platform for creating to-do lists',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8A8A8E),
              ),
            ),
          ],
        ), 
      actions: [
        IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.settings_outlined,
          color: Color(0xFF6B7280),
          size: 26,
        ),
      ),
      ],
    );
  }
}