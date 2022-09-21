
import 'package:equatable/equatable.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:flutter/widgets.dart';

abstract class BaseStatus<T> {
  const BaseStatus({this.failure,this.progress});
  final Failure? failure  ;
  final bool? progress ;

  Failure getFailure() {
    return failure!;
  }
}

