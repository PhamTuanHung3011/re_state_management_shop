import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routename = '/edit_product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  String title = '';
  double price = 0.0;
  String description = '';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idProduct = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<ProductProvider>(context).findById(idProduct);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen!'),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text(product.title),
            ),
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              label: Text(product.price.toString()),
            ),
            onChanged: (value) {
              price = double.parse( value) ;
            },
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text(product.description),
            ),
            onChanged: (value) {
              description = value;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {
              Provider.of<ProductProvider>(context, listen: false).editProduct(idProduct, title, description, price);
              print('submit');

            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
