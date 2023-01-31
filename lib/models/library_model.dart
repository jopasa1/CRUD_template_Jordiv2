

import 'package:crud_framework/CRUD_base/CRUD_model_base.dart';
import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Author extends Item<int>{

  final String name;
  final String surname;

  Author(super.key, this.name, this.surname);

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    Map<String,dynamic> author_map={
      'key':super.key,
      'name':this.name,
      'surname':this.surname,
    };
    return author_map;
    //throw UnimplementedError();
  }
}

class CRUD_Author implements CRUDModelBase<int,Author>{


  Map<int,Author> _datos ={
    1:Author(1,"Pedro","Martin"),
    2:Author(2,"Juan","Gonzalez"),
  };

  @override
  void addItem(elItem) {
    int key=elItem.key;
    if (_datos.containsKey(key)) {
      throw ArgumentError("Ja existeix un item amb la clau $key");
    }
    _datos[key]=elItem;
  }

  @override
  // TODO: implement datos
  Map<int,Author> get datos => _datos;

  @override
  void updateItem(item) {
    // TODO: implement updateItem
  }
}

class CRUD_View_Author  extends CRUDFormulari<Author>{
  CRUD_View_Author({super.key,this.oAuthor});
  final Author? oAuthor;
  @override
  State<StatefulWidget> createState() => _CRUD_View_Author_State();
  String name = "";
  String surname = "";
  @override
  Author getItem() {

    return Author(0, name, surname);
    // TODO: implement getItem
    throw UnimplementedError();
  }

}
class _CRUD_View_Author_State extends State<CRUD_View_Author>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onSaved: (String? value){widget.name=value!;},
          initialValue: "",
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        TextFormField(
          onSaved: (String? value){widget.surname=value!;},
          initialValue: "",
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
    throw UnimplementedError();
  }

}