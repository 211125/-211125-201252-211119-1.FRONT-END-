import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/createtransaction.dart';

import '../../../domain/usecases/getAllTransaction_usercase.dart';


part 'getAlltransactionEvent.dart';
part 'getAlltransactionEstados.dart';
class GetAllTransactionsBloc extends Bloc<GetallTransactionsEvent, GetalltransactionState> {
  final GetAllTransactionsUseCase? getAllTransactionsUseCase;

  GetAllTransactionsBloc({required this.getAllTransactionsUseCase}) : super(GetalltransactionInitialState()) {
    on<FetchGetallTransactionsBloceEvent>((event, emit) async {
      emit(GetalltransactionLoadingState());
      try {
        List<createtransactionModel> balances = await getAllTransactionsUseCase!.execute(event.accountId);
        emit(GetalltransactionLoadedState(balances));
      } catch (e) {
        emit(GetalltransactionErrorState(e.toString()));
      }
    });
  }
}