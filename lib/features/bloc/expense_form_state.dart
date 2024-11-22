part of 'expense_form_bloc.dart';


enum ExpenseFormStatus {initial, loading, success, failure}

@immutable
sealed class ExpenseFormState extends Equatable{}

final class ExpenseFormInitial extends ExpenseFormState {
  @override
  List<Object?> get props => [];
}
