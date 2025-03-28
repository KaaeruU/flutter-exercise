import 'package:exam/object_model.dart';
import 'package:exam/service.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Objectmodel object;
  final Function checkisPressed;
   final Function deleteObject;

  const Details({super.key, required this.object, required this.checkisPressed, required this.deleteObject});
  
  @override
  State<Details> createState() => _PageState();
}

class _PageState extends State<Details> {
  late Future<List<Objectmodel>> future_response;
   @override
   void initState() {
    super.initState();
       future_response=ServiceData.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text("Detail Post View",
            style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(widget.object.image,
              width: 600,
              height: 400,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.object.name.toString(), style: TextStyle(fontSize: 20),),
                    Text(widget.object.target.toString(), style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){
                        setState(() {
                          widget.checkisPressed();
                        });
                    }, 
                    icon:Icon(widget.object.isPressed ? Icons.star:Icons.star_border, color: Colors.red,)),
                  ],
                ),
              ),
              Text(widget.object.description.toString(), style: TextStyle(fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    setState(() {
                      widget.deleteObject();
                    });
                  },
                  style:  ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)), child: const Text("Elimina",style: TextStyle(color: Colors.white),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}