import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/addBalanceModel.dart';
import '../../../data/models/createtransaction.dart';
import '../../../domain/usecases/createtransaction_usecase.dart';
import '../../../domain/usecases/poshaddBalance_usecase.dart';

part 'poshaddBalanceEvent.dart';
part 'poshaddBalanceEstados.dart';

class  AddBalanceBloc extends Bloc<addBalanceEvent, createaddBalanceState> {

    final PoshaddBalanceUseCase? poshaddBalanceUseCase;

    AddBalanceBloc({required this.poshaddBalanceUseCase}) : super(createaddBalanceInitial()) {
    on<addBalanceEvent>((event, emit) async {
      if (event is AddBalancePressed) {
        try {
          emit(createaddBalanceLoading());
          AddBalanceModel transaction = AddBalanceModel(
            userId: event.userId,
            balance: event.balance,

          );
          await poshaddBalanceUseCase!.execute(transaction);
        } catch (e) {
          emit(createaddBalanceFailure(e.toString()));
        }
      }
    });
  }
}
