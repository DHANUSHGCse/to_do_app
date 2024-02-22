import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main(){
  return runApp(todoApp());
}
class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  TextEditingController val = TextEditingController();
  List<Container> source = [];
  List<Container> target = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text("To do App",style: TextStyle(color: Colors.white),),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the Task',
                      ),
                      controller: val,
                    ),
                  ),
                  IconButton(onPressed: (){setState(() {
                    if(val.text!="") {
                      source.add(Container(color: Colors.deepOrange,
                          padding: EdgeInsets.all(30.0),
                          child: Text(val.text.toString(),
                              style: TextStyle(color: Colors.white))));
                    }val.text="";
                  });}, icon: Icon(Icons.add))
                ],
              ),
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable(
                    data: (source.isEmpty)
                        ? Container(child: Text("To do list is Empty"))
                        : source.first ,
                child:(source.isEmpty)
                ? Container(child: Text("To do list is Empty"))
                : source.first ,
            childWhenDragging: (source.length<2)?Text("To do List"):source.elementAt(1),
            feedback:(source.isEmpty)
            ? Container( child: Text("Empty")):source.first,
                    onDragEnd: (data){
                      setState(() {
                        if(!source.isEmpty){
                          target.add(source.first);
                          source.removeAt(0);
                        }
                      });
                    },
                  ),
                  (target.isEmpty)
                      ? Container(child: Text("Empty"))
                      : target.last
                ],
            ),]
          ),
        ),
      ),
    );
  }
}
