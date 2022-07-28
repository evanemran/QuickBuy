import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget{
  const SavedPage({Key? key, this.title}) : super(key: key);

  final title;

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.black,
      // ),
      body: Container(

      ),
    );
  }

}