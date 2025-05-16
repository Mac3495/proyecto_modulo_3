// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      password: json['password'] as String,
      rol: json['rol'] as String,
      officeId: json['officeId'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'password': instance.password,
      'rol': instance.rol,
      'officeId': instance.officeId,
    };
