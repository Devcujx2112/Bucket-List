import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listbucket/Product.dart';

class AddProductSrceen extends StatefulWidget {
  void Function({required Product itemProduct}) AddProduct;

  AddProductSrceen({super.key, required this.AddProduct});

  @override
  State<AddProductSrceen> createState() => _AddProductSrceenState();
}

class _AddProductSrceenState extends State<AddProductSrceen> {
  TextEditingController txt_items = TextEditingController();
  TextEditingController txt_name = TextEditingController();
  TextEditingController txt_image = TextEditingController();

  void InsertProduct() {
    if (txt_items.text.isNotEmpty && txt_name.text.isNotEmpty && txt_image.text.isNotEmpty) {
      widget.AddProduct(itemProduct: Product(txt_items.text, txt_name.text,txt_image.text));
    } else {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Vui long dien het'),
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
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Thêm sản phẩm"),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Item', icon: Icon(Icons.verified_user)),
              controller: txt_items,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Name', icon: Icon(Icons.verified_user)),
                  controller: txt_name,
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Image', icon: Icon(Icons.verified_user)),
                controller: txt_image,
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: InsertProduct, child: Text('Insert')),
            ),
          ],
        ));
  }
}
