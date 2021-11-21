

import 'package:flutter_basico/models/checkbox_model.dart';
import 'package:flutter_basico/utils/utils.dart';

class Repository {
  populaLista(){
    List<CheckBoxModel> Lista = [];
    for(var i = 0 ; i < 1000 ; i++){
      Lista.add(CheckBoxModel(id: i, content: Utils.generateRandomString(15), isChecked: Utils.generateRandomEnabledState()));
    }

    return Lista;
  }

  saveDefault(List<CheckBoxModel> ListaOriginal){
    List<bool> listDefault = [];
    for(var i = 0 ; i < ListaOriginal.length ; i++){
      listDefault.add(ListaOriginal[i].isChecked);
    }

    return listDefault;
  }
}