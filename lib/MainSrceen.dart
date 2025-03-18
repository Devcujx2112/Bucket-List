import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listbucket/AddProductSrceen.dart';
import 'ViewModel.dart';
import 'Product.dart';

class Mainsrceen extends StatefulWidget {
  const Mainsrceen({super.key});

  @override
  State<Mainsrceen> createState() => _MainsrceenState();
}

class _MainsrceenState extends State<Mainsrceen> {
  final ViewModel _viewModel = ViewModel();
  List<dynamic> listProduct = [];
  static const String urlDataProduct = "https://flutter-api-2f232-default-rtdb.firebaseio.com/listproduct.json";

  Future<void> InsertProduct({required Product itemProduct}) async {
    try {
      Response response =
          await Dio().post(urlDataProduct, data: itemProduct.toJson());
      listProduct.add(response.data);
      setState(() {});
    } catch (e) {
      print('Errors $e');
    }
  }

  Future<void> GetData() async {
    listProduct = (await Dio().get(urlDataProduct)) as List;
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    GetData();
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
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: AddProductSrceen(
                              AddProduct: InsertProduct,
                            ),
                          );
                        });
                  },
                  child: Text("Them san pham"))
            ],
          ),
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
