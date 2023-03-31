import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_shop_app/Add_customer_api/model/customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  Future<List<Customer>> fetchCustomer() async {
    const baseUrl = "https://marketafrique.com/wp-json/v2";
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/featured_categories'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
      );
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to load todos');
      }
      final List customers = json.decode(response.body);
      return customers.map((customer) => Customer.fromMap(customer)).toList();
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<Customer>>(
        future: fetchCustomer(),
        builder: (context, snapshot) {
          final customers = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (customers == null) {
            return const Center(child: Text('No user found'));
          }

          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(customer.cat_id!.toString()),
                ),
                title: Text(customer.count!.toString()),
                subtitle: Text(customer.cat_name!),

                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => DetailPage(todo: customer),
                //     ),
                //   );
                // },
              );
            },
          );
        },
      ),
    );
  }
}
