import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_cubit/add_data.dart';
import 'package:notesapp_cubit/notes_cubit.dart';
import 'package:notesapp_cubit/notes_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit,NotesState>(builder: (context,state){
        return ListView.builder(itemBuilder: (context,index){
          return ListTile(
            title: Text("${state.arrData[index]["title"]}"),
            subtitle: Text("${state.arrData[index]['desc']}"),
          );
        },itemCount: state.arrData.length);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AddDataState()));
        },
      ),
    );
  }
}
