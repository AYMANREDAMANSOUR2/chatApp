import 'package:chat/UI/Base%20Model%20for%20Repetition/Base.dart';
import 'package:chat/UI/base%20Pages/RegisterScreen/register(VIEW%20MODEL).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
abstract class RegisterNavigator extends BaseNavigator {
}
class RegisterViewModel  extends BaseViewModel<RegisterNavigator> {
  var authService = FirebaseAuth.instance;
  void register(String email ,String password )async{

    try{
      var credentials = await  authService.createUserWithEmailAndPassword(email: email, password: password) ;
      navigator?.ShowMessageDialog(credentials.user?.uid ??""  ) ;
    }on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog() ;
      if (e.code == 'weak-password') {
        navigator?.ShowMessageDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator?.ShowMessageDialog('The account already exists for that email.');
      }
    } catch (e) {
      navigator?.ShowMessageDialog(" something  went wrong , please try again later ");
    }
  }


}