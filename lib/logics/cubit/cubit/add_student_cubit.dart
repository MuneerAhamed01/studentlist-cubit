import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/main.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  var box = Hive.box<Studentlist>(modelName);
  AddStudentCubit()
      : super(
          InitialValue(
            studentlist: Hive.box<Studentlist>(modelName).values.toList(),
          ),
        );

  void addList(Studentlist studentlist) {
    Hive.box<Studentlist>(modelName).add(studentlist);
    emit(InitialValue(studentlist: box.values.toList()));
  }

  void delete(int key) {
    Hive.box<Studentlist>(modelName).delete(key);

    emit(InitialValue(studentlist: box.values.toList()));
  }

  void showImage(XFile? photo) async {
    if (photo != null) {
      emit(InitialValue(studentlist: box.values.toList(), image: photo.path));
    } else {
      return;
    }
  }

  void editImage(int key, Studentlist list) {
    Hive.box<Studentlist>(modelName).put(key, list);
    emit(InitialValue(studentlist: box.values.toList()));
  }
}
