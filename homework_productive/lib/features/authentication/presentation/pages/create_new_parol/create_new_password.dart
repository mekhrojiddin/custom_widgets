import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:homework_productive/assets/constants/colors.dart';
import 'package:homework_productive/core/widgets/w_button.dart';


import 'assets/constants/icons.dart';
import 'features/home/widgets/home.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool isLoginDataValid = false;
  final newPasController = TextEditingController();
  final comfirmPasController = TextEditingController();

  final newPassFocusNode = FocusNode();
  final comfirmPasswordFocusNode = FocusNode();
  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final formKey = GlobalKey<FormState>();
  String password = '';
  bool isObscure = true;

  @override
  void initState() {
    newPasController.addListener(() {
      if(formKey.currentState!.validate()){
        isLoginDataValid = true;
        setState(() {

        });
      }
      else{
        setState(() {
          isLoginDataValid = false;
        });
      }
    });

    comfirmPasController.addListener(() {
      if(formKey.currentState!.validate()){
        isLoginDataValid = true;
        setState(() {

        });
      }else{
        setState(() {
          isLoginDataValid = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    newPasController.dispose();
    comfirmPasController.dispose();
    super.dispose();
  }

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: textFieldBackgroundColor2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBarColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                height: 29,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const Text(
                  "Create new password",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: newPasswordColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: 130,
                child: Image.asset("assets/images/img.png"),
              ),
              const Gap(48),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: newPassFocusNode,
                      controller: newPasController,
                      decoration: decoration(hintText: 'Enter new password'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        comfirmPasswordFocusNode.requestFocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, yangi parolni kiriting kiriting!';
                        } else if (value.length<8){

                          return "Parol kamida 8 belgidan iborat bo'lsin";
                        }

                        return null;
                      },
                    ),
                    const Gap(16),
                    TextFormField(

                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: comfirmPasswordFocusNode,
                      controller: comfirmPasController,
                      decoration: decoration(hintText: 'Confirm password',
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 10, right: 12,bottom: 10),
                          child: SvgPicture.asset(AppIcons.createPassword,

                            color: isLoginDataValid?iconColor:null,

                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        comfirmPasswordFocusNode.unfocus();
                      },
                      validator: (value) {
                        if(value==null ||value.isEmpty){
                          return "Parolni qaydadan kiriting";
                        }else if(value !=password){
                          return "Xatolik qayta urining";
                        }
                        return null;
                      },
                    ),
                    const Gap(50),
                    WButton(

                      onTap: (){
                        if(isLoginDataValid){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }
                      },
                      text: "Save",
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom +24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
