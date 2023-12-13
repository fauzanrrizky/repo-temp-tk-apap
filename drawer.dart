import 'package:flutter/material.dart';
import 'package:frontend_mobile/auth/login.dart';
import 'package:frontend_mobile/auth/register.dart';
import 'package:frontend_mobile/catalog/all_product.dart';
import 'package:frontend_mobile/models/order_response.dart';
import 'package:frontend_mobile/order/order_history_page.dart';
import 'package:frontend_mobile/service/catalog_service.dart';
import 'package:frontend_mobile/service/order_service_2.dart';

import '../main.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          ListTile(
            title: const Text("Home Page"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'APAPEDIA',
                        )),
              );
            },
          ),
          ListTile(
            title: const Text("Catalog Page"),
            onTap: () async {
              // Buat instance dari CatalogService dengan URL yang sesuai
              CatalogService catalogService =
                  CatalogService(baseUrl: 'http://localhost:8081');

              // Gunakan instance CatalogService saat memanggil Navigator.pushReplacement
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CatalogListWidget(catalogService: catalogService)),
              );
            },
          ),
          ListTile(
            title: const Text("Login Page"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Order History Page"),
            onTap: () async {
              // Buat instance dari CatalogService dengan URL yang sesuai
              OrderService_2 orderService =
                  OrderService_2(baseUrl: 'http://localhost:8080');

              // Gunakan instance CatalogService saat memanggil Navigator.pushReplacement
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => 
                        OrderItemList(orderService: orderService)),
              );
            },
          ),
        ],
      ),
    ));
  }
}
