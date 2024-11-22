import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/expense.dart';

class LocalDataStorage {
  final SharedPreferences _preferences;

  LocalDataStorage({required SharedPreferences preferences})
      : _preferences = preferences{
    _initialize();
  }

  static const expenseCollectionKey = 'expense_collection_key';

  final _controller = BehaviorSubject<List<Expense?>>.seeded(const[]);

  Stream<List<Expense?>> getExpense() => _controller.asBroadcastStream();

  void _initialize(){
    final expensesJson = _preferences.getString(expenseCollectionKey);

    if(expensesJson != null){
      final expenseList = List<dynamic>.from(jsonDecode(expensesJson) as List);
      final expenses = expenseList.map((expense) => Expense.fromJson(expense)).toList();
      _controller.add(expenses);

    }else{
      _controller.add([]);
    }

  }

  Future<void> saveExpense(Expense expense)async{
    final expenses = [..._controller.value];
    expenses.add(expense);
    final expenseIndex = expenses.indexWhere(
        (currentExpense) => currentExpense?.id == expense.id
    );

    _controller.add(expenses);
    await _preferences.setString(expenseCollectionKey, jsonEncode(expenses));
  }

  Future<void> deleteExpense(String id) async{
    final expenses = [..._controller.value];
    final expenseIndex =
        expenses.indexWhere((currentExpense) => currentExpense?.id == id);

    if(expenseIndex == -1){
      throw Exception('No expenses found');
    }
    else{
      expenses.removeAt(expenseIndex);
      _controller.add(expenses);
      _preferences.setString(expenseCollectionKey, jsonEncode(expenses));
    }
  }

}
