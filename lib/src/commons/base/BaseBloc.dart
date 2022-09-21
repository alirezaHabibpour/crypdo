
import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';

abstract class BaseBloc<E ,S extends BaseStatus> extends Bloc<E,S>{
  BaseBloc(S initialState) : super(initialState);

}