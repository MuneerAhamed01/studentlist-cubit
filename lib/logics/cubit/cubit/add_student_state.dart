part of 'add_student_cubit.dart';

abstract class AddStudentState {}

class InitialValue extends AddStudentState {
  final List<Studentlist> studentlist;
  String? image;
  InitialValue({required this.studentlist,  this.image});
}
