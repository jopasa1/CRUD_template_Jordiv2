
import 'package:crud_framework/CRUD_base/CRUD_view_base.dart';
import 'package:crud_framework/models/library_model.dart';
import 'package:crud_framework/widgets_lib/app_base.dart';
import 'package:crud_framework/widgets_lib/widgets.dart';
import 'package:flutter/material.dart';

import 'CRUD_base/CRUD_controller.dart';
import 'CRUD_base/CRUD_list_base.dart';

void main() async{
  //CRUDControllerBase<Author>().getAllItems();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/author_list': (context) => CRUDListBase<Author>(
            itemBuilder: createCards, addItemRoute: '/author_add', viewItemRoute: '/author_view'),
        '/author_add': (context) => CRUDViewBase<Author>(detailedView: detailDialog,editFormView: CRUD_View_Author(),)
      },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/author_view':
            {
              return MaterialPageRoute(builder: (context) =>
                  CRUDViewBase<Author>(item: routeSettings.arguments as Author,
                    detailedView: detailDialog,
                    editFormView: CRUD_View_Author(oAuthor: routeSettings.arguments as Author,),));
            }
        }
        return null;
      },
      home: const MyHomePage(title: 'CRUD Template'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseApp(body: Text("CRUD Template"));
  }
}