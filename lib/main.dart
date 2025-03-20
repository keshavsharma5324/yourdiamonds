import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yourdiamonds/domain/entities/cart.dart';
import 'package:yourdiamonds/domain/entities/clarity.dart';
import 'package:yourdiamonds/domain/entities/cut.dart';
import 'package:yourdiamonds/domain/entities/diamond.dart';
import 'package:yourdiamonds/domain/entities/fluorescence.dart';
import 'package:yourdiamonds/domain/entities/lab.dart';
import 'package:yourdiamonds/domain/entities/shape.dart';
import 'package:yourdiamonds/injection_container.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_bloc.dart';
import 'package:yourdiamonds/presentation/bloc/dataset_bloc/dataset_event.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:yourdiamonds/presentation/bloc/filter_bloc/filters_bloc.dart';
import 'package:yourdiamonds/presentation/pages/diamond_home_page/diamond_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory tempDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(tempDir.path)
    ..registerAdapter(CartEntityAdapter())
    ..registerAdapter(DiamondEntityAdapter())
    ..registerAdapter(LabAdapter())
    ..registerAdapter(CutAdapter())
    ..registerAdapter(ShapeAdapter())
    ..registerAdapter(FluorescenceAdapter())
    ..registerAdapter(ClarityAdapter());
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<DataSetBloc>()..add(const OnDataSet()),
        ),
        BlocProvider(
          create: (_) => locator<FiltersBloc>()..add(const OnFilter()),
        ),
        BlocProvider(
          create: (_) => locator<CartBloc>()..add(const OnCart()),
        ),
      ],
      child: const MaterialApp(
        home: DiamondsPage(),
      ),
    );
  }
}
