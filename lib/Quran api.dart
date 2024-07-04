import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class QuranApi extends StatefulWidget {
  const QuranApi({super.key});

  @override
  State<QuranApi> createState() => _QuranApiState();
}

class _QuranApiState extends State<QuranApi> {
  var data;
  Future<void> getApi() async{
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/quran/quran-uthmani'));
    if(response.statusCode==200){
       data = jsonDecode(response.body);

    }else{
      
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
                builder: (context, snapshot){
                  return  ListView.builder(
                    itemCount: data.length,
                      itemBuilder:(context, index){
                        return Card(
                          color: Colors.teal,
                         child: Column(
                           children: [
                             Text(data[index]['name']!.toString())
                           ],
                         ),
                        );
                      } );
                }),
          ),
        ],
      ),
    );
  }
}
// class Quran{
//   String Surahs,number; int name;
//   Quran({required this.Surahs,required this.name,required this.number}){
//   }
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class QuranApi extends StatefulWidget {
//   const QuranApi({super.key});
//
//   @override
//   State<QuranApi> createState() => _QuranApiState();
// }
//
// class _QuranApiState extends State<QuranApi> {
//   List<Quran> postList = [];
//
//   Future<List<Quran>> getApi() async {
//     final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/quran/quran-uthmani'));
//     var data = jsonDecode(response.body);
//     print(data);
//
//     if (response.statusCode == 200) {
//       var surahs = data['data']['surahs']['text']as List;
//       postList = surahs.map((surah) => Quran.fromJson(surah)).toList();
//       return postList;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quran API'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<List<Quran>>(
//               future: getApi(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('No data available'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: postList.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         color: Colors.teal,
//                         child: ListTile(
//                           title: Text(postList[index].name),
//                           subtitle: Text('Ayahs: ${postList[index].ayahs}'),
//
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Quran {
//   final String name,ayahs;
//   final int number;
//
//   Quran({required this.name, required this.number,required this.ayahs});
//
//   factory Quran.fromJson(Map<String, dynamic> json) {
//     return Quran(
//       name: json['englishName'],
//       number: json['number'],
//       ayahs: json['ayahs']
//     );
//   }
// }

