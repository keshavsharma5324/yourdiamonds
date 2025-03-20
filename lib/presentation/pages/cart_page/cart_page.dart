import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourdiamonds/domain/entities/cart.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/injection_container.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:yourdiamonds/presentation/pages/diamond_detail_page/diamond_detail_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'Diamonds',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) => locator<CartBloc>()
            ..add(
              const OnCart(),
            ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CartLoaded) {
                final cart = CartEntity(diamonds: state.result);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text('Total Carat: ${cart.totalCarat()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text('Total Price: ${cart.totalPrice()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text('Average Price: ${cart.avgPrice()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          Text('Average Discount: ${cart.avgDiscount()}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cart Items',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.result.length,
                        key: const Key('weather_data'),
                        itemBuilder: (BuildContext context, int index) {
                          if (state.result[index] != null) {
                            return ListTile(
                              leading: const Icon(
                                Icons.diamond_outlined,
                                size: 24,
                                color: Colors.tealAccent,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Carat ${state.result[index]?.carat ?? ''}',
                                  ),
                                  Text(
                                    'Discount: ${state.result[index]?.discount ?? ''} INR',
                                  )
                                ],
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    'Price ${state.result[index]?.finalAmount ?? ''}',
                                  ),
                                  InkWell(
                                      onTap: () {
                                        state.result
                                            .remove(state.result[index]);
                                        context.read<CartBloc>().add(
                                            OnSaveCart(diamonds: state.result));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          )))
                                ],
                              ),
                              title: Text(
                                state.result[index]?.clarity?.name ?? '',
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiamondDetailPage(
                                      diamond: state.result[index] ??
                                          DiamondEntity(),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
              if (state is CartLoadFailure) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
