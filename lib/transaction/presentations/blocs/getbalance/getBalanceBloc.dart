import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/addBalanceModel.dart';
import '../../../data/models/createtransaction.dart';
import '../../../data/models/getBalance.dart';
import '../../../domain/usecases/createtransaction_usecase.dart';
import '../../../domain/usecases/getaccount_usercase.dart';
import '../../../domain/usecases/poshaddBalance_usecase.dart';

part 'getBalanceEvent.dart';
part 'getBalanceEstados.dart';
class GetBalanceBloc extends Bloc<GetBalanceEvent, GetBalanceState> {
  final GetaccountUseCase? getaccountUseCase;

  GetBalanceBloc({required this.getaccountUseCase}) : super(GetBalanceInitialState()) {
    on<FetchBalanceEvent>((event, emit) async {
      emit(GetBalanceLoadingState());
      try {
        List<GetBalanceModel> balances = await getaccountUseCase!.execute(event.id, event.userId);
        emit(GetBalanceLoadedState(balances));
      } catch (e) {
        emit(GetBalanceErrorState(e.toString()));
      }
    });
  }
}