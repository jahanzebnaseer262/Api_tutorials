import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiTutorials extends StatefulWidget {
  const ApiTutorials({super.key});

  @override
  State<ApiTutorials> createState() => _ApiTutorialsState();
}

class _ApiTutorialsState extends State<ApiTutorials> {

  List<Photos> photoList= [];
  Future<List<Photos>> getApi() async {
final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
var data= jsonDecode(response.body.toString());
print(data);
if(response.statusCode==200){
  for(Map i in data){
    Photos photos=Photos(title: i['title'], url: i['url'], id: i['id']);
    photoList.add(photos);
  }return photoList;
}
else{
  return photoList;
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
                    itemCount: photoList.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text(photoList[index].id.toString()),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(photoList[index].url.toString()),
            ),
                          subtitle: Text(photoList[index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
class Photos{
  String title,url;
  int id;
  Photos({required this.title,required this.url, required this.id});
}