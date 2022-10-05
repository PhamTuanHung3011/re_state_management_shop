import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/order_provider.dart';
import 'package:re_state_management_shiop/widgets/app_drawer.dart';

import '../widgets/order_items.dart';
class OrderScreen extends StatelessWidget {
  static const routeName = '/order_screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orders.items.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: orders.items.toList()[i],
          child: OrderItem(),
          ) ),
    );
  }
}
