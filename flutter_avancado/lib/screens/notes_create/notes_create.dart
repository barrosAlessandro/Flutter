import 'package:flutter/material.dart';
import 'package:flutter_avancado/utils/constants.dart';
import 'package:localization/localization.dart';

class CreateNotes extends StatefulWidget{
  const CreateNotes({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateNotes();
  }

}

class _CreateNotes extends State<CreateNotes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('create-note'.i18n() , style: const TextStyle(color: kPrimaryColor, fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        actions: 
          <Widget>[
            IconButton(
              icon: const Icon(Icons.done, color: Colors.green),
              tooltip: 'Notifications',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Função não implementada')));
              },
            )
          ],
      ),

      body: Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          cursorHeight: 30,
          autofocus: true,
          cursorColor: kPrimaryColor,
          maxLines: 10,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration.collapsed(
            hintText: 'note-input'.i18n()
          )
        )
        
      ),

    );
  }

  
}