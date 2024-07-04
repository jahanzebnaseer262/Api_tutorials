// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Models/Models.dart';
// class Apitutorial extends StatefulWidget {
//   const Apitutorial({super.key});
//
//   @override
//   State<Apitutorial> createState() => _ApitutorialState();
// }
//
// class _ApitutorialState extends State<Apitutorial> {
//   List<Models> postList=[];
//   Future<List<Models>> getpostApi()async{
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var data= jsonDecode(response.body.toString());
//     if(response.statusCode==200){
// for(Map i in data){
//   postList.add(Models.fromJson(i));
// }return postList;
//     }else{
//       return postList;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(
//                   future: getpostApi(),
//                   builder: (context,snapshot){
//                     if(!snapshot.hasData){
//               return Text('Loading');
//                     }else{
//                       return ListView.builder(
//                         itemCount: postList.length,
//                           itemBuilder: (context,index){
//                             return Card(
//                               color: Colors.teal,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(postList[index].id.toString()),
//                                   Text(postList[index].userId.toString()),
//                                   Text(postList[index].title.toString()),
//                                   Text(postList[index].body.toString()),
//                                 ],
//                               ),
//                             );
//                           });
//                     }
//                   }
//               ),
//             ) ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/Models.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Models > postList=[];
  Future< List<Models>> getApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data= jsonDecode(response.body);
    if(response.statusCode==200){
      for(Map i in data){
      postList.add(Models.fromJson(i));
      }return postList;
    }
    else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getApi(),
                builder: (context,snapshot){
                  return ListView.builder(
                    itemCount: postList.length,
                      itemBuilder: (context,index){
                      return Card(
                        color: Colors.teal,
                        child: Column(
                          children: [
                            Text(postList[index].id.toString()),
                            Text(postList[index].userId.toString()),
                            Text(postList[index].title.toString()),
                            Text(postList[index].body.toString()),
                          ],
                        ),
                      );
                      });
                }),
          )
        ],
      ),
    );
  }
}


