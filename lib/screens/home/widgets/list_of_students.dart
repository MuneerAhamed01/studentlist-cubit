import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/screens/student_details/screen_details.dart';

import '../../../logics/cubit/cubit/add_student_cubit.dart';
import '../../../widgets/mini_widgets.dart';

class ListViewStudent extends StatelessWidget {
  const ListViewStudent({Key? key, required this.index, required this.list})
      : super(key: key);
  final int index;
  final List<Studentlist> list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  DetailsScreen(list: list[index]),
        )),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                list[index].image!.isEmpty
                    ? const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                            "assest/images/blank-profile-picture-973460_640.png"),
                      )
                    : CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        backgroundImage: FileImage(File(list[index].image!)),
                      ),
                sizedboxWidth10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].name,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    sizedbox5,
                    Text(
                      list[index].domain,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<AddStudentCubit>().delete(list[index].key);
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Color.fromARGB(255, 39, 39, 39),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedboxWidth10
              ],
            ),
          ),
        ),
      ),
    );
  }
}
