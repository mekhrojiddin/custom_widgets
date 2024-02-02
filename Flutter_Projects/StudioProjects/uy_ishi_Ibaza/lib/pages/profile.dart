import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:uy_ishi_bza/assets/icons.dart';
import 'package:uy_ishi_bza/pages/profile_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? avatar;
  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FC),
      appBar: AppBar(title: Center(child: Text("Profile malumotlari"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                width: 385,
                height: 294,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(152, 20, 0, 0),
                    child: Container(
                      width: 74,
                      height: 74,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: avatar == null
                          ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            )
                          : Image.file(
                              avatar!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(330, 12, 12, 0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => ProfileEdit()));
                        },
                        child: SvgPicture.asset(AppIcons.edit)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 120, 16, 0),
                    child: Container(
                      width: 335,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 180, 0),
                            child: Text("F.I.Sh"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(1, 10, 180, 0),
                            child: Text("F.I.Sh"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(1, 10, 180, 0),
                            child: Text("Manzilingiz"),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(1, 10, 180, 0),
                            child: Text("F.I.Sh"),
                          ),
                        ],
                      ),
                    ),
                  )
                ])),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              width: 385,
              height: 76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 313,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red.shade100),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    AppIcons.logout,
                  ),
                  Gap(10),
                  Text("Chiqish")
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
