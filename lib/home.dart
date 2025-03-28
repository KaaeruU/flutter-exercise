
import 'package:exam/details.dart';
import 'package:exam/object_model.dart';
import 'package:exam/service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {

  late Future<List<Objectmodel>> future_response;
   @override
   void initState() {
    super.initState();
       future_response=ServiceData.getData();
  }
  void checkisPressed(Objectmodel obj){
      setState(() {
        obj.isPressed=!obj.isPressed;
      });
  }

  void deleteObject (List<Objectmodel> arr, index){
      setState(() {
        arr.removeAt(index);
      });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Objectmodel>>(
      future: future_response,
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasData){
          final data=snapshot.data!;
          if(data.isEmpty){
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.dangerous, size: 250,),
                  Text("No Data Found")
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 20,
                  color: Colors.grey,
                );
              },
              itemCount: data.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return   Details(object:data[index], checkisPressed: () => checkisPressed(data[index]), deleteObject: () => deleteObject(data, index),);
                    }));
                  },
                  leading: Image.network(data[index].image),
                  title: Text(data[index].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(data[index].isPressed? Icons.star : Icons.star_border, color: Colors.red),
                      const Padding(padding: EdgeInsets.all(8.0),),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else{
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}