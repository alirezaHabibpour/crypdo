
import 'package:dartz/dartz.dart';
import 'package:crypdo/src/commons/base/BaseRepository.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
import 'package:crypdo/src/features/transfer/transfer_network.dart';
import 'package:crypdo/src/features/transfer/transfer_entities.dart';

abstract class TransferRepository {
  Future<Either<Failure, bool>> confirmTransfer(TransferRequestModel request);

}

class TransferRepositoryImp extends BaseRepository implements TransferRepository {
  final TransferNetwork network;

  TransferRepositoryImp(this.network);

  @override
  Future<Either<Failure, bool>> confirmTransfer(TransferRequestModel request) async {
    return await requestRemote(
            () => network.requestTransfer(request),
        _transferConfirmResponse,
        false);
  }


 bool _transferConfirmResponse( String s){
    return true;
  }




}


