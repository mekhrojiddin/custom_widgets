// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:homework_productive/features/on_board/Onboarding1.dart';
// import 'package:homework_productive/page_view.dart';
// import 'package:homework_productive/screens/tasks.dart';
//
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../constants/colors.dart';
// import '../constants/icons.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (_) => Page_One()));
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: dark,
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(40),
//         child: const CupertinoActivityIndicator(
//           radius: 16,
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 80),
//           Center(
//             child: SvgPicture.asset(AppIcons.logo),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Productive',
//             style: TextStyle(
//               color: white,
//               fontSize: 40,
//               fontWeight: FontWeight.w700,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/constants/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/login');
        },
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                SvgPicture.asset(AppIcons.logo),
                const CupertinoActivityIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}