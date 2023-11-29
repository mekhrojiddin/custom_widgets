import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework_productive/constants/colors.dart';
import 'package:homework_productive/login.dart';

import 'Onboarding2.dart';
import 'constants/icons.dart';

class Page_One extends StatefulWidget {
  const Page_One({super.key});

  @override
  State<Page_One> createState() => _Page_OneState();
}

class _Page_OneState extends State<Page_One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 310, right: 24.0, top: 69),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                  setState(() {});
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(color: blue, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 176.0,
                left: 16,
                right: 16,
              ),
              child: SvgPicture.asset(AppIcons.page1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Easy Time Management",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: const Text(
                        "We help you stay organized and\n             manage your day",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page_Two()));
            setState(() {});
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(AppIcons.next),
            ),
          )),
    );
  }
}
