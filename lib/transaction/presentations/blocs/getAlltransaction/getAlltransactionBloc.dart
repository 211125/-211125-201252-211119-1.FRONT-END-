import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../publication/presentations/bloc/connectivity_service.dart';
import '../../../data/models/createtransaction.dart';

import '../../../domain/usecases/getAllTransaction_usercase.dart';


part 'getAlltransactionEvent.dart';
part 'getAlltransactionEstados.dart';
class GetAllTransactionsBloc extends Bloc<GetallTransactionsEvent, GetalltransactionState> {
  final GetAllTransactionsUseCase? getAllTransactionsUseCase;
  final ConnectivityService connectivityService;

  GetAllTransactionsBloc({required this.getAllTransactionsUseCase,required this.connectivityService}) : super(GetalltransactionInitialState()) {
    on<FetchGetallTransactionsBloceEvent>((event, emit) async {
      emit(GetalltransactionLoadingState());
      try {
        bool isConnected = connectivityService.isConnected;

        List<createtransactionModel> balances = await getAllTransactionsUseCase!.execute(event.accountId,isConnected);
        emit(GetalltransactionLoadedState(balances));
      } catch (e) {
        emit(GetalltransactionErrorState(e.toString()));
      }
    });
  }
}