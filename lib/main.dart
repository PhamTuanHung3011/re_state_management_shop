import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/cart.dart';
import 'package:re_state_management_shiop/providers/order_provider.dart';
import 'package:re_state_management_shiop/screens/UserProductScreen.dart';
import 'package:re_state_management_shiop/screens/cart_screen.dart';
import 'package:re_state_management_shiop/screens/edit_product_screen.dart';
import 'package:re_state_management_shiop/screens/order_screen.dart';
import 'package:re_state_management_shiop/widgets/user_product.dart';
import 'providers/product_provider.dart';
import 'screens/product_detail_screens.dart';
import 'screens/product_overview_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider<Orders>(
            create: (context) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.deepOrangeAccent),
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
          ProductDetailScreens.routerName: (context) => ProductDetailScreens(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          EditProductScreen.routename: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
