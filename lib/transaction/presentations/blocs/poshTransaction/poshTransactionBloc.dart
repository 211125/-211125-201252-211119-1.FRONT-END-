import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/createtransaction.dart';
import '../../../domain/usecases/createtransaction_usecase.dart';

part 'poshTransactionEvent.dart';
part 'poshTransactionestados.dart';

class  CreatetransactionBloc extends Bloc<RegisterCoordinatorEvent, createTransactionState> {

    final CreatetransactionUseCase? createtransactionUseCase;

  CreatetransactionBloc({required this.createtransactionUseCase}) : super(createTransactionInitial()) {
    on<RegisterCoordinatorEvent>((event, emit) async {
      if (event is CreatetransactionPressed) {
        try {
          emit(createTransactionLoading());
          createtransactionModel transaction = createtransactionModel(
            date: event.date,
            type: event.type,
            amount: event.amount,
            description: event.description,
            categoriId: event.categoriId,
            accountId: event.accountId,
          );
          await createtransactionUseCase!.execute(transaction);
        } catch (e) {
          emit(createTransactionFailure(e.toString()));
        }
      }
    });
  }
}
