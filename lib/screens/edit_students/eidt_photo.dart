import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors/colors.dart';
import '../../logics/cubit/cubit/add_student_cubit.dart';

class PhotoAvatarEdit extends StatelessWidget {
  const PhotoAvatarEdit(
      {Key? key, required this.onTap, required this.imagepath})
      : super(key: key);
  final void Function() onTap;
  final String imagepath;
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
                ? imagepath.isEmpty
                    ? const DecorationImage(
                        image: AssetImage(
                            "assest/images/blank-profile-picture-973460_640.png"))
                    : DecorationImage(
                        fit: BoxFit.cover, image: FileImage(File(imagepath)))
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
