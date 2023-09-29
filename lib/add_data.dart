import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_cubit/uihelper.dart';
import 'notes_cubit.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(titleController, "title", Icons.mail),
            UiHelper.CustomTextField(descController, "Description", Icons.mail),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              var title=titleController.text.toString();
              var desc=descController.text.toString();
              if(title=="" && desc==""){
                return log("Enter Required Fields");
              }else{
                context.read<NotesCubit>().addData({
                  'title':title,
                  'desc':desc,
                });
              }
            }, child: Text("Add Data"))
          ],
        )
    );
  }
}