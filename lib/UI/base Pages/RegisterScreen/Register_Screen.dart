import 'package:chat/UI/Base%20Model%20for%20Repetition/Base.dart';
import 'package:chat/UI/base%20Pages/RegisterScreen/register(VIEW%20MODEL).dart';
import 'package:chat/UI/base%20Pages/login/LoginScreen.dart';
import 'package:chat/my%20functions/Ui_Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class registerScreen extends StatefulWidget {
  static const String routeName = 'regs ';
  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends BaseState<registerScreen,RegisterViewModel>
    implements RegisterNavigator {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool securepassword = true;
  @override
  RegisterViewModel initViewModel() {
    // TODO: implement initViewModel
    return RegisterViewModel() ;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewModel ,  // when we will use it ? ==> in init state
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/backk.jpg"),fit: BoxFit.fill)),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Create account', style: TextStyle(fontSize: 28),),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: FormKey,
                child:
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Lottie.asset("assets/72909-account-circle.json", width: 250 , height: 120) ,

                      TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'Please enter Full Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Full name",
                        ),
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'Please enter user Name';
                          }
                          if (text.contains(' ')) {
                            return 'user name must not contains white spaces';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "User name ",

                        ),
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
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
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please enter password';
                          }
                          if (text
                              .trim()
                              .length < 6) {
                            return 'password should be at least 6 chars';
                          }
                          return null;
                        },
                        obscureText: securepassword,
                        decoration: InputDecoration(
                            labelText: "Password ",
                            suffixIcon: InkWell(onTap: () {
                              securepassword = !securepassword;
                              setState(() {});
                            },
                                child: Icon(securepassword
                                    ? Icons.visibility
                                    : Icons.visibility_off))
                        ),
                      ),
                      SizedBox(height: 28,),
                      ElevatedButton(onPressed: () {
                        CreateAccountClicked();
                      },
                          style: ButtonStyle(padding: MaterialStateProperty.all(
                              EdgeInsets.all(8))),
                          child: Text("Create Account", style: TextStyle(
                            fontSize: 18,
                          ),)

                      ),
                      Center(child: Text("you already have an account ? ", style: TextStyle(color:Colors.black , fontWeight: FontWeight.bold ,fontSize: 20),)) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushReplacementNamed(context,
                                LoginScreen.routeName);
                          }, child:   Container(
                            width: 180,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.black , borderRadius: BorderRadius.circular(28)),
                            child:  Center(child: Text("Login", style: TextStyle(fontSize: 30 , color: Colors.white , ) ,)),
                          )          )
                        ],
                      ),



                    ],),
                ),),
            ),

          )),
    );
  }
  void CreateAccountClicked() {
    if (FormKey.currentState?.validate() == false) {return;}
    ViewModel.register(emailcontroller.text, passwordcontroller.text) ;
  }

}




/* showLoading(context, "Just wait second");
    authService.createUserWithEmailAndPassword(email: emailcontroller.text,
        password: passwordcontroller.text).then((userCredential) {
      hideLoading(context);
      showMessage(context, (userCredential.user?.uid) ?? "");
      showMessage(context, "added successfully") ;
    }
    ).onError((error, stackTrace) {
      hideLoading(context);
      showMessage(context, error.toString());
    });*/