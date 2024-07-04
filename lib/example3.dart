import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/userModel.dart';
class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  List<UserModel> userList=[];
  Future<List<UserModel>> getApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
   var data= jsonDecode(response.body);
    if(response.statusCode==200){
for (Map i in data){
  userList.add(UserModel.fromJson(i));
}return userList;
   }else{
      return userList;
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
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else{
                    return ListView.builder(
                      itemCount: userList.length,
                        itemBuilder: (context, index){
                     return Card(
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               ReUsable(title: 'Name',
                                   value: snapshot.data![index].name.toString()),
                                   ReUsable(title: 'username',
                                       value: snapshot.data![index].username.toString()),]
                           ),
                               Column(
                                 children: [
                                   ReUsable(title: 'Adress',
                                       value: snapshot.data![index].address!.street.toString()),
                               ReUsable(title: 'Latitude',
                                   value: snapshot.data![index].address!.geo!.lat.toString()),
                                 ],
                               )
                             ],
                       ),
                     );
                        });}
                  }) )
        ],
      ),
    );
  }
}
class ReUsable extends StatelessWidget {
  String title,value;
  ReUsable({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
        
      ],
    );
  }
}

