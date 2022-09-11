import 'package:chat/UI/Base%20Model%20for%20Repetition/Base.dart';
import 'package:chat/my%20functions/Ui_Utils.dart';
import 'package:flutter/material.dart';
// Rule ==> any ViewModel must extends Navigator =====> so the BASE ViewMODEl MUST EXTENDS BASE NAVIGATOR
 abstract class BaseNavigator{
  void showLoadingDialog({String message = "loading ..."}); //
  void hideLoadingDialog() ; //
  void ShowMessageDialog(String message ) ; //
}
//-------------------------------------------------------------------------------------------------------------------------------------------------
//BASE ViewMODEl MUST EXTENDS BASE NAVIGATOR
class BaseViewModel <BaseNav extends BaseNavigator> extends ChangeNotifier{
BaseNav? navigator ; // like navigator at login and register viewmodel
}
// => all ViewModels extend state <= but there is one condition to do that !  it must take object from statefulwidget  = SO
abstract class BaseState<T extends StatefulWidget , VM  extends  BaseViewModel> extends State<T>
    implements BaseNavigator{
// vm extend BaseVIew model ====> مش احنا كنا في كل مرة بنخلي الاسكرين بتاعتنا ت اكستند ال فيو مودل بتاعها
//  T extends stateful ==> دة شرط اساسي عشان اعرف اعمل اكستند  ل الاستيت
late VM ViewModel ;   // بدل ما اعرف عند  كل اسكرين ال فيو موديل بتاعها
@override
  void initState() {
    super.initState();
  // ViewModel = VM() ;       ! الكلام دة منفعش
ViewModel = initViewModel() ;
ViewModel.navigator =this ;
}     //// مش مضطر اعملها كل مرة في اي بيدج
VM initViewModel();
//-------------------------------------------------------------------------------------------------------------------------------
@override
void ShowMessageDialog(String message) {
  // TODO: implement ShowMessageDialog
  showLoading(context, message) ;
}
//-------------------------------------------------------------------------------------------------------------------------------

@override
void hideLoadingDialog() {
  // TODO: implement hideLoadingDialog
  hideLoading(context );
}
//-------------------------------------------------------------------------------------------------------------------------------

@override
void showLoadingDialog({String message = "loading ..."}) {
  // TODO: implement showLoadingDialog
  showLoading(context, message) ;
}

}


