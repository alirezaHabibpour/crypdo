import 'package:crypdo/src/commons/base/BaseBloc.dart';
import 'package:crypdo/src/features/transfer/transfer_entities.dart';
import 'package:crypdo/src/features/transfer/transfer_repository.dart';
import 'package:crypdo/src/features/user/user_repository.dart';



class  TransferBloc extends BaseBloc<TransferEvent,TransferStatus> {
  final TransferRepository repository;
  final UserRepository userRepository;

  TransferBloc(this.repository,this.userRepository)
      : super(TransferStatus(fail: null ,progress: false));

  @override
  Stream<TransferStatus> mapEventToState(TransferEvent event) async* {
    yield TransferStatus(fail: null,progress:true,isTransferSuccess: null);
    event.request.srcMobileNumber=userRepository.getUserPhoneNumber();
    var result =  await repository.confirmTransfer(event.request);
    TransferStatus? status;
    result.fold((l) => {status = TransferStatus(fail: l ,progress: false, isTransferSuccess:false )},
            (r) => {status = TransferStatus(fail: null ,progress: false, isTransferSuccess:true )});
    yield status!;
  }





}
