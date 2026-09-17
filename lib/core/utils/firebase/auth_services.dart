import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_app/core/utils/firebase/cache_helper.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  CacheHelper cacheHelper = CacheHelper();

  Future<void> createAccount({
      required String email,
      required String password,
  })async{

    final credential = await auth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );


    // await cacheHelper.setUserId(
    //   userId: credential.user?.uid ?? '',
    // );

  }


  Future<void> login ({
    required String email,
    required String  password
  })async{
    final credential = await auth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
    await cacheHelper.setUserToken(userToken: credential.user?.uid ?? '');
  }

//   Future<void> signInWithGoogle() async {
//   final GoogleSignInAccount? googleUser =
//       await GoogleSignIn().signIn();

//   if (googleUser == null) {
//     return;
//   }

//   final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;

//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   final userCredential =
//       await auth.signInWithCredential(credential);

//   await chacheHelper.setUserId(
//     userId: userCredential.user?.uid ?? '',
//   );
// }
}