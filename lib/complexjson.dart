// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class Complexjson extends StatefulWidget {
//   const Complexjson({super.key});
//
//   @override
//   State<Complexjson> createState() => _ComplexjsonState();
// }
//
// class _ComplexjsonState extends State<Complexjson> {
//   var data;
//   Future<void> getApi() async{
//     final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//   if(response.statusCode==200){
//     data=jsonDecode(response.body);
//   }else{
//
//   }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//               child: FutureBuilder(
//                   future: getApi(),
//                   builder: (context,snapshot){
//                     if(snapshot.connectionState==ConnectionState.waiting){
//                       return Text("Loading");
//                     }else{
// return ListView.builder(
//   itemCount: data.length,
//     itemBuilder: (context,index){
//       return Card(
//         color: Colors.teal,
//         child: Column(
//           children: [
//             Reusable(title: "Nmae", value: data[index]["name"].toString()),
//             Reusable(title: "Username", value: data[index]["username"].toString()),
//             Reusable(title: "City", value: data[index]["address"]["city"].toString())
//           ],
//         ),
//       );
//     });
//
//                     }
//                   }) )
//         ],
//       ),
//     );
//   }
// }
// class Reusable extends StatelessWidget {
//   String title,value;
//    Reusable({super.key,required this.title,required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//        Text(title),
//        SizedBox(height: 20,),
//        Text(value)
//       ],
//     );
//   }
// }
//
import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Quran.dart';
class Complexjson extends StatefulWidget {
  const Complexjson({super.key});

  @override
  State<Complexjson> createState() => _ComplexjsonState();
}

class _ComplexjsonState extends State<Complexjson> {
  Future<Quran> getApi() async{
final response =await http.get(Uri.parse("https://api.alquran.cloud/v1/quran/quran-uthmani"));
var data= jsonDecode(response.body);
if(response.statusCode==200){
return Quran.fromJson(data);
}else{return Quran.fromJson(data);
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child:
          FutureBuilder<Quran>(
              future: getApi(),
              builder: (context,snapshot){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
return Column(
  children: [
    Text(index.toString())
  ],
);
                    });
              })
          )
        ],
      ),
    );
  }
}

