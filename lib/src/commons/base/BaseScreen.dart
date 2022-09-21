import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypdo/src/commons/base/BaseBloc.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:crypdo/src/commons/utils/widgets/CustomLoading.dart';

GetIt getIt = GetIt.I;

abstract class BaseBlocScreen<V extends StatefulWidget,E, S extends BaseStatus, B extends BaseBloc<E, S>,
St extends BaseState<E, S, B,V>> extends StatefulWidget {

  St createBaseState();

  @override
  State<StatefulWidget> createState() {
    return createBaseState();
  }


  const BaseBlocScreen({Key? key}) : super(key: key);
}

abstract class BaseState<E, S extends BaseStatus, B extends BaseBloc<E, S>, V extends StatefulWidget>
    extends State<V> {

  BaseState({this.customProgress,this.customError});

  final bool? customError;

  final bool? customProgress;


  B _bloc=getIt.get();
  B blocProvider() {
    return _bloc;
  }

  Widget buildChildWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return blocProvider();
    }, child: BlocBuilder<B, S>(builder: (context, baseScreenState) {
      if (this.customProgress!=true &&baseScreenState.progress == true) {
        return CustomLoading();
      }

      if (baseScreenState.progress == false) {
        return Container(
          child: buildChildWidget(),
        );
      }
      if (this.customError != true &&baseScreenState.failure != null) {
        if (baseScreenState.getFailure() == NetworkConnection)
          return Container(child: Text('عدم دسترسی به اینترنت'));
      }
      return buildChildWidget();
    }));
  }
}