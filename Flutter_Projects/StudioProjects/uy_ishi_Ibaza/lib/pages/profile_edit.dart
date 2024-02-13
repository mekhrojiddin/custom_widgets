import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uy_ishi_bza/assets/icons.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController nameControl = TextEditingController();
  TextEditingController locationControl = TextEditingController();
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
      appBar: AppBar(
          title: Center(
        child: Text("Profilni tahrirlash"),
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 385,
              height: 359,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                color: Colors.green,
                              )
                            : Image.file(
                                avatar!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 60, 28, 10),
                    child: GestureDetector(
                      onTap: () {
                        pickerAvatar();
                        print("ishladi");
                      },
                      child: SvgPicture.asset(
                        AppIcons.edit,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 50,
                      sigmaY: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 108, 270, 0),
                        child: Text("F.I.SH"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                              color: Color(0xFFF2F3F5),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 18, 250, 0),
                        child: Text("Manzilinggiz"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                              color: Color(0xFFF2F3F5),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          child:   Container(
            width: 380,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFF0CB23)),
            child: Center(child: Text('Saqlash')),
          ),
        ),
      ),
    );
  }
}
