import 'package:flutter/material.dart';
import 'package:shared/configure/sqflite/sql_helper.dart';

import '../../../configure/sqflite/nodes_model.dart';
class cartsScreen extends StatefulWidget {
  static const routeName="cartsScreen";
  const cartsScreen({super.key});

  @override
  State<cartsScreen> createState() => _cartsScreenState();
}

class _cartsScreenState extends State<cartsScreen> {
  TextEditingController title=TextEditingController();
  TextEditingController content=TextEditingController();
  List<Notes> note=[];

  loudNote()async{
    final data=await Sqlhelper().loadNotes();
    setState(() {
      note=data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loudNote();
  }

  //insert data
  addNotes()async{
    Notes note=Notes(title: title.text, content: content.text);
    await Sqlhelper().insertNote(note);
    title.clear();
    content.clear();
    loudNote();
  }

  delete(int id)async{
    Sqlhelper().deleteNote(id);
    loudNote();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: ListView.builder(
        itemCount: note.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(note[index].title),
            subtitle: Text(note[index].content),
            trailing: IconButton(
              onPressed: () {
                delete(note[index].id!);
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
