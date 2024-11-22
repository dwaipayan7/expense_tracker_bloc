import 'package:expense_tracker_bloc/features/data/local_data_storage.dart';
import 'package:expense_tracker_bloc/features/models/expense.dart';

class ExpenseRepository{
  final LocalDataStorage _storage;

  ExpenseRepository({required LocalDataStorage storage}) : _storage = storage;

  // final LocalDataStorage _storage;

  Future<void> createExpense(Expense expense) => _storage.saveExpense(expense);

  Future<void> deleteExpense(String id) => _storage.deleteExpense(id);

  Stream<List<Expense?>> getAllExpenses() => _storage.getExpense();

}