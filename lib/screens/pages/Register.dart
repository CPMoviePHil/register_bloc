import 'package:flutter/material.dart';
import 'package:register/utils/screens/screensUtils.dart';

class Register extends StatefulWidget{

  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  FocusNode accountFocus = FocusNode();
  TextEditingController accountController = TextEditingController();

  FocusNode passwordFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    onChanged: null,
                    onSubmitted: null,
                    onTap: null,
                    focusNode: accountFocus,
                    keyboardType: TextInputType.text,
                    textEditingController: accountController,
                    hintText: "帳號",
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 19,),
                  ),
                  AppTextField(
                    onChanged: null,
                    onSubmitted: null,
                    onTap: null,
                    focusNode: passwordFocus,
                    keyboardType: TextInputType.visiblePassword,
                    textEditingController: passwordController,
                    hintText: "密碼",
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10,),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          onPressed: null,
                          buttonText: "提交",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}