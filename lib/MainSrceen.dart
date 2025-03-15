import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainsrceen extends StatefulWidget {
  const Mainsrceen({super.key});

  @override
  State<Mainsrceen> createState() => _MainsrceenState();
}

class _MainsrceenState extends State<Mainsrceen> {
  List<dynamic> listProduct = [];

  Future<void> GetData() async {
    try {
      Response response = await Dio().get(
          "https://flutter-api-2f232-default-rtdb.firebaseio.com/listproduct.json");
      listProduct = response.data;
      setState(() {});
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Wrong URL'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bucket List'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: GetData, child: Text('Get Data')),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Them san pham"))
            ],),
          Expanded(
              child: ListView.builder(
                itemCount: listProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            listProduct[index]['image'] ?? "",
                          ),
                        ),
                        title: Text(listProduct[index]["name"] ?? []),
                        trailing: Text(listProduct[index]["item"] ?? []),
                      ));
                },
              ))
        ],
      ),
    );
  }
}
