import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:homework_productive/assets/constants/colors.dart';
import 'package:homework_productive/create_new_password.dart';
import 'package:pinput/pinput.dart';

// import 'constants/colors.dart';
import 'features/home/widgets/home.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: textFieldBackgroundColor2,
      border: Border.all(
        color: pinPutBorderColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Email verification',
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/img.png'),
              ),
            ),
            const Text(
              'Please enter the 4 digital code that send\nto your email address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            Pinput(
                length: 4,
                isCursorAnimationEnabled: true,
                forceErrorState: isError,
                controller: pinPutController,
                enableSuggestions: isPinPutValid,
                defaultPinTheme: isPinPutValid
                    ? defaultPinTheme.copyBorderWith(
                        border: Border.all(
                        color: green,
                      ))
                    : defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: pinPutBorderColor,
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: errorColor,
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 4) {
                    if ("1234" == value) {
                      isPinPutValid = true;
                    } else {
                      isError = true;
                    }
                    setState(() {});
                  } else {
                    isPinPutValid = false;
                    isError = false;
                    setState(() {});
                  }
                },
                onCompleted: (value) {
                  if (isPinPutValid) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreatePassword()));
                  }
                }),
            Gap(32.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don’t receive code.",
                      style: TextStyle(
                        color: Color(0xFF979797),
                      ),
                    ),
                    TextButton(
                      onPressed:(){},
                      child: Text("Resend",
                      style: TextStyle(
                        color: Color(0xFF407BFF),
                      ),
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
