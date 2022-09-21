import 'package:crypdo/src/commons/base/BaseBloc.dart';

import 'home_entities.dart';
import 'home_repository.dart';

class  HomeBloc extends BaseBloc<HomeEvent,HomeStatus> {
  final HomeRepository repository;

  HomeBloc(this.repository)
      : super(HomeStatus(fail: null ,progress: true));

  @override
  Stream<HomeStatus> mapEventToState(HomeEvent event) async* {
    if(event is GetHomeDataEvent){
    yield HomeStatus(fail: null,progress: true, homeData:null);
    yield await _mapCurrencyEventToStatus(event);
    }
  }

  Future<HomeStatus> _mapCurrencyEventToStatus(GetHomeDataEvent event) async{
    var result = await repository.getHomeData();

    HomeStatus? status;

    result.fold((l) => {status = HomeStatus(fail: l ,progress: false, homeData: null )},
            (r) => {status = HomeStatus(fail: null ,progress: false, homeData: r )});
    return status!;
  }



}
