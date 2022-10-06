import 'package:flutter/material.dart';
import 'package:re_state_management_shiop/screens/UserProductScreen.dart';
import 'package:re_state_management_shiop/screens/order_screen.dart';
import 'package:re_state_management_shiop/screens/product_overview_screen.dart';
import 'package:re_state_management_shiop/widgets/user_product.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Hello friend'), automaticallyImplyLeading: false,),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.pushNamed(context, ProductOverviewScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Order'),
            onTap: () {
              Navigator.pushNamed(context, OrderScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('Product manager'),
            onTap: () {
              Navigator.pushNamed(context, UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
