import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/core/utils/constants.dart';

class CacheHelper {
  static late SharedPreferences sharedPre;

  static Future<void> init()async{
    sharedPre = await SharedPreferences.getInstance();
  }


  Future<void> setUserId({required String userId}) async {
    await sharedPre.setString(
      Constants.kUserId,
      userId,
    );
  }

  String getUserID(){
    return sharedPre.getString(Constants.kUserId) ?? '';
  }
}