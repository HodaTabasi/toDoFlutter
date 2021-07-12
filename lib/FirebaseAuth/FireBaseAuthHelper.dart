import 'package:firebase_auth/firebase_auth.dart';

class FBHelper {
  FBHelper._();

  static FBHelper fp = FBHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//Either
//map return

  Future<User> regster(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
    //   if (e.code == 'weak-password') {
    //     return 'The password provided is too weak.';
    //   } else if (e.code == 'email-already-in-use') {
    //     return 'The account already exists for that email.';
    //   }
    // } catch (e) {
    //   return 'something wrong';
    // }
  }

  Future<Map<String, dynamic>> logIn(String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return {"user": credential.user};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {'error': 'The password provided is too weak.'};
      } else if (e.code == 'email-already-in-use') {
        return {'error': 'The account already exists for that email.'};
      }else{
        return {"error":e.toString()};
      }
    } catch (e) {
      return {'error': 'something wrong'};
    }
  }

  forgetPassword(String email) {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  updatePassword(String newPassword) {
    firebaseAuth.currentUser.updatePassword(newPassword);
  }

// resetPassword(String email){
//   firebaseAuth.v(email: email);
// }
}
