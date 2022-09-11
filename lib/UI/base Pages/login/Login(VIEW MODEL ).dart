import 'package:chat/UI/Base%20Model%20for%20Repetition/Base.dart';
import 'package:chat/UI/base%20Pages/login/Login(VIEW%20MODEL%20).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//any deal with widget (login screen ) by navigator
//  we will create navigator to use context in viewModel
abstract class LoginNavigator    extends BaseNavigator  { // put in  what u will need to  use at your screen
  //  View <=  NAVIGATOR => ViewModel}
  }
//-----------------------------------------------------------------------------------------------------------------------------------
class LoginViewModel  extends BaseViewModel<LoginNavigator>  {
  // we must take object from LoginViewModel in their Screen  +  i just need it in my widget (loginScreen) so wrap it with provider
  // i will gonna my screen and implement navigator  there
  var auth = FirebaseAuth.instance;
  void  login(String email , String  password) async{      // okay now we will use this function at login screen to deal with firebase
    try{
      navigator?.showLoadingDialog();                    //show loading by navigator because show loading is Ui Function
      var  credential  =  await  auth.signInWithEmailAndPassword(email: email, password: password) ;
    // show user id ...
      navigator?.hideLoadingDialog() ;
      navigator?.ShowMessageDialog(credential.user?.uid ?? "") ;
    }on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog();
      navigator?.ShowMessageDialog("wrong user name or password ") ;
      //according the security we wanna show the same message on wrong pass or email
    }
  }





}






/*
*   authService.signInWithEmailAndPassword(
      email: emailcontroller.text, password: passwordcontroller.text)
      .then((userCredential) {
    showMessage(context, (userCredential.user?.uid) ?? "");
  }).onError((error, stackTrace) {
    hideLoading(context);
    showMessage(context, error.toString());
  });*/