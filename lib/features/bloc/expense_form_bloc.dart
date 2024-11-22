import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker_bloc/features/models/expense.dart';
import 'package:meta/meta.dart';

part 'expense_form_event.dart';
part 'expense_form_state.dart';

class ExpenseFormBloc extends Bloc<ExpenseFormEvent, ExpenseFormState> {
  ExpenseFormBloc() : super(ExpenseFormInitial()) {
    on<ExpenseFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
