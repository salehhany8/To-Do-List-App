import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/core/utils/constants.dart';

class CacheHelper {
  static late SharedPreferences sharedPre;

  static Future<void> init()async{
    sharedPre = await SharedPreferences.getInstance();
  }


  Future<void> setUserToken({required String userToken}) async {
    await sharedPre.setString(
      Constants.kUserToken,
      userToken,
    );
  }

  bool isLoggedin(){
    String currentUserToken = sharedPre.getString(Constants.kUserToken) ?? '';
    return currentUserToken.isNotEmpty;
  }
}