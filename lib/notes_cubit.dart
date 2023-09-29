import 'package:notesapp_cubit/notes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() :super(NotesState(arrData: []));

  void addData(Map<String, dynamic>data) {
    var listdata = state.arrData;
    listdata.add(data);
    emit(NotesState(arrData: state.arrData));
  }
}