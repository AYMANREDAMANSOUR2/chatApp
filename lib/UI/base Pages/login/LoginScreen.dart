import 'package:chat/UI/Base%20Model%20for%20Repetition/Base.dart';
import 'package:chat/UI/base%20Pages/RegisterScreen/Register_Screen.dart';
import 'package:chat/UI/base%20Pages/login/Login(VIEW%20MODEL%20).dart';
import 'package:chat/my%20functions/Ui_Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = " login ";

  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
// implement LoginNavigator mean than we have access to their functions
class _LoginScreenState extends BaseState<LoginScreen , LoginViewModel>
    implements LoginNavigator  {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool securepassword = true;
  @override
  LoginViewModel initViewModel() {
   return LoginViewModel();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel = LoginViewModel() ;  //it will be create when we just here
    ViewModel.navigator = this ;   // here we make  viewMode know that it will navigate here by navigator class
}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(  // we wrapped  it with provider
      create: (_) => ViewModel ,
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backk.jpg"), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Log in with your account ',
                style: TextStyle(fontSize: 28),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: FormKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11,
                      ),
                      Lottie.asset("assets/94789-chat-animation.json", width: 250 , height: 150) ,
                      TextFormField(
                        controller: emailcontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Email';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'email format not valid , please enter valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email address ",
                        ),
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter password';
                          }
                          if (text.trim().length < 6) {
                            return 'password should be at least 6 chars';
                          }
                          return null;
                        },
                        obscureText: securepassword,
                        decoration: InputDecoration(
                            labelText: "Password ",
                            suffixIcon: InkWell(
                                onTap: () {
                                  securepassword = !securepassword;
                                  setState(() {});
                                },
                                child: Icon(securepassword
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            SignIn();
                          },
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(8))),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Center(
                          child: Text(
                        "if you don't have an account let's ... ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, registerScreen.routeName);
                              },
                              child: Container(
                                width: 200,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(28)),
                                child: Center(
                                    child: Text(
                                  "sign in",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                )),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
  void SignIn() {
    if (FormKey.currentState?.validate() == false) {
      // create Account
      return;
    }
    // all  this ... is  LOGiC (it must be in ViewModel not View ...)  => moved to ViewModel
    ViewModel.login(emailcontroller.text, passwordcontroller.text) ;
  }
 @override
  void showLoadingDialog({String message = "loading ..."}) {
   showLoading(context, message) ;
  }
}
