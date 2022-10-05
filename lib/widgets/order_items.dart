import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/order_provider.dart';

class OrderItem extends StatefulWidget {
  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    Order order = Provider.of<Order>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
            title: Text('${order.amount}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            subtitle: Text(DateFormat('dd MM yyyy').format(order.dateTime)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(12),
              height: min(order.products.length * 20.0 + 100, 180),
              child: ListView(
                children: order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text('${prod.quantity}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('x',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('\$${prod.price}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('=   \$${prod.total()}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
