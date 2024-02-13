import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:uy_ishi_bza/pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? avatar;

  Future<void> pickAvatar(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: source);
    if (file != null) {
      setState(() {
        avatar = File.fromUri(
          Uri.file(file.path),
        );
      });
    }
  }

  List<File> files = [];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      files.addAll(
        result.files
            .map(
              (e) => File.fromUri(
                Uri.file(e.path ?? ''),
              ),
            )
            .toList(),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File? avatar;
//   Future<void> pickerAvatar() async {
//     ImagePicker imagePicker = ImagePicker();
//     final file = await imagePicker.pickImage(source: ImageSource.gallery);

//     if (file != null) {
//       setState(() {
//         avatar = File.fromUri(Uri.file(file.path));
//       });
//     }
//   }

//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: Center(
//               child: Container(
//                 width: 150,
//                 height: 150,
//                 clipBehavior: Clip.hardEdge,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.transparent,
//                   border: Border.all(width: 1, color: Colors.grey),
//                 ),
//                 child: avatar == null
//                     ? const Icon(
//                         Icons.person,
//                         size: 100,
//                         color: Colors.grey,
//                       )
//                     : Image.file(
//                         avatar!,
//                         fit: BoxFit.cover,
//                       ),
//               ),
//             ) ,
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         pickerAvatar();
//       }),
//     );
//   }
// }
