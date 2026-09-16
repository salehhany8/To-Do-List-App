import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:todo_list_app/core/forms/task_form.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/features/home/presentation/view/widgets/tabs/calendar_tab.dart';
import 'package:todo_list_app/features/home/presentation/view/widgets/tabs/home_tab.dart';

class TabsManager extends StatefulWidget {
  const TabsManager({super.key});

  @override
  State<TabsManager> createState() => _TabsManagerState();
}

class _TabsManagerState extends State<TabsManager> {
  late final PageController _pageController;

  int _curIndex=0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _curIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged (int index){
    setState(() {
      _curIndex =index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _buildBody,
        onPageChanged: _onPageChanged,
      ),


      bottomNavigationBar: PersistentTabView(
        context, 
        screens: _buildBody,
        items: _navBarItems(),
        navBarStyle: NavBarStyle.style7,
        hideNavigationBarWhenKeyboardAppears: true,

        selectedTabScreenContext: (context){},

        backgroundColor: ColorManager.white,
        decoration: NavBarDecoration(
          colorBehindNavBar: ColorManager.white,
          borderRadius: .circular(15),
        ),
        floatingActionButton: FloatingActionButton(
          
        elevation: 0,
        shape:CircleBorder(),
        backgroundColor: ColorManager.brandPrimaryColor,
        child: Icon(Icons.add,color: ColorManager.white,),

        onPressed:()=> showModalBottomSheet(
          backgroundColor: ColorManager.white,
          context: context,
          isDismissible: true,
          builder: (context) =>SizedBox(
            height: MediaQuery.of(context).size.height *0.7,
            child: Column(
              children: [
                Container(alignment: .topEnd,child: CloseButton(),),
                TaskForm()
              ],
            ),
          )
        ),),
        ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarItems(){
  return[
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      inactiveIcon: const Icon(Icons.home_outlined),
      title: '',
      activeColorPrimary: ColorManager.brandPrimaryColor,
      activeColorSecondary: ColorManager.white,
      inactiveColorPrimary: ColorManager.neutralGhostColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_month),
      inactiveIcon: const Icon(Icons.calendar_month_outlined),
      title: 'Calendar',
      activeColorPrimary: ColorManager.brandPrimaryColor,
      activeColorSecondary: ColorManager.white,
      inactiveColorPrimary: ColorManager.neutralGhostColor,
    ),
  ];
}

List<Widget> _buildBody = [
  HomeTab(),
  CalendarTab()

];