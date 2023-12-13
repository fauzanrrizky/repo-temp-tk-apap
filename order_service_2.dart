import 'dart:convert';
import 'package:frontend_mobile/models/order_response.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_mobile/models/catalog.dart';
import 'dart:typed_data';

class OrderService_2 {
  final String baseUrl;

  OrderService_2({required this.baseUrl});


  Future<OrderResponse> getOrderByCustomerId(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/order/$userId/customer-order'));

    if(response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return OrderResponse.fromJson(data);
    } else {
      throw Exception('Failed to load order by Customer ID');

    }
  }

  Future<Order> updateOrderStatus(Order order) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/order/change-status'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(order.toJsonForUpdate()), // Assuming you have a method toJson() in your DTO
    );

    if(response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['result'];
      return Order.fromJson(data);
    } else {
      throw Exception('Failed to update order status');

    }
  }

  

}