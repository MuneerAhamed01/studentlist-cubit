import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist_bloc/colors/colors.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/logics/cubit/cubit/add_student_cubit.dart';
import 'package:studentlist_bloc/screens/edit_students/screen_edit.dart';
import 'package:studentlist_bloc/widgets/mini_widgets.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.list}) : super(key: key);
  Studentlist list;
  List changed = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: scaffoldBackground,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height / 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      image: changed.isNotEmpty
                          ? changed[4] == ''
                              ? const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assest/images/blank-profile-picture-973460_640.png"))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(changed[4])))
                          : list.image!.isEmpty
                              ? const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assest/images/blank-profile-picture-973460_640.png"))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(list.image!)))),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () => Navigator.pop(context)),
                      IconButton(
                          onPressed: () => Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => EditScreen(
                                  list: list,
                                ),
                              ))
                                  .then((value) {
                                changed = value;
                              }),
                          icon: const Icon(
                            Icons.edit_calendar_rounded,
                          ))
                    ],
                  ),
                )
              ],
            ),
            sizedbox20,
            const Text(
              "About",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            sizedbox20,
            DetailsView(
              body: changed.isEmpty ? list.name : changed[0],
              heading: "Name :",
            ),
            sizedbox20,
            DetailsView(
                body: changed.isEmpty ? list.domain : changed[1],
                heading: "Domine :"),
            sizedbox20,
            DetailsView(
                body: changed.isEmpty ? list.number : changed[2],
                heading: "Number :"),
            sizedbox20,
            DetailsView(
                body: changed.isEmpty ? list.place : changed[3],
                heading: "Place :")
          ],
        ));
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.body, required this.heading})
      : super(key: key);
  final String heading;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          Text(
            body,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
