import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/logics/cubit/cubit/add_student_cubit.dart';
import 'package:studentlist_bloc/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const modelName = "studentlist";
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentlistAdapter().typeId)) {
    Hive.registerAdapter(StudentlistAdapter());
  }

  await Hive.openBox<Studentlist>(modelName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddStudentCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
