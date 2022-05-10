part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchblocEvent {}

class SearchEvent extends SearchblocEvent {
  String value;

  SearchEvent({required this.value});
}

class EmpytEvent extends SearchblocEvent{}
