import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/screens/edit_students/eidt_photo.dart';

import '../../colors/colors.dart';
import '../../logics/cubit/cubit/add_student_cubit.dart';
import '../../widgets/mini_widgets.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required this.list}) : super(key: key);
  final Studentlist list;
  final formKeyEdit = GlobalKey<FormState>();
  String name = "";
  String domain = "";
  String place = "";
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Edit StudentList",
          style: textStyleBlack,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          sizedbox10,
          PhotoAvatarEdit(
            imagepath: list.image!,
            onTap: () {
              showSheet(context);
            },
          ),
          sizedbox50,
          Form(
              key: formKeyEdit,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: list.name,
                      cursorColor: Colors.black,
                      decoration: deocrationSearchBar(
                          suffix: Icons.contact_page_outlined, label: "Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else {
                          name = value;
                          return null;
                        }
                      },
                    ),
                    sizedbox30,
                    TextFormField(
                      initialValue: list.domain,
                      cursorColor: Colors.black,
                      decoration: deocrationSearchBar(
                          suffix: Icons.domain, label: "Domain"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else {
                          domain = value;
                          return null;
                        }
                      },
                    ),
                    sizedbox30,
                    TextFormField(
                      initialValue: list.number,
                      cursorColor: Colors.black,
                      decoration: deocrationSearchBar(
                          suffix: Icons.numbers, label: "Mobile Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else {
                          phone = value;
                          return null;
                        }
                      },
                    ),
                    sizedbox30,
                    TextFormField(
                      initialValue: list.place,
                      cursorColor: Colors.black,
                      decoration: deocrationSearchBar(
                          suffix: Icons.place, label: "Place"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else {
                          place = value;
                          return null;
                        }
                      },
                    ),
                    sizedbox30,
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: BlocBuilder<AddStudentCubit, AddStudentState>(
                          builder: (context, state) {
                        state as InitialValue;
                        return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () =>
                                putAndValidate(context, state.image == null ?list.image!.isEmpty?"":list.image!:state.image!),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ));
                      }),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  void putAndValidate(BuildContext context, String image) {
    if (formKeyEdit.currentState!.validate()) {
      final Studentlist studentlist = Studentlist(
          name: name,
          domain: domain,
          number: phone,
          place: place,
          image: image);

      context.read<AddStudentCubit>().editImage(list.key,studentlist);

      Navigator.pop(context,[name,domain,phone,place,image]);
    }
  }
}
