import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/injection_container.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_event.dart';
import 'package:yourdiamonds/presentation/bloc/diamond_bloc/diamond_state.dart';
import 'package:yourdiamonds/presentation/pages/cart_page/cart_page.dart';

class DiamondDetailPage extends StatelessWidget {
  final DiamondEntity diamond;
  DiamondDetailPage({required this.diamond, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text(
          'Diamonds Detail',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
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
          }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32.0),
              BlocProvider(
                  create: (context) =>
                      locator<DiamondBloc>()..add(GetDiamond(diamond:  diamond)),
                  child: BlocBuilder<DiamondBloc, DiamondState>(
                    builder: (context, state) {
                      if (state is DiamondLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is DiamondLoaded) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            const Align(
                              child: Icon(
                                Icons.diamond,
                                size: 64,
                                color: Colors.cyanAccent,
                              ),
                            ),
                            if (state.result?.qty != null)
                              Text('Qty: ${state.result.qty}'),
                            if (state.result.lotId != null)
                              Text('LotId: ${state.result.lotId}'),
                            if (state.result.size != null)
                              Text('Size: ${state.result.size}'),
                            if (state.result.carat != null)
                              Text('Carat: ${state.result.carat}'),
                            if (state.result.lab?.name != null)
                              Text('Lab: ${state.result.lab?.name}'),
                            if (state.result.shape?.name != null)
                              Text('Shape: ${state.result.shape?.name}'),
                            if (state.result.color != null)
                              Text('Color: ${state.result.color}'),
                            if (state.result.clarity != null)
                              Text('Clarity: ${state.result.clarity?.name}'),
                            if (state.result.cut != null)
                              Text('Cut: ${state.result.cut?.name}'),
                            if (state.result.polish != null)
                              Text('Polish: ${state.result.polish?.name}'),
                            if (state.result.symmetry != null)
                              Text('Symmetry: ${state.result.symmetry?.name}'),
                            if (state.result.fluorescence != null)
                              Text(
                                  'Fluorescence: ${state.result.fluorescence?.name}'),
                            if (state.result.discount != null)
                              Text('Discount: ${state.result.discount}'),
                            if (state.result.perCaratRate != null)
                              Text(
                                  'PerCaratRate: ${state.result.perCaratRate}'),
                            if (state.result.finalAmount != null)
                              Text('FinalAmount: ${state.result.finalAmount}'),
                            if (state.result.keyToSymbol != null)
                              Text(
                                  'Key To Symbol: ${state.result.keyToSymbol}'),
                            if (state.result.labComment != null)
                              Text('Lab Comment: ${state.result.labComment}')
                          ],
                        );
                      }
                      if (state is DiamondLoadFailure) {
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
                  )),
              const Spacer(),
              BlocProvider(
                create: (_) => locator<CartBloc>()..add(const OnCart()),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      return ElevatedButton(
                          onPressed: () {
                            final list = state.result;
                            list.add(diamond);
                            bloc.add(OnSaveCart(diamonds: list));
                          }, child: const Text('ADD TO CART'));
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
