import 'package:expense_tracker_bloc/features/data/local_data_storage.dart';
import 'package:expense_tracker_bloc/features/repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main()async {

  WidgetsFlutterBinding.ensureInitialized();

  final storage = LocalDataStorage(preferences: await SharedPreferences.getInstance());

  final expenseRepository = ExpenseRepository(storage: storage);

  runApp(MyApp(expenseRepository: expenseRepository));
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository;
  const MyApp({super.key, required this.expenseRepository});



  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: expenseRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Text("dwaipayan"),
      ),
    );
  }
}

