part of 'expense_form_bloc.dart';

@immutable
sealed class ExpenseFormEvent extends Equatable{
  const ExpenseFormEvent();

  List<Object?>get props => [];

}

final class ExpenseTitleChanged extends ExpenseFormEvent{
  const ExpenseTitleChanged(this.title);
  final String title;

  List<Object?>get props => [title];
}

final class ExpenseAmountChanged extends ExpenseFormEvent{

  const ExpenseAmountChanged(this.amount);
  final String amount;

  List<Object?>get props => [amount];

}

final class ExpenseDateChanged extends ExpenseFormEvent{

  const ExpenseDateChanged(this.date);
  final DateTime date;

  List<Object?>get props => [date];

}

final class ExpenseCategoryChanged extends ExpenseFormEvent{

  const ExpenseCategoryChanged(this.category);
  final Category category;

  List<Object?>get props => [category];

}

final class ExpenseSubmitted extends ExpenseFormEvent{
  const ExpenseSubmitted();
}