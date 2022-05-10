import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:studentlist_bloc/database/studentlist_model.dart';
import 'package:studentlist_bloc/main.dart';

part 'searchbloc_event.dart';
part 'searchbloc_state.dart';

class SearchblocBloc extends Bloc<SearchblocEvent, SearchblocState> {
  final list = Hive.box<Studentlist>(modelName).values;
  SearchblocBloc()
      : super(SearchblocInitial(
            searchValue: Hive.box<Studentlist>(modelName).values.toList())) {
    on<SearchEvent>((event, emit) {
      if (event is SearchEvent) {
        List<Studentlist> newListofStudents = Hive.box<Studentlist>(modelName)
            .values
            .toList()
            .where((element) =>
                element.name.toLowerCase().contains(event.value.toLowerCase()))
            .toList();

        emit(SearchblocInitial(searchValue: newListofStudents));
      } else if (event is EmpytEvent) {
        emit(SearchblocInitial(searchValue: list.toList()));
      }
    });
  }
}
