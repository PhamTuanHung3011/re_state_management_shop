import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/cart.dart';
import 'package:re_state_management_shiop/screens/cart_screen.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.deepOrangeAccent),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreens.routerName: (context) => ProductDetailScreens(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
