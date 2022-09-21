import 'package:crypdo/src/commons/base/BaseBloc.dart';
import 'package:crypdo/src/features/user/user_repository.dart';

import 'currency__entities.dart';
import 'currency_repository.dart';

class CurrencyBloc extends BaseBloc<CurrencyEvent,CurrencyStatus> {
final CurrencyRepository repository;
final UserRepository userRepository;

CurrencyBloc(this.repository, this.userRepository)
: super(CurrencyStatus(fail: null ,progress: true));

@override
Stream<CurrencyStatus> mapEventToState(CurrencyEvent event) async* {
  if(event is CurrencyDataEvent){
    yield CurrencyStatus(fail: null,progress: true, currencyData:null);
    yield await _mapCurrencyEventToStatus(event);
  }
}

Future<CurrencyStatus> _mapCurrencyEventToStatus(CurrencyEvent event) async{
   var result = await repository.getCurrencyData(userRepository.getUserPhoneNumber());

  CurrencyStatus? status;

  result.fold((l) => {status = CurrencyStatus(fail: l ,progress: false, currencyData:null )},
          (r) => {status = CurrencyStatus(fail: null ,progress: false, currencyData: r )});
  return status!;
}



}
