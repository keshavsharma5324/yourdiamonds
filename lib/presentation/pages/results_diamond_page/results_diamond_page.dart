import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';
import 'package:yourdiamonds/injection_container.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filters_bloc.dart';
import 'package:yourdiamonds/presentation/pages/cart_page/cart_page.dart';
import 'package:yourdiamonds/presentation/pages/diamond_detail_page/diamond_detail_page.dart';

class DiamondResultsPage extends StatelessWidget {
  final FiltersEntity? filtersEntity;
  const DiamondResultsPage({super.key, this.filtersEntity});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'Diamonds',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        ).then(
                          (value) {
                            bloc.add(OnCart());
                          },
                        );
                      },
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (state is CartLoaded)
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          state.result.length >= 10
                              ? '9+'
                              : state.result.length.toString(),
                          style: TextStyle(height: 1.2, color: Colors.white),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (context) => locator<FiltersBloc>()
                ..add(
                  OnFilterResults(
                    filtersEntity ?? const FiltersEntity(),
                  ),
                ),
              child: BlocBuilder<FiltersBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FilterLoaded) {
                    return Expanded(
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
                              trailing: Text(
                                'Price ${state.result[index]?.finalAmount ?? ''}',
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
                    );
                  }
                  if (state is FilterLoadFailure) {
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
            )
          ],
        ),
      ),
    );
  }
}
