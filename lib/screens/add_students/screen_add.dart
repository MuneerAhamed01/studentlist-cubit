import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_bloc/colors/colors.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/logics/cubit/cubit/add_student_cubit.dart';
import 'package:studentlist_bloc/widgets/mini_widgets.dart';

class AddingScreen extends StatelessWidget {
  AddingScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

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
          "Add Student",
          style: textStyleBlack,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          sizedbox10,
          PhotoAvatar(
            onTap: () {
              showSheet(context);
            },
          ),
          sizedbox50,
          Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
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
                    BlocBuilder<AddStudentCubit, AddStudentState>(
                        builder: (context, state) {
                      state as InitialValue;
                      return SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () {
                              addAndValidate(context,state.image??"");
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    })
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  void addAndValidate(BuildContext context,String image) {
    if (formKey.currentState!.validate()) {
      final Studentlist studentlist = Studentlist(
          name: name, domain: domain, number: phone, place: place, image: image);

      context.read<AddStudentCubit>().addList(studentlist);

      Navigator.pop(context);
    }
  }
}

