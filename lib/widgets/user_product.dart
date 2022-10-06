import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/product_provider.dart';
import 'package:re_state_management_shiop/screens/UserProductScreen.dart';
import 'package:re_state_management_shiop/screens/edit_product_screen.dart';
import 'package:re_state_management_shiop/widgets/product_items.dart';

class UserProducts extends StatefulWidget {
  final String idProduct;
  final String title;
  final String imageUrl;
  UserProducts({required this.title,required this.imageUrl, required this.idProduct});

  @override
  State<UserProducts> createState() => _UserProductsState();
}

class _UserProductsState extends State<UserProducts> {

  @override
  void initState() {
    super.initState();
    setState(() {
      Provider.of<ProductProvider>(context, listen: false).items;
    });

  }

  @override
  Widget build(BuildContext context) {

    return ListTile(
          title: Text(widget.title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pushNamed(context, EditProductScreen.routename, arguments: widget.idProduct );
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {
                  print('delete');
                  Provider.of<ProductProvider>(context, listen: false).deleteProduct(widget.idProduct);
                }, icon: Icon(Icons.delete)),
              ],
            ),
          ),
        );
  }
}
