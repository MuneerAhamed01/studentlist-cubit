part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchblocState {}

class SearchblocInitial extends SearchblocState {
  List<Studentlist> searchValue;

  SearchblocInitial({required this.searchValue});
}
