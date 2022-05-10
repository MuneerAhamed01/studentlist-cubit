import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_bloc/colors/colors.dart';
import 'package:studentlist_bloc/logics/cubit/cubit/add_student_cubit.dart';

const textStyleBlack = TextStyle(color: Colors.black);
const sizedbox10 = SizedBox(
  height: 10,
);
TextStyle styleHeading() {
  return const TextStyle(
      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
}

const sizedboxWidth10 = SizedBox(
  width: 10,
);
const sizedbox5 = SizedBox(
  height: 5,
);
const sizedbox50 = SizedBox(
  height: 50,
);

InputDecoration deocrationSearchBar({
  required String label,
  required IconData suffix,
}) {
  return InputDecoration(
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 0.5)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      prefixIcon: Icon(
        suffix,
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      filled: true,
      hintStyle: TextStyle(
        color: Colors.grey[800],
        fontSize: 14,
      ),
      hintText: label,
      fillColor: scaffoldBackground);
}

const sizedbox30 = SizedBox(
  height: 25,
);

class PhotoAvatar extends StatelessWidget {
  const PhotoAvatar({Key? key, required this.onTap}) : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddStudentCubit, AddStudentState>(
        //assest/images/blank-profile-picture-973460_640.png
        builder: (context, state) {
      state as InitialValue;
      return Container(
        height: 140,
        width: 130,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            image: state.image == null
                ? const DecorationImage(
                    image: AssetImage(
                        "assest/images/blank-profile-picture-973460_640.png"))
                : DecorationImage(
                    fit: BoxFit.cover, image: FileImage(File(state.image!)))),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(alignment: Alignment.topRight, children: [
            CircleAvatar(
              backgroundColor: scaffoldBackground,
              radius: 16,
              child: GestureDetector(
                onTap: onTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 14,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}

const sizedbox20 = SizedBox(
  height: 20,
);

class CameraView extends StatelessWidget {
  const CameraView(
      {Key? key,
      required this.body,
      required this.heading,
      required this.color})
      : super(key: key);
  final IconData heading;
  final String body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            heading,
            color: color,
          ),
          sizedboxWidth15,
          Text(
            body,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

const sizedboxWidth15 = SizedBox(
  width: 15,
);
Future<dynamic> showSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            height: 150,
            width: double.infinity,
            child: Column(
              children: [
                sizedbox10,
                const Text(
                  "Choose From",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                sizedbox30,
                GestureDetector(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? photo =
                        await _picker.pickImage(source: ImageSource.camera);
                    context.read<AddStudentCubit>().showImage(photo);
                    Navigator.pop(context);
                  },
                  child: CameraView(
                    body: "Camera",
                    heading: Icons.camera,
                    color: Colors.green[900],
                  ),
                ),
                sizedbox30,
                GestureDetector(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? photo =
                        await _picker.pickImage(source: ImageSource.gallery);
                    context.read<AddStudentCubit>().showImage(photo);
                    Navigator.pop(context);
                  },
                  child: const CameraView(
                    body: "Gallery",
                    heading: Icons.file_copy,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ));
}
