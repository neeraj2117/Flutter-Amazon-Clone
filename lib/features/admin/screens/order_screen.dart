import 'package:amazon_clone_flutter/common/widgets/loader.dart';
import 'package:amazon_clone_flutter/features/account/widgets/single_product.dart';
import 'package:amazon_clone_flutter/features/admin/services/admin_services.dart';
import 'package:amazon_clone_flutter/features/order_details/screens/order_details.dart';
import 'package:amazon_clone_flutter/models/order.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllOrders();
  }

  void fetchAllOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    OrderDetailsScreen.routeName,
                    arguments: orderData,
                  );
                },
                child: SizedBox(
                  height: 140,
                  child: SingleProduct(
                    image: orderData.products[0].images[0],
                  ),
                ),
              );
            },
          );
  }
}
