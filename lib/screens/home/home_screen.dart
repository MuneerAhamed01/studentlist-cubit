import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist_bloc/colors/colors.dart';
import 'package:studentlist_bloc/logics/bloc/searchbloc_bloc.dart';
import 'package:studentlist_bloc/logics/cubit/cubit/add_student_cubit.dart';
import 'package:studentlist_bloc/screens/add_students/screen_add.dart';
import 'package:studentlist_bloc/screens/home/widgets/list_of_students.dart';
import 'package:studentlist_bloc/widgets/mini_widgets.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("set state");
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Stack(
            // alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 210,
                    ),
                    BlocBuilder<AddStudentCubit, AddStudentState>(
                        builder: (context, state) {
                      state as InitialValue;
                      

                      if (state.studentlist.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 300, left: 140),
                          child: Text("No data Available"),
                        );
                      } else {
                        return ListView.separated(
                          separatorBuilder: (context, index) => sizedbox10,
                          itemBuilder: (context, index) {
                            return ListViewStudent(
                              list: state.studentlist,
                              index: index,
                            );
                          },
                          controller: ScrollController(),
                          itemCount: state.studentlist.length,
                          shrinkWrap: true,
                        );
                      }
                    }),
                    sizedbox50
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: double.infinity,
                color: const Color.fromARGB(255, 45, 44, 44),
                child: SafeArea(
                  child: Text(
                    "StudentList",
                    style: styleHeading(),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SearchBar(
                    onChanged: (value) {
                      context
                          .read<SearchblocBloc>()
                          .add(SearchEvent(value: value));
                    },
                  ),
                  Container(
                    color: Colors.blueGrey[50],
                    height: 8,
                    width: double.infinity,
                  )
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddingScreen(),
        )),
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 45, 44, 44),
      ),
    );
  }
}
