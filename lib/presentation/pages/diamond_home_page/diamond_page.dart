import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/filters.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_state.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_state.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filters_bloc.dart';
import 'package:yourdiamonds/presentation/pages/cart_page/cart_page.dart';
import 'package:yourdiamonds/presentation/pages/diamond_detail_page/diamond_detail_page.dart';
import 'package:yourdiamonds/presentation/pages/results_diamond_page/results_diamond_page.dart';

class DiamondsPage extends StatelessWidget {
  const DiamondsPage({Key? key}) : super(key: key);

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
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      ).then((value) {
                        bloc.add(OnCart());
                      });
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
              BlocBuilder<FiltersBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FiltersLoaded) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select Filter Type:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton(
                                // Initial Value
                                value: state.result?.type,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: [
                                  'Select Type',
                                  'Carat',
                                  'Lab',
                                  'Shape',
                                  'Clarity',
                                  'Color'
                                ].map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  FiltersEntity entity = FiltersEntity(
                                      type: newValue,
                                      carat: state.result?.carat,
                                      lab: state.result?.lab,
                                      shape: state.result?.shape,
                                      color: state.result?.color,
                                      clarity: state.result?.clarity);
                                  context.read<FiltersBloc>().add(
                                        OnUpdateFilters(
                                          entity,
                                        ),
                                      );
                                },
                              ),
                            ],
                          ),
                          if (state.result?.type == 'Carat')
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Carat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        height: 2.4,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Wrap(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('From:'),
                                          DropdownButton(
                                            // Initial Value
                                            value: state.result?.carat?.first,

                                            // Down Arrow Icon
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),

                                            // Array list of items
                                            items: state.result?.carat
                                                ?.map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              state.result?.carat?.removeWhere(
                                                  (element) =>
                                                      element == newValue);
                                              state.result?.carat
                                                  ?.insert(0, newValue);
                                              context.read<FiltersBloc>().add(
                                                    OnUpdateFilters(
                                                      state.result ??
                                                          const FiltersEntity(),
                                                    ),
                                                  );
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('To:'),
                                          DropdownButton(
                                            // Initial Value
                                            value: state.result?.carat?.last,

                                            // Down Arrow Icon
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),

                                            // Array list of items
                                            items: state.result?.carat
                                                ?.map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              state.result?.carat?.removeWhere(
                                                  (element) =>
                                                      element == newValue);
                                              state.result?.carat?.insert(
                                                  ((state.result?.carat
                                                          ?.length) ??
                                                      0 - 1),
                                                  newValue);
                                              context.read<FiltersBloc>().add(
                                                    OnUpdateFilters(
                                                      state.result ??
                                                          const FiltersEntity(),
                                                    ),
                                                  );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          if (state.result?.type == 'Lab')
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Lab',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton(
                                        // Initial Value
                                        value: state.result?.lab?.first,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items: state.result?.lab?.map((items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items?.name ?? ''),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          state.result?.lab?.removeWhere(
                                              (element) => element == newValue);
                                          state.result?.lab
                                              ?.insert(0, newValue);
                                          context.read<FiltersBloc>().add(
                                                OnUpdateFilters(
                                                  state.result ??
                                                      const FiltersEntity(),
                                                ),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          if (state.result?.type == 'Shape')
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Shape',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DropdownButton(
                                          // Initial Value
                                          value: state.result?.shape?.first,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items:
                                              state.result?.shape?.map((items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items?.name ?? ''),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            state.result?.shape?.removeWhere(
                                                (element) =>
                                                    element == newValue);
                                            state.result?.shape
                                                ?.insert(0, newValue);
                                            context.read<FiltersBloc>().add(
                                                  OnUpdateFilters(
                                                    state.result ??
                                                        const FiltersEntity(),
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          if (state.result?.type == 'Color')
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Color',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DropdownButton(
                                          // Initial Value
                                          value: state.result?.color?.first,

                                          // Down Arrow Icon
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),

                                          // Array list of items
                                          items:
                                              state.result?.color?.map((items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items.toString()),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            state.result?.color?.removeWhere(
                                                (element) =>
                                                    element == newValue);
                                            state.result?.color
                                                ?.insert(0, newValue);
                                            context.read<FiltersBloc>().add(
                                                  OnUpdateFilters(
                                                    state.result ??
                                                        const FiltersEntity(),
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          if (state.result?.type == 'Clarity')
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Clarity',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton(
                                        // Initial Value
                                        value: state.result?.clarity?.first,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),

                                        // Array list of items
                                        items:
                                            state.result?.clarity?.map((items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items?.name ?? ''),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          state.result?.clarity?.removeWhere(
                                              (element) => element == newValue);
                                          state.result?.clarity
                                              ?.insert(0, newValue);
                                          context.read()<FiltersBloc>().add(
                                                OnUpdateFilters(
                                                  state.result ??
                                                      const FiltersEntity(),
                                                ),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 32.0),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.cyanAccent),
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiamondResultsPage(
                                      filtersEntity: FiltersEntity(carat: [
                                        state.result?.carat?.first,
                                        state.result?.carat?.last
                                      ], lab: [
                                        state.result?.lab?.first
                                      ], shape: [
                                        state.result?.shape?.first
                                      ], color: [
                                        state.result?.color?.first
                                      ], clarity: [
                                        state.result?.clarity?.first
                                      ], type: state.result?.type),
                                    ),
                                  ),
                                ).then(
                                  (value) {
                                    bloc.add(OnCart());
                                  },
                                );
                              },
                              child: const Text('Search Results')),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              BlocBuilder<DataSetBloc, DataSetState>(
                builder: (context, state) {
                  if (state is DataSetLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is DataSetLoaded) {
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
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiamondDetailPage(
                                      diamond: state.result[index] ??
                                          DiamondEntity(),
                                    ),
                                  ),
                                ).then((value) {
                                  bloc.add(OnCart());
                                });
                              },
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    );
                  }
                  if (state is DataSetLoadFailure) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Container();
                },
              )
            ],
          )),
    );
  }
}
