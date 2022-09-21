import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:crypdo/src/commons/base/BaseEvent.dart';
import 'package:crypdo/src/commons/base/BaseStatus.dart';
import 'package:crypdo/src/commons/exceptions/Failure.dart';
part 'contact_entities.g.dart';

@JsonSerializable()
class ContactDto{
String? name;
String? family;
int? mobileNumber;
int? address;


ContactDto({required this.name,required this.family,required this.mobileNumber , required this.address });

factory ContactDto.fromJson(Map<String, dynamic> json) => _$ContactDtoFromJson(json);
Map<String, dynamic> toJson() => _$ContactDtoToJson(this);


}

class ContactsEvent extends BaseEvent{}

class GetContactsEvent extends ContactsEvent{}

class ContactSelectStatus extends BaseStatus{
  List<ContactDto>? contacts;
  ContactSelectStatus({Failure? fail, bool? progress,this.contacts}) : super(failure: fail, progress: progress);
}
