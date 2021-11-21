
import 'package:flutter/material.dart';
import 'package:flutter_basico/models/checkbox_model.dart';
import 'package:flutter_basico/repository/repository.dart';


class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  Repository repository = Repository();
  List<CheckBoxModel> itens = [];
  List<bool> listDefault = [];
  HomePageState(){
    itens = repository.populaLista();
    listDefault = repository.saveDefault(itens);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio Programação Hibrida'),
      ),

      body: Column(

        children: <Widget>[
          Container(
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      for(var i = 0 ; i < itens.length ; i++){
                        itens[i].isChecked = listDefault[i];
                      }

                    });
                  },
                  child: const Text('Resetar todos os itens', style: TextStyle(fontSize: 18))
              )
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: itens.length,

              itemBuilder: (BuildContext ctx, int index){
                final item = itens[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      ),
                      contentPadding: EdgeInsets.all(8),
                      title: Text(item.content, style: TextStyle(color: item.isChecked ? Colors.white : Colors.black)),
                      tileColor: item.isChecked ? Colors.grey : Colors.white70,
                      key: Key(item.id.toString()),
                      value: item.isChecked,
                      onChanged: (value){
                        setState(() {

                          item.isChecked = !item.isChecked;
                        });
                      }
                    ),
                );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}



