import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/addBalanceModel.dart';
import '../../../data/models/createtransaction.dart';
import '../../../domain/usecases/createtransaction_usecase.dart';
import '../../../domain/usecases/poshaddBalance_usecase.dart';
import '../../../domain/usecases/poshreduceBalance_usecase.dart';

part 'poshreduceBalanceEvent.dart';
part 'poshreduceBalanceEstados.dart';

class  ReduceBalanceBloc extends Bloc<reduceBalanceEvent, createreduceBalanceState> {

    final PoshreduceBalanceUseCase? poshreduceBalanceUseCase;

    ReduceBalanceBloc({required this.poshreduceBalanceUseCase}) : super(createreduceBalanceInitial()) {
    on<reduceBalanceEvent>((event, emit) async {
      if (event is reduceBalancePressed) {
        try {
          emit(createreduceBalanceLoading());
          AddBalanceModel transaction = AddBalanceModel(
            userId: event.userId,
            balance: event.balance,

          );
          await poshreduceBalanceUseCase!.execute(transaction);
        } catch (e) {
          emit(createreduceBalanceFailure(e.toString()));
        }
      }
    });
  }
}
