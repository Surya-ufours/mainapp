// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BarcodeData extends DataClass implements Insertable<BarcodeData> {
  final int id;
  final String guid;
  final bool islogsheet;
  final bool ischecklist;
  final int imagecount;
  const BarcodeData(
      {required this.id,
      required this.guid,
      required this.islogsheet,
      required this.ischecklist,
      required this.imagecount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['guid'] = Variable<String>(guid);
    map['islogsheet'] = Variable<bool>(islogsheet);
    map['ischecklist'] = Variable<bool>(ischecklist);
    map['imagecount'] = Variable<int>(imagecount);
    return map;
  }

  BarcodeCompanion toCompanion(bool nullToAbsent) {
    return BarcodeCompanion(
      id: Value(id),
      guid: Value(guid),
      islogsheet: Value(islogsheet),
      ischecklist: Value(ischecklist),
      imagecount: Value(imagecount),
    );
  }

  factory BarcodeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BarcodeData(
      id: serializer.fromJson<int>(json['id']),
      guid: serializer.fromJson<String>(json['guid']),
      islogsheet: serializer.fromJson<bool>(json['islogsheet']),
      ischecklist: serializer.fromJson<bool>(json['ischecklist']),
      imagecount: serializer.fromJson<int>(json['imagecount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'guid': serializer.toJson<String>(guid),
      'islogsheet': serializer.toJson<bool>(islogsheet),
      'ischecklist': serializer.toJson<bool>(ischecklist),
      'imagecount': serializer.toJson<int>(imagecount),
    };
  }

  BarcodeData copyWith(
          {int? id,
          String? guid,
          bool? islogsheet,
          bool? ischecklist,
          int? imagecount}) =>
      BarcodeData(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        islogsheet: islogsheet ?? this.islogsheet,
        ischecklist: ischecklist ?? this.ischecklist,
        imagecount: imagecount ?? this.imagecount,
      );
  @override
  String toString() {
    return (StringBuffer('BarcodeData(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('islogsheet: $islogsheet, ')
          ..write('ischecklist: $ischecklist, ')
          ..write('imagecount: $imagecount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, guid, islogsheet, ischecklist, imagecount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BarcodeData &&
          other.id == this.id &&
          other.guid == this.guid &&
          other.islogsheet == this.islogsheet &&
          other.ischecklist == this.ischecklist &&
          other.imagecount == this.imagecount);
}

class BarcodeCompanion extends UpdateCompanion<BarcodeData> {
  final Value<int> id;
  final Value<String> guid;
  final Value<bool> islogsheet;
  final Value<bool> ischecklist;
  final Value<int> imagecount;
  const BarcodeCompanion({
    this.id = const Value.absent(),
    this.guid = const Value.absent(),
    this.islogsheet = const Value.absent(),
    this.ischecklist = const Value.absent(),
    this.imagecount = const Value.absent(),
  });
  BarcodeCompanion.insert({
    this.id = const Value.absent(),
    required String guid,
    required bool islogsheet,
    required bool ischecklist,
    required int imagecount,
  })  : guid = Value(guid),
        islogsheet = Value(islogsheet),
        ischecklist = Value(ischecklist),
        imagecount = Value(imagecount);
  static Insertable<BarcodeData> custom({
    Expression<int>? id,
    Expression<String>? guid,
    Expression<bool>? islogsheet,
    Expression<bool>? ischecklist,
    Expression<int>? imagecount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guid != null) 'guid': guid,
      if (islogsheet != null) 'islogsheet': islogsheet,
      if (ischecklist != null) 'ischecklist': ischecklist,
      if (imagecount != null) 'imagecount': imagecount,
    });
  }

  BarcodeCompanion copyWith(
      {Value<int>? id,
      Value<String>? guid,
      Value<bool>? islogsheet,
      Value<bool>? ischecklist,
      Value<int>? imagecount}) {
    return BarcodeCompanion(
      id: id ?? this.id,
      guid: guid ?? this.guid,
      islogsheet: islogsheet ?? this.islogsheet,
      ischecklist: ischecklist ?? this.ischecklist,
      imagecount: imagecount ?? this.imagecount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (islogsheet.present) {
      map['islogsheet'] = Variable<bool>(islogsheet.value);
    }
    if (ischecklist.present) {
      map['ischecklist'] = Variable<bool>(ischecklist.value);
    }
    if (imagecount.present) {
      map['imagecount'] = Variable<int>(imagecount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarcodeCompanion(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('islogsheet: $islogsheet, ')
          ..write('ischecklist: $ischecklist, ')
          ..write('imagecount: $imagecount')
          ..write(')'))
        .toString();
  }
}

class $BarcodeTable extends Barcode with TableInfo<$BarcodeTable, BarcodeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarcodeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _islogsheetMeta = const VerificationMeta('islogsheet');
  @override
  late final GeneratedColumn<bool> islogsheet = GeneratedColumn<bool>(
      'islogsheet', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("islogsheet" IN (0, 1))');
  final VerificationMeta _ischecklistMeta =
      const VerificationMeta('ischecklist');
  @override
  late final GeneratedColumn<bool> ischecklist = GeneratedColumn<bool>(
      'ischecklist', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("ischecklist" IN (0, 1))');
  final VerificationMeta _imagecountMeta = const VerificationMeta('imagecount');
  @override
  late final GeneratedColumn<int> imagecount = GeneratedColumn<int>(
      'imagecount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, guid, islogsheet, ischecklist, imagecount];
  @override
  String get aliasedName => _alias ?? 'barcode';
  @override
  String get actualTableName => 'barcode';
  @override
  VerificationContext validateIntegrity(Insertable<BarcodeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('islogsheet')) {
      context.handle(
          _islogsheetMeta,
          islogsheet.isAcceptableOrUnknown(
              data['islogsheet']!, _islogsheetMeta));
    } else if (isInserting) {
      context.missing(_islogsheetMeta);
    }
    if (data.containsKey('ischecklist')) {
      context.handle(
          _ischecklistMeta,
          ischecklist.isAcceptableOrUnknown(
              data['ischecklist']!, _ischecklistMeta));
    } else if (isInserting) {
      context.missing(_ischecklistMeta);
    }
    if (data.containsKey('imagecount')) {
      context.handle(
          _imagecountMeta,
          imagecount.isAcceptableOrUnknown(
              data['imagecount']!, _imagecountMeta));
    } else if (isInserting) {
      context.missing(_imagecountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BarcodeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BarcodeData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      islogsheet: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}islogsheet'])!,
      ischecklist: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}ischecklist'])!,
      imagecount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}imagecount'])!,
    );
  }

  @override
  $BarcodeTable createAlias(String alias) {
    return $BarcodeTable(attachedDatabase, alias);
  }
}

class ChecklistTransactionData extends DataClass
    implements Insertable<ChecklistTransactionData> {
  final int id;
  final String userId;
  final int companyId;
  final int locationId;
  final int buildingId;
  final int sectorId;
  final int floorId;
  final int wingId;
  final int auditId;
  final int categoryId;
  final int slotId;
  final String submitDateTime;
  final String submitDate;
  final String remark;
  final String signature;
  final String supervisorName;
  final String submitStartTime;
  final String submitEndTime;
  final int submitInterval;
  final String scanStartTime;
  final String timeTaken;
  final String qrCode;
  final String barcode;
  final bool isAdmin;
  final String guid;
  final String deviceId;
  final bool isSync;
  final bool isSyncing;
  final String checklists;
  final String submitImages;
  const ChecklistTransactionData(
      {required this.id,
      required this.userId,
      required this.companyId,
      required this.locationId,
      required this.buildingId,
      required this.sectorId,
      required this.floorId,
      required this.wingId,
      required this.auditId,
      required this.categoryId,
      required this.slotId,
      required this.submitDateTime,
      required this.submitDate,
      required this.remark,
      required this.signature,
      required this.supervisorName,
      required this.submitStartTime,
      required this.submitEndTime,
      required this.submitInterval,
      required this.scanStartTime,
      required this.timeTaken,
      required this.qrCode,
      required this.barcode,
      required this.isAdmin,
      required this.guid,
      required this.deviceId,
      required this.isSync,
      required this.isSyncing,
      required this.checklists,
      required this.submitImages});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['company_id'] = Variable<int>(companyId);
    map['location_id'] = Variable<int>(locationId);
    map['building_id'] = Variable<int>(buildingId);
    map['sector_id'] = Variable<int>(sectorId);
    map['floor_id'] = Variable<int>(floorId);
    map['wing_id'] = Variable<int>(wingId);
    map['audit_id'] = Variable<int>(auditId);
    map['category_id'] = Variable<int>(categoryId);
    map['slot_id'] = Variable<int>(slotId);
    map['submit_date_time'] = Variable<String>(submitDateTime);
    map['submit_date'] = Variable<String>(submitDate);
    map['remark'] = Variable<String>(remark);
    map['signature'] = Variable<String>(signature);
    map['supervisor_name'] = Variable<String>(supervisorName);
    map['submit_start_time'] = Variable<String>(submitStartTime);
    map['submit_end_time'] = Variable<String>(submitEndTime);
    map['submit_interval'] = Variable<int>(submitInterval);
    map['scan_start_time'] = Variable<String>(scanStartTime);
    map['time_taken'] = Variable<String>(timeTaken);
    map['qr_code'] = Variable<String>(qrCode);
    map['barcode'] = Variable<String>(barcode);
    map['is_admin'] = Variable<bool>(isAdmin);
    map['guid'] = Variable<String>(guid);
    map['device_id'] = Variable<String>(deviceId);
    map['is_sync'] = Variable<bool>(isSync);
    map['is_syncing'] = Variable<bool>(isSyncing);
    map['checklists'] = Variable<String>(checklists);
    map['submit_images'] = Variable<String>(submitImages);
    return map;
  }

  ChecklistTransactionCompanion toCompanion(bool nullToAbsent) {
    return ChecklistTransactionCompanion(
      id: Value(id),
      userId: Value(userId),
      companyId: Value(companyId),
      locationId: Value(locationId),
      buildingId: Value(buildingId),
      sectorId: Value(sectorId),
      floorId: Value(floorId),
      wingId: Value(wingId),
      auditId: Value(auditId),
      categoryId: Value(categoryId),
      slotId: Value(slotId),
      submitDateTime: Value(submitDateTime),
      submitDate: Value(submitDate),
      remark: Value(remark),
      signature: Value(signature),
      supervisorName: Value(supervisorName),
      submitStartTime: Value(submitStartTime),
      submitEndTime: Value(submitEndTime),
      submitInterval: Value(submitInterval),
      scanStartTime: Value(scanStartTime),
      timeTaken: Value(timeTaken),
      qrCode: Value(qrCode),
      barcode: Value(barcode),
      isAdmin: Value(isAdmin),
      guid: Value(guid),
      deviceId: Value(deviceId),
      isSync: Value(isSync),
      isSyncing: Value(isSyncing),
      checklists: Value(checklists),
      submitImages: Value(submitImages),
    );
  }

  factory ChecklistTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistTransactionData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      companyId: serializer.fromJson<int>(json['companyId']),
      locationId: serializer.fromJson<int>(json['locationId']),
      buildingId: serializer.fromJson<int>(json['buildingId']),
      sectorId: serializer.fromJson<int>(json['sectorId']),
      floorId: serializer.fromJson<int>(json['floorId']),
      wingId: serializer.fromJson<int>(json['wingId']),
      auditId: serializer.fromJson<int>(json['auditId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      slotId: serializer.fromJson<int>(json['slotId']),
      submitDateTime: serializer.fromJson<String>(json['submitDateTime']),
      submitDate: serializer.fromJson<String>(json['submitDate']),
      remark: serializer.fromJson<String>(json['remark']),
      signature: serializer.fromJson<String>(json['signature']),
      supervisorName: serializer.fromJson<String>(json['supervisorName']),
      submitStartTime: serializer.fromJson<String>(json['submitStartTime']),
      submitEndTime: serializer.fromJson<String>(json['submitEndTime']),
      submitInterval: serializer.fromJson<int>(json['submitInterval']),
      scanStartTime: serializer.fromJson<String>(json['scanStartTime']),
      timeTaken: serializer.fromJson<String>(json['timeTaken']),
      qrCode: serializer.fromJson<String>(json['qrCode']),
      barcode: serializer.fromJson<String>(json['barcode']),
      isAdmin: serializer.fromJson<bool>(json['isAdmin']),
      guid: serializer.fromJson<String>(json['guid']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
      checklists: serializer.fromJson<String>(json['checklists']),
      submitImages: serializer.fromJson<String>(json['submitImages']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'companyId': serializer.toJson<int>(companyId),
      'locationId': serializer.toJson<int>(locationId),
      'buildingId': serializer.toJson<int>(buildingId),
      'sectorId': serializer.toJson<int>(sectorId),
      'floorId': serializer.toJson<int>(floorId),
      'wingId': serializer.toJson<int>(wingId),
      'auditId': serializer.toJson<int>(auditId),
      'categoryId': serializer.toJson<int>(categoryId),
      'slotId': serializer.toJson<int>(slotId),
      'submitDateTime': serializer.toJson<String>(submitDateTime),
      'submitDate': serializer.toJson<String>(submitDate),
      'remark': serializer.toJson<String>(remark),
      'signature': serializer.toJson<String>(signature),
      'supervisorName': serializer.toJson<String>(supervisorName),
      'submitStartTime': serializer.toJson<String>(submitStartTime),
      'submitEndTime': serializer.toJson<String>(submitEndTime),
      'submitInterval': serializer.toJson<int>(submitInterval),
      'scanStartTime': serializer.toJson<String>(scanStartTime),
      'timeTaken': serializer.toJson<String>(timeTaken),
      'qrCode': serializer.toJson<String>(qrCode),
      'barcode': serializer.toJson<String>(barcode),
      'isAdmin': serializer.toJson<bool>(isAdmin),
      'guid': serializer.toJson<String>(guid),
      'deviceId': serializer.toJson<String>(deviceId),
      'isSync': serializer.toJson<bool>(isSync),
      'isSyncing': serializer.toJson<bool>(isSyncing),
      'checklists': serializer.toJson<String>(checklists),
      'submitImages': serializer.toJson<String>(submitImages),
    };
  }

  ChecklistTransactionData copyWith(
          {int? id,
          String? userId,
          int? companyId,
          int? locationId,
          int? buildingId,
          int? sectorId,
          int? floorId,
          int? wingId,
          int? auditId,
          int? categoryId,
          int? slotId,
          String? submitDateTime,
          String? submitDate,
          String? remark,
          String? signature,
          String? supervisorName,
          String? submitStartTime,
          String? submitEndTime,
          int? submitInterval,
          String? scanStartTime,
          String? timeTaken,
          String? qrCode,
          String? barcode,
          bool? isAdmin,
          String? guid,
          String? deviceId,
          bool? isSync,
          bool? isSyncing,
          String? checklists,
          String? submitImages}) =>
      ChecklistTransactionData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        companyId: companyId ?? this.companyId,
        locationId: locationId ?? this.locationId,
        buildingId: buildingId ?? this.buildingId,
        sectorId: sectorId ?? this.sectorId,
        floorId: floorId ?? this.floorId,
        wingId: wingId ?? this.wingId,
        auditId: auditId ?? this.auditId,
        categoryId: categoryId ?? this.categoryId,
        slotId: slotId ?? this.slotId,
        submitDateTime: submitDateTime ?? this.submitDateTime,
        submitDate: submitDate ?? this.submitDate,
        remark: remark ?? this.remark,
        signature: signature ?? this.signature,
        supervisorName: supervisorName ?? this.supervisorName,
        submitStartTime: submitStartTime ?? this.submitStartTime,
        submitEndTime: submitEndTime ?? this.submitEndTime,
        submitInterval: submitInterval ?? this.submitInterval,
        scanStartTime: scanStartTime ?? this.scanStartTime,
        timeTaken: timeTaken ?? this.timeTaken,
        qrCode: qrCode ?? this.qrCode,
        barcode: barcode ?? this.barcode,
        isAdmin: isAdmin ?? this.isAdmin,
        guid: guid ?? this.guid,
        deviceId: deviceId ?? this.deviceId,
        isSync: isSync ?? this.isSync,
        isSyncing: isSyncing ?? this.isSyncing,
        checklists: checklists ?? this.checklists,
        submitImages: submitImages ?? this.submitImages,
      );
  @override
  String toString() {
    return (StringBuffer('ChecklistTransactionData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('companyId: $companyId, ')
          ..write('locationId: $locationId, ')
          ..write('buildingId: $buildingId, ')
          ..write('sectorId: $sectorId, ')
          ..write('floorId: $floorId, ')
          ..write('wingId: $wingId, ')
          ..write('auditId: $auditId, ')
          ..write('categoryId: $categoryId, ')
          ..write('slotId: $slotId, ')
          ..write('submitDateTime: $submitDateTime, ')
          ..write('submitDate: $submitDate, ')
          ..write('remark: $remark, ')
          ..write('signature: $signature, ')
          ..write('supervisorName: $supervisorName, ')
          ..write('submitStartTime: $submitStartTime, ')
          ..write('submitEndTime: $submitEndTime, ')
          ..write('submitInterval: $submitInterval, ')
          ..write('scanStartTime: $scanStartTime, ')
          ..write('timeTaken: $timeTaken, ')
          ..write('qrCode: $qrCode, ')
          ..write('barcode: $barcode, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('guid: $guid, ')
          ..write('deviceId: $deviceId, ')
          ..write('isSync: $isSync, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('checklists: $checklists, ')
          ..write('submitImages: $submitImages')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        userId,
        companyId,
        locationId,
        buildingId,
        sectorId,
        floorId,
        wingId,
        auditId,
        categoryId,
        slotId,
        submitDateTime,
        submitDate,
        remark,
        signature,
        supervisorName,
        submitStartTime,
        submitEndTime,
        submitInterval,
        scanStartTime,
        timeTaken,
        qrCode,
        barcode,
        isAdmin,
        guid,
        deviceId,
        isSync,
        isSyncing,
        checklists,
        submitImages
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistTransactionData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.companyId == this.companyId &&
          other.locationId == this.locationId &&
          other.buildingId == this.buildingId &&
          other.sectorId == this.sectorId &&
          other.floorId == this.floorId &&
          other.wingId == this.wingId &&
          other.auditId == this.auditId &&
          other.categoryId == this.categoryId &&
          other.slotId == this.slotId &&
          other.submitDateTime == this.submitDateTime &&
          other.submitDate == this.submitDate &&
          other.remark == this.remark &&
          other.signature == this.signature &&
          other.supervisorName == this.supervisorName &&
          other.submitStartTime == this.submitStartTime &&
          other.submitEndTime == this.submitEndTime &&
          other.submitInterval == this.submitInterval &&
          other.scanStartTime == this.scanStartTime &&
          other.timeTaken == this.timeTaken &&
          other.qrCode == this.qrCode &&
          other.barcode == this.barcode &&
          other.isAdmin == this.isAdmin &&
          other.guid == this.guid &&
          other.deviceId == this.deviceId &&
          other.isSync == this.isSync &&
          other.isSyncing == this.isSyncing &&
          other.checklists == this.checklists &&
          other.submitImages == this.submitImages);
}

class ChecklistTransactionCompanion
    extends UpdateCompanion<ChecklistTransactionData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> companyId;
  final Value<int> locationId;
  final Value<int> buildingId;
  final Value<int> sectorId;
  final Value<int> floorId;
  final Value<int> wingId;
  final Value<int> auditId;
  final Value<int> categoryId;
  final Value<int> slotId;
  final Value<String> submitDateTime;
  final Value<String> submitDate;
  final Value<String> remark;
  final Value<String> signature;
  final Value<String> supervisorName;
  final Value<String> submitStartTime;
  final Value<String> submitEndTime;
  final Value<int> submitInterval;
  final Value<String> scanStartTime;
  final Value<String> timeTaken;
  final Value<String> qrCode;
  final Value<String> barcode;
  final Value<bool> isAdmin;
  final Value<String> guid;
  final Value<String> deviceId;
  final Value<bool> isSync;
  final Value<bool> isSyncing;
  final Value<String> checklists;
  final Value<String> submitImages;
  const ChecklistTransactionCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.buildingId = const Value.absent(),
    this.sectorId = const Value.absent(),
    this.floorId = const Value.absent(),
    this.wingId = const Value.absent(),
    this.auditId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.slotId = const Value.absent(),
    this.submitDateTime = const Value.absent(),
    this.submitDate = const Value.absent(),
    this.remark = const Value.absent(),
    this.signature = const Value.absent(),
    this.supervisorName = const Value.absent(),
    this.submitStartTime = const Value.absent(),
    this.submitEndTime = const Value.absent(),
    this.submitInterval = const Value.absent(),
    this.scanStartTime = const Value.absent(),
    this.timeTaken = const Value.absent(),
    this.qrCode = const Value.absent(),
    this.barcode = const Value.absent(),
    this.isAdmin = const Value.absent(),
    this.guid = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.isSync = const Value.absent(),
    this.isSyncing = const Value.absent(),
    this.checklists = const Value.absent(),
    this.submitImages = const Value.absent(),
  });
  ChecklistTransactionCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int companyId,
    required int locationId,
    required int buildingId,
    required int sectorId,
    required int floorId,
    required int wingId,
    required int auditId,
    required int categoryId,
    required int slotId,
    required String submitDateTime,
    required String submitDate,
    required String remark,
    required String signature,
    required String supervisorName,
    required String submitStartTime,
    required String submitEndTime,
    required int submitInterval,
    required String scanStartTime,
    required String timeTaken,
    required String qrCode,
    required String barcode,
    required bool isAdmin,
    required String guid,
    required String deviceId,
    this.isSync = const Value.absent(),
    this.isSyncing = const Value.absent(),
    required String checklists,
    required String submitImages,
  })  : userId = Value(userId),
        companyId = Value(companyId),
        locationId = Value(locationId),
        buildingId = Value(buildingId),
        sectorId = Value(sectorId),
        floorId = Value(floorId),
        wingId = Value(wingId),
        auditId = Value(auditId),
        categoryId = Value(categoryId),
        slotId = Value(slotId),
        submitDateTime = Value(submitDateTime),
        submitDate = Value(submitDate),
        remark = Value(remark),
        signature = Value(signature),
        supervisorName = Value(supervisorName),
        submitStartTime = Value(submitStartTime),
        submitEndTime = Value(submitEndTime),
        submitInterval = Value(submitInterval),
        scanStartTime = Value(scanStartTime),
        timeTaken = Value(timeTaken),
        qrCode = Value(qrCode),
        barcode = Value(barcode),
        isAdmin = Value(isAdmin),
        guid = Value(guid),
        deviceId = Value(deviceId),
        checklists = Value(checklists),
        submitImages = Value(submitImages);
  static Insertable<ChecklistTransactionData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? companyId,
    Expression<int>? locationId,
    Expression<int>? buildingId,
    Expression<int>? sectorId,
    Expression<int>? floorId,
    Expression<int>? wingId,
    Expression<int>? auditId,
    Expression<int>? categoryId,
    Expression<int>? slotId,
    Expression<String>? submitDateTime,
    Expression<String>? submitDate,
    Expression<String>? remark,
    Expression<String>? signature,
    Expression<String>? supervisorName,
    Expression<String>? submitStartTime,
    Expression<String>? submitEndTime,
    Expression<int>? submitInterval,
    Expression<String>? scanStartTime,
    Expression<String>? timeTaken,
    Expression<String>? qrCode,
    Expression<String>? barcode,
    Expression<bool>? isAdmin,
    Expression<String>? guid,
    Expression<String>? deviceId,
    Expression<bool>? isSync,
    Expression<bool>? isSyncing,
    Expression<String>? checklists,
    Expression<String>? submitImages,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (companyId != null) 'company_id': companyId,
      if (locationId != null) 'location_id': locationId,
      if (buildingId != null) 'building_id': buildingId,
      if (sectorId != null) 'sector_id': sectorId,
      if (floorId != null) 'floor_id': floorId,
      if (wingId != null) 'wing_id': wingId,
      if (auditId != null) 'audit_id': auditId,
      if (categoryId != null) 'category_id': categoryId,
      if (slotId != null) 'slot_id': slotId,
      if (submitDateTime != null) 'submit_date_time': submitDateTime,
      if (submitDate != null) 'submit_date': submitDate,
      if (remark != null) 'remark': remark,
      if (signature != null) 'signature': signature,
      if (supervisorName != null) 'supervisor_name': supervisorName,
      if (submitStartTime != null) 'submit_start_time': submitStartTime,
      if (submitEndTime != null) 'submit_end_time': submitEndTime,
      if (submitInterval != null) 'submit_interval': submitInterval,
      if (scanStartTime != null) 'scan_start_time': scanStartTime,
      if (timeTaken != null) 'time_taken': timeTaken,
      if (qrCode != null) 'qr_code': qrCode,
      if (barcode != null) 'barcode': barcode,
      if (isAdmin != null) 'is_admin': isAdmin,
      if (guid != null) 'guid': guid,
      if (deviceId != null) 'device_id': deviceId,
      if (isSync != null) 'is_sync': isSync,
      if (isSyncing != null) 'is_syncing': isSyncing,
      if (checklists != null) 'checklists': checklists,
      if (submitImages != null) 'submit_images': submitImages,
    });
  }

  ChecklistTransactionCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? companyId,
      Value<int>? locationId,
      Value<int>? buildingId,
      Value<int>? sectorId,
      Value<int>? floorId,
      Value<int>? wingId,
      Value<int>? auditId,
      Value<int>? categoryId,
      Value<int>? slotId,
      Value<String>? submitDateTime,
      Value<String>? submitDate,
      Value<String>? remark,
      Value<String>? signature,
      Value<String>? supervisorName,
      Value<String>? submitStartTime,
      Value<String>? submitEndTime,
      Value<int>? submitInterval,
      Value<String>? scanStartTime,
      Value<String>? timeTaken,
      Value<String>? qrCode,
      Value<String>? barcode,
      Value<bool>? isAdmin,
      Value<String>? guid,
      Value<String>? deviceId,
      Value<bool>? isSync,
      Value<bool>? isSyncing,
      Value<String>? checklists,
      Value<String>? submitImages}) {
    return ChecklistTransactionCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      companyId: companyId ?? this.companyId,
      locationId: locationId ?? this.locationId,
      buildingId: buildingId ?? this.buildingId,
      sectorId: sectorId ?? this.sectorId,
      floorId: floorId ?? this.floorId,
      wingId: wingId ?? this.wingId,
      auditId: auditId ?? this.auditId,
      categoryId: categoryId ?? this.categoryId,
      slotId: slotId ?? this.slotId,
      submitDateTime: submitDateTime ?? this.submitDateTime,
      submitDate: submitDate ?? this.submitDate,
      remark: remark ?? this.remark,
      signature: signature ?? this.signature,
      supervisorName: supervisorName ?? this.supervisorName,
      submitStartTime: submitStartTime ?? this.submitStartTime,
      submitEndTime: submitEndTime ?? this.submitEndTime,
      submitInterval: submitInterval ?? this.submitInterval,
      scanStartTime: scanStartTime ?? this.scanStartTime,
      timeTaken: timeTaken ?? this.timeTaken,
      qrCode: qrCode ?? this.qrCode,
      barcode: barcode ?? this.barcode,
      isAdmin: isAdmin ?? this.isAdmin,
      guid: guid ?? this.guid,
      deviceId: deviceId ?? this.deviceId,
      isSync: isSync ?? this.isSync,
      isSyncing: isSyncing ?? this.isSyncing,
      checklists: checklists ?? this.checklists,
      submitImages: submitImages ?? this.submitImages,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (buildingId.present) {
      map['building_id'] = Variable<int>(buildingId.value);
    }
    if (sectorId.present) {
      map['sector_id'] = Variable<int>(sectorId.value);
    }
    if (floorId.present) {
      map['floor_id'] = Variable<int>(floorId.value);
    }
    if (wingId.present) {
      map['wing_id'] = Variable<int>(wingId.value);
    }
    if (auditId.present) {
      map['audit_id'] = Variable<int>(auditId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (submitDateTime.present) {
      map['submit_date_time'] = Variable<String>(submitDateTime.value);
    }
    if (submitDate.present) {
      map['submit_date'] = Variable<String>(submitDate.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (supervisorName.present) {
      map['supervisor_name'] = Variable<String>(supervisorName.value);
    }
    if (submitStartTime.present) {
      map['submit_start_time'] = Variable<String>(submitStartTime.value);
    }
    if (submitEndTime.present) {
      map['submit_end_time'] = Variable<String>(submitEndTime.value);
    }
    if (submitInterval.present) {
      map['submit_interval'] = Variable<int>(submitInterval.value);
    }
    if (scanStartTime.present) {
      map['scan_start_time'] = Variable<String>(scanStartTime.value);
    }
    if (timeTaken.present) {
      map['time_taken'] = Variable<String>(timeTaken.value);
    }
    if (qrCode.present) {
      map['qr_code'] = Variable<String>(qrCode.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (isAdmin.present) {
      map['is_admin'] = Variable<bool>(isAdmin.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    if (checklists.present) {
      map['checklists'] = Variable<String>(checklists.value);
    }
    if (submitImages.present) {
      map['submit_images'] = Variable<String>(submitImages.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistTransactionCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('companyId: $companyId, ')
          ..write('locationId: $locationId, ')
          ..write('buildingId: $buildingId, ')
          ..write('sectorId: $sectorId, ')
          ..write('floorId: $floorId, ')
          ..write('wingId: $wingId, ')
          ..write('auditId: $auditId, ')
          ..write('categoryId: $categoryId, ')
          ..write('slotId: $slotId, ')
          ..write('submitDateTime: $submitDateTime, ')
          ..write('submitDate: $submitDate, ')
          ..write('remark: $remark, ')
          ..write('signature: $signature, ')
          ..write('supervisorName: $supervisorName, ')
          ..write('submitStartTime: $submitStartTime, ')
          ..write('submitEndTime: $submitEndTime, ')
          ..write('submitInterval: $submitInterval, ')
          ..write('scanStartTime: $scanStartTime, ')
          ..write('timeTaken: $timeTaken, ')
          ..write('qrCode: $qrCode, ')
          ..write('barcode: $barcode, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('guid: $guid, ')
          ..write('deviceId: $deviceId, ')
          ..write('isSync: $isSync, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('checklists: $checklists, ')
          ..write('submitImages: $submitImages')
          ..write(')'))
        .toString();
  }
}

class $ChecklistTransactionTable extends ChecklistTransaction
    with TableInfo<$ChecklistTransactionTable, ChecklistTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistTransactionTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _buildingIdMeta = const VerificationMeta('buildingId');
  @override
  late final GeneratedColumn<int> buildingId = GeneratedColumn<int>(
      'building_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _sectorIdMeta = const VerificationMeta('sectorId');
  @override
  late final GeneratedColumn<int> sectorId = GeneratedColumn<int>(
      'sector_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _floorIdMeta = const VerificationMeta('floorId');
  @override
  late final GeneratedColumn<int> floorId = GeneratedColumn<int>(
      'floor_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _wingIdMeta = const VerificationMeta('wingId');
  @override
  late final GeneratedColumn<int> wingId = GeneratedColumn<int>(
      'wing_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditIdMeta = const VerificationMeta('auditId');
  @override
  late final GeneratedColumn<int> auditId = GeneratedColumn<int>(
      'audit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
      'slot_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _submitDateTimeMeta =
      const VerificationMeta('submitDateTime');
  @override
  late final GeneratedColumn<String> submitDateTime = GeneratedColumn<String>(
      'submit_date_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitDateMeta = const VerificationMeta('submitDate');
  @override
  late final GeneratedColumn<String> submitDate = GeneratedColumn<String>(
      'submit_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
      'remark', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _signatureMeta = const VerificationMeta('signature');
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
      'signature', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _supervisorNameMeta =
      const VerificationMeta('supervisorName');
  @override
  late final GeneratedColumn<String> supervisorName = GeneratedColumn<String>(
      'supervisor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitStartTimeMeta =
      const VerificationMeta('submitStartTime');
  @override
  late final GeneratedColumn<String> submitStartTime = GeneratedColumn<String>(
      'submit_start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitEndTimeMeta =
      const VerificationMeta('submitEndTime');
  @override
  late final GeneratedColumn<String> submitEndTime = GeneratedColumn<String>(
      'submit_end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitIntervalMeta =
      const VerificationMeta('submitInterval');
  @override
  late final GeneratedColumn<int> submitInterval = GeneratedColumn<int>(
      'submit_interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _scanStartTimeMeta =
      const VerificationMeta('scanStartTime');
  @override
  late final GeneratedColumn<String> scanStartTime = GeneratedColumn<String>(
      'scan_start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _timeTakenMeta = const VerificationMeta('timeTaken');
  @override
  late final GeneratedColumn<String> timeTaken = GeneratedColumn<String>(
      'time_taken', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _qrCodeMeta = const VerificationMeta('qrCode');
  @override
  late final GeneratedColumn<String> qrCode = GeneratedColumn<String>(
      'qr_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isAdminMeta = const VerificationMeta('isAdmin');
  @override
  late final GeneratedColumn<bool> isAdmin = GeneratedColumn<bool>(
      'is_admin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_admin" IN (0, 1))');
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("is_sync" IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isSyncingMeta = const VerificationMeta('isSyncing');
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
      'is_syncing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("is_syncing" IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _checklistsMeta = const VerificationMeta('checklists');
  @override
  late final GeneratedColumn<String> checklists = GeneratedColumn<String>(
      'checklists', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitImagesMeta =
      const VerificationMeta('submitImages');
  @override
  late final GeneratedColumn<String> submitImages = GeneratedColumn<String>(
      'submit_images', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        companyId,
        locationId,
        buildingId,
        sectorId,
        floorId,
        wingId,
        auditId,
        categoryId,
        slotId,
        submitDateTime,
        submitDate,
        remark,
        signature,
        supervisorName,
        submitStartTime,
        submitEndTime,
        submitInterval,
        scanStartTime,
        timeTaken,
        qrCode,
        barcode,
        isAdmin,
        guid,
        deviceId,
        isSync,
        isSyncing,
        checklists,
        submitImages
      ];
  @override
  String get aliasedName => _alias ?? 'checklist_transaction';
  @override
  String get actualTableName => 'checklist_transaction';
  @override
  VerificationContext validateIntegrity(
      Insertable<ChecklistTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('building_id')) {
      context.handle(
          _buildingIdMeta,
          buildingId.isAcceptableOrUnknown(
              data['building_id']!, _buildingIdMeta));
    } else if (isInserting) {
      context.missing(_buildingIdMeta);
    }
    if (data.containsKey('sector_id')) {
      context.handle(_sectorIdMeta,
          sectorId.isAcceptableOrUnknown(data['sector_id']!, _sectorIdMeta));
    } else if (isInserting) {
      context.missing(_sectorIdMeta);
    }
    if (data.containsKey('floor_id')) {
      context.handle(_floorIdMeta,
          floorId.isAcceptableOrUnknown(data['floor_id']!, _floorIdMeta));
    } else if (isInserting) {
      context.missing(_floorIdMeta);
    }
    if (data.containsKey('wing_id')) {
      context.handle(_wingIdMeta,
          wingId.isAcceptableOrUnknown(data['wing_id']!, _wingIdMeta));
    } else if (isInserting) {
      context.missing(_wingIdMeta);
    }
    if (data.containsKey('audit_id')) {
      context.handle(_auditIdMeta,
          auditId.isAcceptableOrUnknown(data['audit_id']!, _auditIdMeta));
    } else if (isInserting) {
      context.missing(_auditIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('slot_id')) {
      context.handle(_slotIdMeta,
          slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta));
    } else if (isInserting) {
      context.missing(_slotIdMeta);
    }
    if (data.containsKey('submit_date_time')) {
      context.handle(
          _submitDateTimeMeta,
          submitDateTime.isAcceptableOrUnknown(
              data['submit_date_time']!, _submitDateTimeMeta));
    } else if (isInserting) {
      context.missing(_submitDateTimeMeta);
    }
    if (data.containsKey('submit_date')) {
      context.handle(
          _submitDateMeta,
          submitDate.isAcceptableOrUnknown(
              data['submit_date']!, _submitDateMeta));
    } else if (isInserting) {
      context.missing(_submitDateMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    } else if (isInserting) {
      context.missing(_signatureMeta);
    }
    if (data.containsKey('supervisor_name')) {
      context.handle(
          _supervisorNameMeta,
          supervisorName.isAcceptableOrUnknown(
              data['supervisor_name']!, _supervisorNameMeta));
    } else if (isInserting) {
      context.missing(_supervisorNameMeta);
    }
    if (data.containsKey('submit_start_time')) {
      context.handle(
          _submitStartTimeMeta,
          submitStartTime.isAcceptableOrUnknown(
              data['submit_start_time']!, _submitStartTimeMeta));
    } else if (isInserting) {
      context.missing(_submitStartTimeMeta);
    }
    if (data.containsKey('submit_end_time')) {
      context.handle(
          _submitEndTimeMeta,
          submitEndTime.isAcceptableOrUnknown(
              data['submit_end_time']!, _submitEndTimeMeta));
    } else if (isInserting) {
      context.missing(_submitEndTimeMeta);
    }
    if (data.containsKey('submit_interval')) {
      context.handle(
          _submitIntervalMeta,
          submitInterval.isAcceptableOrUnknown(
              data['submit_interval']!, _submitIntervalMeta));
    } else if (isInserting) {
      context.missing(_submitIntervalMeta);
    }
    if (data.containsKey('scan_start_time')) {
      context.handle(
          _scanStartTimeMeta,
          scanStartTime.isAcceptableOrUnknown(
              data['scan_start_time']!, _scanStartTimeMeta));
    } else if (isInserting) {
      context.missing(_scanStartTimeMeta);
    }
    if (data.containsKey('time_taken')) {
      context.handle(_timeTakenMeta,
          timeTaken.isAcceptableOrUnknown(data['time_taken']!, _timeTakenMeta));
    } else if (isInserting) {
      context.missing(_timeTakenMeta);
    }
    if (data.containsKey('qr_code')) {
      context.handle(_qrCodeMeta,
          qrCode.isAcceptableOrUnknown(data['qr_code']!, _qrCodeMeta));
    } else if (isInserting) {
      context.missing(_qrCodeMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('is_admin')) {
      context.handle(_isAdminMeta,
          isAdmin.isAcceptableOrUnknown(data['is_admin']!, _isAdminMeta));
    } else if (isInserting) {
      context.missing(_isAdminMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    }
    if (data.containsKey('is_syncing')) {
      context.handle(_isSyncingMeta,
          isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta));
    }
    if (data.containsKey('checklists')) {
      context.handle(
          _checklistsMeta,
          checklists.isAcceptableOrUnknown(
              data['checklists']!, _checklistsMeta));
    } else if (isInserting) {
      context.missing(_checklistsMeta);
    }
    if (data.containsKey('submit_images')) {
      context.handle(
          _submitImagesMeta,
          submitImages.isAcceptableOrUnknown(
              data['submit_images']!, _submitImagesMeta));
    } else if (isInserting) {
      context.missing(_submitImagesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistTransactionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistTransactionData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      companyId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      locationId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      buildingId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}building_id'])!,
      sectorId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sector_id'])!,
      floorId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}floor_id'])!,
      wingId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}wing_id'])!,
      auditId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}audit_id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      slotId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}slot_id'])!,
      submitDateTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_date_time'])!,
      submitDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}submit_date'])!,
      remark: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remark'])!,
      signature: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}signature'])!,
      supervisorName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}supervisor_name'])!,
      submitStartTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_start_time'])!,
      submitEndTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_end_time'])!,
      submitInterval: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}submit_interval'])!,
      scanStartTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}scan_start_time'])!,
      timeTaken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}time_taken'])!,
      qrCode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}qr_code'])!,
      barcode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      isAdmin: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_admin'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      deviceId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      isSync: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
      isSyncing: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_syncing'])!,
      checklists: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}checklists'])!,
      submitImages: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}submit_images'])!,
    );
  }

  @override
  $ChecklistTransactionTable createAlias(String alias) {
    return $ChecklistTransactionTable(attachedDatabase, alias);
  }
}

class LogsheetTransactionData extends DataClass
    implements Insertable<LogsheetTransactionData> {
  final int id;
  final String userId;
  final int companyId;
  final String companyName;
  final int locationId;
  final String locationName;
  final int buildingId;
  final String buildingName;
  final int floorId;
  final String floorName;
  final int wingId;
  final String wingName;
  final int sectorId;
  final int auditId;
  final String auditName;
  final int categoryId;
  final String categoryName;
  final int equipmentTemplateId;
  final int equipmentId;
  final int slotId;
  final String submitStartTime;
  final String submitEndTime;
  final int submitInterval;
  final String deviceId;
  final String guid;
  final String submitDateTime;
  final String submitDate;
  final String signature;
  final String supervisorName;
  final String remark;
  final String barcode;
  final bool isSync;
  final bool isSyncing;
  final String logsheets;
  final String submitImages;
  final bool isOnOff;
  const LogsheetTransactionData(
      {required this.id,
      required this.userId,
      required this.companyId,
      required this.companyName,
      required this.locationId,
      required this.locationName,
      required this.buildingId,
      required this.buildingName,
      required this.floorId,
      required this.floorName,
      required this.wingId,
      required this.wingName,
      required this.sectorId,
      required this.auditId,
      required this.auditName,
      required this.categoryId,
      required this.categoryName,
      required this.equipmentTemplateId,
      required this.equipmentId,
      required this.slotId,
      required this.submitStartTime,
      required this.submitEndTime,
      required this.submitInterval,
      required this.deviceId,
      required this.guid,
      required this.submitDateTime,
      required this.submitDate,
      required this.signature,
      required this.supervisorName,
      required this.remark,
      required this.barcode,
      required this.isSync,
      required this.isSyncing,
      required this.logsheets,
      required this.submitImages,
      required this.isOnOff});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['company_id'] = Variable<int>(companyId);
    map['company_name'] = Variable<String>(companyName);
    map['location_id'] = Variable<int>(locationId);
    map['location_name'] = Variable<String>(locationName);
    map['building_id'] = Variable<int>(buildingId);
    map['building_name'] = Variable<String>(buildingName);
    map['floor_id'] = Variable<int>(floorId);
    map['floor_name'] = Variable<String>(floorName);
    map['wing_id'] = Variable<int>(wingId);
    map['wing_name'] = Variable<String>(wingName);
    map['sector_id'] = Variable<int>(sectorId);
    map['audit_id'] = Variable<int>(auditId);
    map['audit_name'] = Variable<String>(auditName);
    map['category_id'] = Variable<int>(categoryId);
    map['category_name'] = Variable<String>(categoryName);
    map['equipment_template_id'] = Variable<int>(equipmentTemplateId);
    map['equipment_id'] = Variable<int>(equipmentId);
    map['slot_id'] = Variable<int>(slotId);
    map['submit_start_time'] = Variable<String>(submitStartTime);
    map['submit_end_time'] = Variable<String>(submitEndTime);
    map['submit_interval'] = Variable<int>(submitInterval);
    map['device_id'] = Variable<String>(deviceId);
    map['guid'] = Variable<String>(guid);
    map['submit_date_time'] = Variable<String>(submitDateTime);
    map['submit_date'] = Variable<String>(submitDate);
    map['signature'] = Variable<String>(signature);
    map['supervisor_name'] = Variable<String>(supervisorName);
    map['remark'] = Variable<String>(remark);
    map['barcode'] = Variable<String>(barcode);
    map['is_sync'] = Variable<bool>(isSync);
    map['is_syncing'] = Variable<bool>(isSyncing);
    map['logsheets'] = Variable<String>(logsheets);
    map['submit_images'] = Variable<String>(submitImages);
    map['is_on_off'] = Variable<bool>(isOnOff);
    return map;
  }

  LogsheetTransactionCompanion toCompanion(bool nullToAbsent) {
    return LogsheetTransactionCompanion(
      id: Value(id),
      userId: Value(userId),
      companyId: Value(companyId),
      companyName: Value(companyName),
      locationId: Value(locationId),
      locationName: Value(locationName),
      buildingId: Value(buildingId),
      buildingName: Value(buildingName),
      floorId: Value(floorId),
      floorName: Value(floorName),
      wingId: Value(wingId),
      wingName: Value(wingName),
      sectorId: Value(sectorId),
      auditId: Value(auditId),
      auditName: Value(auditName),
      categoryId: Value(categoryId),
      categoryName: Value(categoryName),
      equipmentTemplateId: Value(equipmentTemplateId),
      equipmentId: Value(equipmentId),
      slotId: Value(slotId),
      submitStartTime: Value(submitStartTime),
      submitEndTime: Value(submitEndTime),
      submitInterval: Value(submitInterval),
      deviceId: Value(deviceId),
      guid: Value(guid),
      submitDateTime: Value(submitDateTime),
      submitDate: Value(submitDate),
      signature: Value(signature),
      supervisorName: Value(supervisorName),
      remark: Value(remark),
      barcode: Value(barcode),
      isSync: Value(isSync),
      isSyncing: Value(isSyncing),
      logsheets: Value(logsheets),
      submitImages: Value(submitImages),
      isOnOff: Value(isOnOff),
    );
  }

  factory LogsheetTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogsheetTransactionData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      companyId: serializer.fromJson<int>(json['companyId']),
      companyName: serializer.fromJson<String>(json['companyName']),
      locationId: serializer.fromJson<int>(json['locationId']),
      locationName: serializer.fromJson<String>(json['locationName']),
      buildingId: serializer.fromJson<int>(json['buildingId']),
      buildingName: serializer.fromJson<String>(json['buildingName']),
      floorId: serializer.fromJson<int>(json['floorId']),
      floorName: serializer.fromJson<String>(json['floorName']),
      wingId: serializer.fromJson<int>(json['wingId']),
      wingName: serializer.fromJson<String>(json['wingName']),
      sectorId: serializer.fromJson<int>(json['sectorId']),
      auditId: serializer.fromJson<int>(json['auditId']),
      auditName: serializer.fromJson<String>(json['auditName']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      equipmentTemplateId:
          serializer.fromJson<int>(json['equipmentTemplateId']),
      equipmentId: serializer.fromJson<int>(json['equipmentId']),
      slotId: serializer.fromJson<int>(json['slotId']),
      submitStartTime: serializer.fromJson<String>(json['submitStartTime']),
      submitEndTime: serializer.fromJson<String>(json['submitEndTime']),
      submitInterval: serializer.fromJson<int>(json['submitInterval']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      guid: serializer.fromJson<String>(json['guid']),
      submitDateTime: serializer.fromJson<String>(json['submitDateTime']),
      submitDate: serializer.fromJson<String>(json['submitDate']),
      signature: serializer.fromJson<String>(json['signature']),
      supervisorName: serializer.fromJson<String>(json['supervisorName']),
      remark: serializer.fromJson<String>(json['remark']),
      barcode: serializer.fromJson<String>(json['barcode']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
      logsheets: serializer.fromJson<String>(json['logsheets']),
      submitImages: serializer.fromJson<String>(json['submitImages']),
      isOnOff: serializer.fromJson<bool>(json['isOnOff']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'companyId': serializer.toJson<int>(companyId),
      'companyName': serializer.toJson<String>(companyName),
      'locationId': serializer.toJson<int>(locationId),
      'locationName': serializer.toJson<String>(locationName),
      'buildingId': serializer.toJson<int>(buildingId),
      'buildingName': serializer.toJson<String>(buildingName),
      'floorId': serializer.toJson<int>(floorId),
      'floorName': serializer.toJson<String>(floorName),
      'wingId': serializer.toJson<int>(wingId),
      'wingName': serializer.toJson<String>(wingName),
      'sectorId': serializer.toJson<int>(sectorId),
      'auditId': serializer.toJson<int>(auditId),
      'auditName': serializer.toJson<String>(auditName),
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String>(categoryName),
      'equipmentTemplateId': serializer.toJson<int>(equipmentTemplateId),
      'equipmentId': serializer.toJson<int>(equipmentId),
      'slotId': serializer.toJson<int>(slotId),
      'submitStartTime': serializer.toJson<String>(submitStartTime),
      'submitEndTime': serializer.toJson<String>(submitEndTime),
      'submitInterval': serializer.toJson<int>(submitInterval),
      'deviceId': serializer.toJson<String>(deviceId),
      'guid': serializer.toJson<String>(guid),
      'submitDateTime': serializer.toJson<String>(submitDateTime),
      'submitDate': serializer.toJson<String>(submitDate),
      'signature': serializer.toJson<String>(signature),
      'supervisorName': serializer.toJson<String>(supervisorName),
      'remark': serializer.toJson<String>(remark),
      'barcode': serializer.toJson<String>(barcode),
      'isSync': serializer.toJson<bool>(isSync),
      'isSyncing': serializer.toJson<bool>(isSyncing),
      'logsheets': serializer.toJson<String>(logsheets),
      'submitImages': serializer.toJson<String>(submitImages),
      'isOnOff': serializer.toJson<bool>(isOnOff),
    };
  }

  LogsheetTransactionData copyWith(
          {int? id,
          String? userId,
          int? companyId,
          String? companyName,
          int? locationId,
          String? locationName,
          int? buildingId,
          String? buildingName,
          int? floorId,
          String? floorName,
          int? wingId,
          String? wingName,
          int? sectorId,
          int? auditId,
          String? auditName,
          int? categoryId,
          String? categoryName,
          int? equipmentTemplateId,
          int? equipmentId,
          int? slotId,
          String? submitStartTime,
          String? submitEndTime,
          int? submitInterval,
          String? deviceId,
          String? guid,
          String? submitDateTime,
          String? submitDate,
          String? signature,
          String? supervisorName,
          String? remark,
          String? barcode,
          bool? isSync,
          bool? isSyncing,
          String? logsheets,
          String? submitImages,
          bool? isOnOff}) =>
      LogsheetTransactionData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        companyId: companyId ?? this.companyId,
        companyName: companyName ?? this.companyName,
        locationId: locationId ?? this.locationId,
        locationName: locationName ?? this.locationName,
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        floorId: floorId ?? this.floorId,
        floorName: floorName ?? this.floorName,
        wingId: wingId ?? this.wingId,
        wingName: wingName ?? this.wingName,
        sectorId: sectorId ?? this.sectorId,
        auditId: auditId ?? this.auditId,
        auditName: auditName ?? this.auditName,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        equipmentTemplateId: equipmentTemplateId ?? this.equipmentTemplateId,
        equipmentId: equipmentId ?? this.equipmentId,
        slotId: slotId ?? this.slotId,
        submitStartTime: submitStartTime ?? this.submitStartTime,
        submitEndTime: submitEndTime ?? this.submitEndTime,
        submitInterval: submitInterval ?? this.submitInterval,
        deviceId: deviceId ?? this.deviceId,
        guid: guid ?? this.guid,
        submitDateTime: submitDateTime ?? this.submitDateTime,
        submitDate: submitDate ?? this.submitDate,
        signature: signature ?? this.signature,
        supervisorName: supervisorName ?? this.supervisorName,
        remark: remark ?? this.remark,
        barcode: barcode ?? this.barcode,
        isSync: isSync ?? this.isSync,
        isSyncing: isSyncing ?? this.isSyncing,
        logsheets: logsheets ?? this.logsheets,
        submitImages: submitImages ?? this.submitImages,
        isOnOff: isOnOff ?? this.isOnOff,
      );
  @override
  String toString() {
    return (StringBuffer('LogsheetTransactionData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('companyId: $companyId, ')
          ..write('companyName: $companyName, ')
          ..write('locationId: $locationId, ')
          ..write('locationName: $locationName, ')
          ..write('buildingId: $buildingId, ')
          ..write('buildingName: $buildingName, ')
          ..write('floorId: $floorId, ')
          ..write('floorName: $floorName, ')
          ..write('wingId: $wingId, ')
          ..write('wingName: $wingName, ')
          ..write('sectorId: $sectorId, ')
          ..write('auditId: $auditId, ')
          ..write('auditName: $auditName, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('equipmentTemplateId: $equipmentTemplateId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('slotId: $slotId, ')
          ..write('submitStartTime: $submitStartTime, ')
          ..write('submitEndTime: $submitEndTime, ')
          ..write('submitInterval: $submitInterval, ')
          ..write('deviceId: $deviceId, ')
          ..write('guid: $guid, ')
          ..write('submitDateTime: $submitDateTime, ')
          ..write('submitDate: $submitDate, ')
          ..write('signature: $signature, ')
          ..write('supervisorName: $supervisorName, ')
          ..write('remark: $remark, ')
          ..write('barcode: $barcode, ')
          ..write('isSync: $isSync, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('logsheets: $logsheets, ')
          ..write('submitImages: $submitImages, ')
          ..write('isOnOff: $isOnOff')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        userId,
        companyId,
        companyName,
        locationId,
        locationName,
        buildingId,
        buildingName,
        floorId,
        floorName,
        wingId,
        wingName,
        sectorId,
        auditId,
        auditName,
        categoryId,
        categoryName,
        equipmentTemplateId,
        equipmentId,
        slotId,
        submitStartTime,
        submitEndTime,
        submitInterval,
        deviceId,
        guid,
        submitDateTime,
        submitDate,
        signature,
        supervisorName,
        remark,
        barcode,
        isSync,
        isSyncing,
        logsheets,
        submitImages,
        isOnOff
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogsheetTransactionData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.companyId == this.companyId &&
          other.companyName == this.companyName &&
          other.locationId == this.locationId &&
          other.locationName == this.locationName &&
          other.buildingId == this.buildingId &&
          other.buildingName == this.buildingName &&
          other.floorId == this.floorId &&
          other.floorName == this.floorName &&
          other.wingId == this.wingId &&
          other.wingName == this.wingName &&
          other.sectorId == this.sectorId &&
          other.auditId == this.auditId &&
          other.auditName == this.auditName &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName &&
          other.equipmentTemplateId == this.equipmentTemplateId &&
          other.equipmentId == this.equipmentId &&
          other.slotId == this.slotId &&
          other.submitStartTime == this.submitStartTime &&
          other.submitEndTime == this.submitEndTime &&
          other.submitInterval == this.submitInterval &&
          other.deviceId == this.deviceId &&
          other.guid == this.guid &&
          other.submitDateTime == this.submitDateTime &&
          other.submitDate == this.submitDate &&
          other.signature == this.signature &&
          other.supervisorName == this.supervisorName &&
          other.remark == this.remark &&
          other.barcode == this.barcode &&
          other.isSync == this.isSync &&
          other.isSyncing == this.isSyncing &&
          other.logsheets == this.logsheets &&
          other.submitImages == this.submitImages &&
          other.isOnOff == this.isOnOff);
}

class LogsheetTransactionCompanion
    extends UpdateCompanion<LogsheetTransactionData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> companyId;
  final Value<String> companyName;
  final Value<int> locationId;
  final Value<String> locationName;
  final Value<int> buildingId;
  final Value<String> buildingName;
  final Value<int> floorId;
  final Value<String> floorName;
  final Value<int> wingId;
  final Value<String> wingName;
  final Value<int> sectorId;
  final Value<int> auditId;
  final Value<String> auditName;
  final Value<int> categoryId;
  final Value<String> categoryName;
  final Value<int> equipmentTemplateId;
  final Value<int> equipmentId;
  final Value<int> slotId;
  final Value<String> submitStartTime;
  final Value<String> submitEndTime;
  final Value<int> submitInterval;
  final Value<String> deviceId;
  final Value<String> guid;
  final Value<String> submitDateTime;
  final Value<String> submitDate;
  final Value<String> signature;
  final Value<String> supervisorName;
  final Value<String> remark;
  final Value<String> barcode;
  final Value<bool> isSync;
  final Value<bool> isSyncing;
  final Value<String> logsheets;
  final Value<String> submitImages;
  final Value<bool> isOnOff;
  const LogsheetTransactionCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.companyName = const Value.absent(),
    this.locationId = const Value.absent(),
    this.locationName = const Value.absent(),
    this.buildingId = const Value.absent(),
    this.buildingName = const Value.absent(),
    this.floorId = const Value.absent(),
    this.floorName = const Value.absent(),
    this.wingId = const Value.absent(),
    this.wingName = const Value.absent(),
    this.sectorId = const Value.absent(),
    this.auditId = const Value.absent(),
    this.auditName = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.equipmentTemplateId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.slotId = const Value.absent(),
    this.submitStartTime = const Value.absent(),
    this.submitEndTime = const Value.absent(),
    this.submitInterval = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.guid = const Value.absent(),
    this.submitDateTime = const Value.absent(),
    this.submitDate = const Value.absent(),
    this.signature = const Value.absent(),
    this.supervisorName = const Value.absent(),
    this.remark = const Value.absent(),
    this.barcode = const Value.absent(),
    this.isSync = const Value.absent(),
    this.isSyncing = const Value.absent(),
    this.logsheets = const Value.absent(),
    this.submitImages = const Value.absent(),
    this.isOnOff = const Value.absent(),
  });
  LogsheetTransactionCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int companyId,
    required String companyName,
    required int locationId,
    required String locationName,
    required int buildingId,
    required String buildingName,
    required int floorId,
    required String floorName,
    required int wingId,
    required String wingName,
    required int sectorId,
    required int auditId,
    required String auditName,
    required int categoryId,
    required String categoryName,
    required int equipmentTemplateId,
    required int equipmentId,
    required int slotId,
    required String submitStartTime,
    required String submitEndTime,
    required int submitInterval,
    required String deviceId,
    required String guid,
    required String submitDateTime,
    required String submitDate,
    required String signature,
    required String supervisorName,
    required String remark,
    required String barcode,
    this.isSync = const Value.absent(),
    this.isSyncing = const Value.absent(),
    required String logsheets,
    required String submitImages,
    required bool isOnOff,
  })  : userId = Value(userId),
        companyId = Value(companyId),
        companyName = Value(companyName),
        locationId = Value(locationId),
        locationName = Value(locationName),
        buildingId = Value(buildingId),
        buildingName = Value(buildingName),
        floorId = Value(floorId),
        floorName = Value(floorName),
        wingId = Value(wingId),
        wingName = Value(wingName),
        sectorId = Value(sectorId),
        auditId = Value(auditId),
        auditName = Value(auditName),
        categoryId = Value(categoryId),
        categoryName = Value(categoryName),
        equipmentTemplateId = Value(equipmentTemplateId),
        equipmentId = Value(equipmentId),
        slotId = Value(slotId),
        submitStartTime = Value(submitStartTime),
        submitEndTime = Value(submitEndTime),
        submitInterval = Value(submitInterval),
        deviceId = Value(deviceId),
        guid = Value(guid),
        submitDateTime = Value(submitDateTime),
        submitDate = Value(submitDate),
        signature = Value(signature),
        supervisorName = Value(supervisorName),
        remark = Value(remark),
        barcode = Value(barcode),
        logsheets = Value(logsheets),
        submitImages = Value(submitImages),
        isOnOff = Value(isOnOff);
  static Insertable<LogsheetTransactionData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? companyId,
    Expression<String>? companyName,
    Expression<int>? locationId,
    Expression<String>? locationName,
    Expression<int>? buildingId,
    Expression<String>? buildingName,
    Expression<int>? floorId,
    Expression<String>? floorName,
    Expression<int>? wingId,
    Expression<String>? wingName,
    Expression<int>? sectorId,
    Expression<int>? auditId,
    Expression<String>? auditName,
    Expression<int>? categoryId,
    Expression<String>? categoryName,
    Expression<int>? equipmentTemplateId,
    Expression<int>? equipmentId,
    Expression<int>? slotId,
    Expression<String>? submitStartTime,
    Expression<String>? submitEndTime,
    Expression<int>? submitInterval,
    Expression<String>? deviceId,
    Expression<String>? guid,
    Expression<String>? submitDateTime,
    Expression<String>? submitDate,
    Expression<String>? signature,
    Expression<String>? supervisorName,
    Expression<String>? remark,
    Expression<String>? barcode,
    Expression<bool>? isSync,
    Expression<bool>? isSyncing,
    Expression<String>? logsheets,
    Expression<String>? submitImages,
    Expression<bool>? isOnOff,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (companyId != null) 'company_id': companyId,
      if (companyName != null) 'company_name': companyName,
      if (locationId != null) 'location_id': locationId,
      if (locationName != null) 'location_name': locationName,
      if (buildingId != null) 'building_id': buildingId,
      if (buildingName != null) 'building_name': buildingName,
      if (floorId != null) 'floor_id': floorId,
      if (floorName != null) 'floor_name': floorName,
      if (wingId != null) 'wing_id': wingId,
      if (wingName != null) 'wing_name': wingName,
      if (sectorId != null) 'sector_id': sectorId,
      if (auditId != null) 'audit_id': auditId,
      if (auditName != null) 'audit_name': auditName,
      if (categoryId != null) 'category_id': categoryId,
      if (categoryName != null) 'category_name': categoryName,
      if (equipmentTemplateId != null)
        'equipment_template_id': equipmentTemplateId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (slotId != null) 'slot_id': slotId,
      if (submitStartTime != null) 'submit_start_time': submitStartTime,
      if (submitEndTime != null) 'submit_end_time': submitEndTime,
      if (submitInterval != null) 'submit_interval': submitInterval,
      if (deviceId != null) 'device_id': deviceId,
      if (guid != null) 'guid': guid,
      if (submitDateTime != null) 'submit_date_time': submitDateTime,
      if (submitDate != null) 'submit_date': submitDate,
      if (signature != null) 'signature': signature,
      if (supervisorName != null) 'supervisor_name': supervisorName,
      if (remark != null) 'remark': remark,
      if (barcode != null) 'barcode': barcode,
      if (isSync != null) 'is_sync': isSync,
      if (isSyncing != null) 'is_syncing': isSyncing,
      if (logsheets != null) 'logsheets': logsheets,
      if (submitImages != null) 'submit_images': submitImages,
      if (isOnOff != null) 'is_on_off': isOnOff,
    });
  }

  LogsheetTransactionCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? companyId,
      Value<String>? companyName,
      Value<int>? locationId,
      Value<String>? locationName,
      Value<int>? buildingId,
      Value<String>? buildingName,
      Value<int>? floorId,
      Value<String>? floorName,
      Value<int>? wingId,
      Value<String>? wingName,
      Value<int>? sectorId,
      Value<int>? auditId,
      Value<String>? auditName,
      Value<int>? categoryId,
      Value<String>? categoryName,
      Value<int>? equipmentTemplateId,
      Value<int>? equipmentId,
      Value<int>? slotId,
      Value<String>? submitStartTime,
      Value<String>? submitEndTime,
      Value<int>? submitInterval,
      Value<String>? deviceId,
      Value<String>? guid,
      Value<String>? submitDateTime,
      Value<String>? submitDate,
      Value<String>? signature,
      Value<String>? supervisorName,
      Value<String>? remark,
      Value<String>? barcode,
      Value<bool>? isSync,
      Value<bool>? isSyncing,
      Value<String>? logsheets,
      Value<String>? submitImages,
      Value<bool>? isOnOff}) {
    return LogsheetTransactionCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      buildingId: buildingId ?? this.buildingId,
      buildingName: buildingName ?? this.buildingName,
      floorId: floorId ?? this.floorId,
      floorName: floorName ?? this.floorName,
      wingId: wingId ?? this.wingId,
      wingName: wingName ?? this.wingName,
      sectorId: sectorId ?? this.sectorId,
      auditId: auditId ?? this.auditId,
      auditName: auditName ?? this.auditName,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      equipmentTemplateId: equipmentTemplateId ?? this.equipmentTemplateId,
      equipmentId: equipmentId ?? this.equipmentId,
      slotId: slotId ?? this.slotId,
      submitStartTime: submitStartTime ?? this.submitStartTime,
      submitEndTime: submitEndTime ?? this.submitEndTime,
      submitInterval: submitInterval ?? this.submitInterval,
      deviceId: deviceId ?? this.deviceId,
      guid: guid ?? this.guid,
      submitDateTime: submitDateTime ?? this.submitDateTime,
      submitDate: submitDate ?? this.submitDate,
      signature: signature ?? this.signature,
      supervisorName: supervisorName ?? this.supervisorName,
      remark: remark ?? this.remark,
      barcode: barcode ?? this.barcode,
      isSync: isSync ?? this.isSync,
      isSyncing: isSyncing ?? this.isSyncing,
      logsheets: logsheets ?? this.logsheets,
      submitImages: submitImages ?? this.submitImages,
      isOnOff: isOnOff ?? this.isOnOff,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (buildingId.present) {
      map['building_id'] = Variable<int>(buildingId.value);
    }
    if (buildingName.present) {
      map['building_name'] = Variable<String>(buildingName.value);
    }
    if (floorId.present) {
      map['floor_id'] = Variable<int>(floorId.value);
    }
    if (floorName.present) {
      map['floor_name'] = Variable<String>(floorName.value);
    }
    if (wingId.present) {
      map['wing_id'] = Variable<int>(wingId.value);
    }
    if (wingName.present) {
      map['wing_name'] = Variable<String>(wingName.value);
    }
    if (sectorId.present) {
      map['sector_id'] = Variable<int>(sectorId.value);
    }
    if (auditId.present) {
      map['audit_id'] = Variable<int>(auditId.value);
    }
    if (auditName.present) {
      map['audit_name'] = Variable<String>(auditName.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (equipmentTemplateId.present) {
      map['equipment_template_id'] = Variable<int>(equipmentTemplateId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (submitStartTime.present) {
      map['submit_start_time'] = Variable<String>(submitStartTime.value);
    }
    if (submitEndTime.present) {
      map['submit_end_time'] = Variable<String>(submitEndTime.value);
    }
    if (submitInterval.present) {
      map['submit_interval'] = Variable<int>(submitInterval.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (submitDateTime.present) {
      map['submit_date_time'] = Variable<String>(submitDateTime.value);
    }
    if (submitDate.present) {
      map['submit_date'] = Variable<String>(submitDate.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (supervisorName.present) {
      map['supervisor_name'] = Variable<String>(supervisorName.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    if (logsheets.present) {
      map['logsheets'] = Variable<String>(logsheets.value);
    }
    if (submitImages.present) {
      map['submit_images'] = Variable<String>(submitImages.value);
    }
    if (isOnOff.present) {
      map['is_on_off'] = Variable<bool>(isOnOff.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogsheetTransactionCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('companyId: $companyId, ')
          ..write('companyName: $companyName, ')
          ..write('locationId: $locationId, ')
          ..write('locationName: $locationName, ')
          ..write('buildingId: $buildingId, ')
          ..write('buildingName: $buildingName, ')
          ..write('floorId: $floorId, ')
          ..write('floorName: $floorName, ')
          ..write('wingId: $wingId, ')
          ..write('wingName: $wingName, ')
          ..write('sectorId: $sectorId, ')
          ..write('auditId: $auditId, ')
          ..write('auditName: $auditName, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('equipmentTemplateId: $equipmentTemplateId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('slotId: $slotId, ')
          ..write('submitStartTime: $submitStartTime, ')
          ..write('submitEndTime: $submitEndTime, ')
          ..write('submitInterval: $submitInterval, ')
          ..write('deviceId: $deviceId, ')
          ..write('guid: $guid, ')
          ..write('submitDateTime: $submitDateTime, ')
          ..write('submitDate: $submitDate, ')
          ..write('signature: $signature, ')
          ..write('supervisorName: $supervisorName, ')
          ..write('remark: $remark, ')
          ..write('barcode: $barcode, ')
          ..write('isSync: $isSync, ')
          ..write('isSyncing: $isSyncing, ')
          ..write('logsheets: $logsheets, ')
          ..write('submitImages: $submitImages, ')
          ..write('isOnOff: $isOnOff')
          ..write(')'))
        .toString();
  }
}

class $LogsheetTransactionTable extends LogsheetTransaction
    with TableInfo<$LogsheetTransactionTable, LogsheetTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogsheetTransactionTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
      'company_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _buildingIdMeta = const VerificationMeta('buildingId');
  @override
  late final GeneratedColumn<int> buildingId = GeneratedColumn<int>(
      'building_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _buildingNameMeta =
      const VerificationMeta('buildingName');
  @override
  late final GeneratedColumn<String> buildingName = GeneratedColumn<String>(
      'building_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _floorIdMeta = const VerificationMeta('floorId');
  @override
  late final GeneratedColumn<int> floorId = GeneratedColumn<int>(
      'floor_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _floorNameMeta = const VerificationMeta('floorName');
  @override
  late final GeneratedColumn<String> floorName = GeneratedColumn<String>(
      'floor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _wingIdMeta = const VerificationMeta('wingId');
  @override
  late final GeneratedColumn<int> wingId = GeneratedColumn<int>(
      'wing_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _wingNameMeta = const VerificationMeta('wingName');
  @override
  late final GeneratedColumn<String> wingName = GeneratedColumn<String>(
      'wing_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _sectorIdMeta = const VerificationMeta('sectorId');
  @override
  late final GeneratedColumn<int> sectorId = GeneratedColumn<int>(
      'sector_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditIdMeta = const VerificationMeta('auditId');
  @override
  late final GeneratedColumn<int> auditId = GeneratedColumn<int>(
      'audit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditNameMeta = const VerificationMeta('auditName');
  @override
  late final GeneratedColumn<String> auditName = GeneratedColumn<String>(
      'audit_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipmentTemplateIdMeta =
      const VerificationMeta('equipmentTemplateId');
  @override
  late final GeneratedColumn<int> equipmentTemplateId = GeneratedColumn<int>(
      'equipment_template_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
      'slot_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _submitStartTimeMeta =
      const VerificationMeta('submitStartTime');
  @override
  late final GeneratedColumn<String> submitStartTime = GeneratedColumn<String>(
      'submit_start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitEndTimeMeta =
      const VerificationMeta('submitEndTime');
  @override
  late final GeneratedColumn<String> submitEndTime = GeneratedColumn<String>(
      'submit_end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitIntervalMeta =
      const VerificationMeta('submitInterval');
  @override
  late final GeneratedColumn<int> submitInterval = GeneratedColumn<int>(
      'submit_interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _deviceIdMeta = const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitDateTimeMeta =
      const VerificationMeta('submitDateTime');
  @override
  late final GeneratedColumn<String> submitDateTime = GeneratedColumn<String>(
      'submit_date_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitDateMeta = const VerificationMeta('submitDate');
  @override
  late final GeneratedColumn<String> submitDate = GeneratedColumn<String>(
      'submit_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _signatureMeta = const VerificationMeta('signature');
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
      'signature', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _supervisorNameMeta =
      const VerificationMeta('supervisorName');
  @override
  late final GeneratedColumn<String> supervisorName = GeneratedColumn<String>(
      'supervisor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
      'remark', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _barcodeMeta = const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool> isSync = GeneratedColumn<bool>(
      'is_sync', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("is_sync" IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isSyncingMeta = const VerificationMeta('isSyncing');
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
      'is_syncing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("is_syncing" IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _logsheetsMeta = const VerificationMeta('logsheets');
  @override
  late final GeneratedColumn<String> logsheets = GeneratedColumn<String>(
      'logsheets', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _submitImagesMeta =
      const VerificationMeta('submitImages');
  @override
  late final GeneratedColumn<String> submitImages = GeneratedColumn<String>(
      'submit_images', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isOnOffMeta = const VerificationMeta('isOnOff');
  @override
  late final GeneratedColumn<bool> isOnOff = GeneratedColumn<bool>(
      'is_on_off', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_on_off" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        companyId,
        companyName,
        locationId,
        locationName,
        buildingId,
        buildingName,
        floorId,
        floorName,
        wingId,
        wingName,
        sectorId,
        auditId,
        auditName,
        categoryId,
        categoryName,
        equipmentTemplateId,
        equipmentId,
        slotId,
        submitStartTime,
        submitEndTime,
        submitInterval,
        deviceId,
        guid,
        submitDateTime,
        submitDate,
        signature,
        supervisorName,
        remark,
        barcode,
        isSync,
        isSyncing,
        logsheets,
        submitImages,
        isOnOff
      ];
  @override
  String get aliasedName => _alias ?? 'logsheet_transaction';
  @override
  String get actualTableName => 'logsheet_transaction';
  @override
  VerificationContext validateIntegrity(
      Insertable<LogsheetTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('building_id')) {
      context.handle(
          _buildingIdMeta,
          buildingId.isAcceptableOrUnknown(
              data['building_id']!, _buildingIdMeta));
    } else if (isInserting) {
      context.missing(_buildingIdMeta);
    }
    if (data.containsKey('building_name')) {
      context.handle(
          _buildingNameMeta,
          buildingName.isAcceptableOrUnknown(
              data['building_name']!, _buildingNameMeta));
    } else if (isInserting) {
      context.missing(_buildingNameMeta);
    }
    if (data.containsKey('floor_id')) {
      context.handle(_floorIdMeta,
          floorId.isAcceptableOrUnknown(data['floor_id']!, _floorIdMeta));
    } else if (isInserting) {
      context.missing(_floorIdMeta);
    }
    if (data.containsKey('floor_name')) {
      context.handle(_floorNameMeta,
          floorName.isAcceptableOrUnknown(data['floor_name']!, _floorNameMeta));
    } else if (isInserting) {
      context.missing(_floorNameMeta);
    }
    if (data.containsKey('wing_id')) {
      context.handle(_wingIdMeta,
          wingId.isAcceptableOrUnknown(data['wing_id']!, _wingIdMeta));
    } else if (isInserting) {
      context.missing(_wingIdMeta);
    }
    if (data.containsKey('wing_name')) {
      context.handle(_wingNameMeta,
          wingName.isAcceptableOrUnknown(data['wing_name']!, _wingNameMeta));
    } else if (isInserting) {
      context.missing(_wingNameMeta);
    }
    if (data.containsKey('sector_id')) {
      context.handle(_sectorIdMeta,
          sectorId.isAcceptableOrUnknown(data['sector_id']!, _sectorIdMeta));
    } else if (isInserting) {
      context.missing(_sectorIdMeta);
    }
    if (data.containsKey('audit_id')) {
      context.handle(_auditIdMeta,
          auditId.isAcceptableOrUnknown(data['audit_id']!, _auditIdMeta));
    } else if (isInserting) {
      context.missing(_auditIdMeta);
    }
    if (data.containsKey('audit_name')) {
      context.handle(_auditNameMeta,
          auditName.isAcceptableOrUnknown(data['audit_name']!, _auditNameMeta));
    } else if (isInserting) {
      context.missing(_auditNameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('equipment_template_id')) {
      context.handle(
          _equipmentTemplateIdMeta,
          equipmentTemplateId.isAcceptableOrUnknown(
              data['equipment_template_id']!, _equipmentTemplateIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentTemplateIdMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('slot_id')) {
      context.handle(_slotIdMeta,
          slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta));
    } else if (isInserting) {
      context.missing(_slotIdMeta);
    }
    if (data.containsKey('submit_start_time')) {
      context.handle(
          _submitStartTimeMeta,
          submitStartTime.isAcceptableOrUnknown(
              data['submit_start_time']!, _submitStartTimeMeta));
    } else if (isInserting) {
      context.missing(_submitStartTimeMeta);
    }
    if (data.containsKey('submit_end_time')) {
      context.handle(
          _submitEndTimeMeta,
          submitEndTime.isAcceptableOrUnknown(
              data['submit_end_time']!, _submitEndTimeMeta));
    } else if (isInserting) {
      context.missing(_submitEndTimeMeta);
    }
    if (data.containsKey('submit_interval')) {
      context.handle(
          _submitIntervalMeta,
          submitInterval.isAcceptableOrUnknown(
              data['submit_interval']!, _submitIntervalMeta));
    } else if (isInserting) {
      context.missing(_submitIntervalMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('submit_date_time')) {
      context.handle(
          _submitDateTimeMeta,
          submitDateTime.isAcceptableOrUnknown(
              data['submit_date_time']!, _submitDateTimeMeta));
    } else if (isInserting) {
      context.missing(_submitDateTimeMeta);
    }
    if (data.containsKey('submit_date')) {
      context.handle(
          _submitDateMeta,
          submitDate.isAcceptableOrUnknown(
              data['submit_date']!, _submitDateMeta));
    } else if (isInserting) {
      context.missing(_submitDateMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    } else if (isInserting) {
      context.missing(_signatureMeta);
    }
    if (data.containsKey('supervisor_name')) {
      context.handle(
          _supervisorNameMeta,
          supervisorName.isAcceptableOrUnknown(
              data['supervisor_name']!, _supervisorNameMeta));
    } else if (isInserting) {
      context.missing(_supervisorNameMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    }
    if (data.containsKey('is_syncing')) {
      context.handle(_isSyncingMeta,
          isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta));
    }
    if (data.containsKey('logsheets')) {
      context.handle(_logsheetsMeta,
          logsheets.isAcceptableOrUnknown(data['logsheets']!, _logsheetsMeta));
    } else if (isInserting) {
      context.missing(_logsheetsMeta);
    }
    if (data.containsKey('submit_images')) {
      context.handle(
          _submitImagesMeta,
          submitImages.isAcceptableOrUnknown(
              data['submit_images']!, _submitImagesMeta));
    } else if (isInserting) {
      context.missing(_submitImagesMeta);
    }
    if (data.containsKey('is_on_off')) {
      context.handle(_isOnOffMeta,
          isOnOff.isAcceptableOrUnknown(data['is_on_off']!, _isOnOffMeta));
    } else if (isInserting) {
      context.missing(_isOnOffMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogsheetTransactionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogsheetTransactionData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      companyId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}company_id'])!,
      companyName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      locationId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}location_id'])!,
      locationName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}location_name'])!,
      buildingId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}building_id'])!,
      buildingName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}building_name'])!,
      floorId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}floor_id'])!,
      floorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}floor_name'])!,
      wingId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}wing_id'])!,
      wingName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}wing_name'])!,
      sectorId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sector_id'])!,
      auditId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}audit_id'])!,
      auditName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}audit_name'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      categoryName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}category_name'])!,
      equipmentTemplateId: attachedDatabase.options.types.read(
          DriftSqlType.int, data['${effectivePrefix}equipment_template_id'])!,
      equipmentId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id'])!,
      slotId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}slot_id'])!,
      submitStartTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_start_time'])!,
      submitEndTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_end_time'])!,
      submitInterval: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}submit_interval'])!,
      deviceId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      submitDateTime: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}submit_date_time'])!,
      submitDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}submit_date'])!,
      signature: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}signature'])!,
      supervisorName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}supervisor_name'])!,
      remark: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}remark'])!,
      barcode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
      isSync: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sync'])!,
      isSyncing: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_syncing'])!,
      logsheets: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}logsheets'])!,
      submitImages: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}submit_images'])!,
      isOnOff: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_on_off'])!,
    );
  }

  @override
  $LogsheetTransactionTable createAlias(String alias) {
    return $LogsheetTransactionTable(attachedDatabase, alias);
  }
}

class ParameterData extends DataClass implements Insertable<ParameterData> {
  final int id;
  final bool issubparamavailable;
  final String guid;
  final String templatename;
  final String equipmentname;
  final String parametername;
  final String ParameterLimits;
  final int userid;
  final int auditid;
  final int buildingid;
  final int locationid;
  final int equipmentparamid;
  final int equipmentnameid;
  final int equipmenttemplateid;
  const ParameterData(
      {required this.id,
      required this.issubparamavailable,
      required this.guid,
      required this.templatename,
      required this.equipmentname,
      required this.parametername,
      required this.ParameterLimits,
      required this.userid,
      required this.auditid,
      required this.buildingid,
      required this.locationid,
      required this.equipmentparamid,
      required this.equipmentnameid,
      required this.equipmenttemplateid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['issubparamavailable'] = Variable<bool>(issubparamavailable);
    map['guid'] = Variable<String>(guid);
    map['templatename'] = Variable<String>(templatename);
    map['equipmentname'] = Variable<String>(equipmentname);
    map['parametername'] = Variable<String>(parametername);
    map['parameter_limits'] = Variable<String>(ParameterLimits);
    map['userid'] = Variable<int>(userid);
    map['auditid'] = Variable<int>(auditid);
    map['buildingid'] = Variable<int>(buildingid);
    map['locationid'] = Variable<int>(locationid);
    map['equipmentparamid'] = Variable<int>(equipmentparamid);
    map['equipmentnameid'] = Variable<int>(equipmentnameid);
    map['equipmenttemplateid'] = Variable<int>(equipmenttemplateid);
    return map;
  }

  ParameterCompanion toCompanion(bool nullToAbsent) {
    return ParameterCompanion(
      id: Value(id),
      issubparamavailable: Value(issubparamavailable),
      guid: Value(guid),
      templatename: Value(templatename),
      equipmentname: Value(equipmentname),
      parametername: Value(parametername),
      ParameterLimits: Value(ParameterLimits),
      userid: Value(userid),
      auditid: Value(auditid),
      buildingid: Value(buildingid),
      locationid: Value(locationid),
      equipmentparamid: Value(equipmentparamid),
      equipmentnameid: Value(equipmentnameid),
      equipmenttemplateid: Value(equipmenttemplateid),
    );
  }

  factory ParameterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParameterData(
      id: serializer.fromJson<int>(json['id']),
      issubparamavailable:
          serializer.fromJson<bool>(json['issubparamavailable']),
      guid: serializer.fromJson<String>(json['guid']),
      templatename: serializer.fromJson<String>(json['templatename']),
      equipmentname: serializer.fromJson<String>(json['equipmentname']),
      parametername: serializer.fromJson<String>(json['parametername']),
      ParameterLimits: serializer.fromJson<String>(json['ParameterLimits']),
      userid: serializer.fromJson<int>(json['userid']),
      auditid: serializer.fromJson<int>(json['auditid']),
      buildingid: serializer.fromJson<int>(json['buildingid']),
      locationid: serializer.fromJson<int>(json['locationid']),
      equipmentparamid: serializer.fromJson<int>(json['equipmentparamid']),
      equipmentnameid: serializer.fromJson<int>(json['equipmentnameid']),
      equipmenttemplateid:
          serializer.fromJson<int>(json['equipmenttemplateid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'issubparamavailable': serializer.toJson<bool>(issubparamavailable),
      'guid': serializer.toJson<String>(guid),
      'templatename': serializer.toJson<String>(templatename),
      'equipmentname': serializer.toJson<String>(equipmentname),
      'parametername': serializer.toJson<String>(parametername),
      'ParameterLimits': serializer.toJson<String>(ParameterLimits),
      'userid': serializer.toJson<int>(userid),
      'auditid': serializer.toJson<int>(auditid),
      'buildingid': serializer.toJson<int>(buildingid),
      'locationid': serializer.toJson<int>(locationid),
      'equipmentparamid': serializer.toJson<int>(equipmentparamid),
      'equipmentnameid': serializer.toJson<int>(equipmentnameid),
      'equipmenttemplateid': serializer.toJson<int>(equipmenttemplateid),
    };
  }

  ParameterData copyWith(
          {int? id,
          bool? issubparamavailable,
          String? guid,
          String? templatename,
          String? equipmentname,
          String? parametername,
          String? ParameterLimits,
          int? userid,
          int? auditid,
          int? buildingid,
          int? locationid,
          int? equipmentparamid,
          int? equipmentnameid,
          int? equipmenttemplateid}) =>
      ParameterData(
        id: id ?? this.id,
        issubparamavailable: issubparamavailable ?? this.issubparamavailable,
        guid: guid ?? this.guid,
        templatename: templatename ?? this.templatename,
        equipmentname: equipmentname ?? this.equipmentname,
        parametername: parametername ?? this.parametername,
        ParameterLimits: ParameterLimits ?? this.ParameterLimits,
        userid: userid ?? this.userid,
        auditid: auditid ?? this.auditid,
        buildingid: buildingid ?? this.buildingid,
        locationid: locationid ?? this.locationid,
        equipmentparamid: equipmentparamid ?? this.equipmentparamid,
        equipmentnameid: equipmentnameid ?? this.equipmentnameid,
        equipmenttemplateid: equipmenttemplateid ?? this.equipmenttemplateid,
      );
  @override
  String toString() {
    return (StringBuffer('ParameterData(')
          ..write('id: $id, ')
          ..write('issubparamavailable: $issubparamavailable, ')
          ..write('guid: $guid, ')
          ..write('templatename: $templatename, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('parametername: $parametername, ')
          ..write('ParameterLimits: $ParameterLimits, ')
          ..write('userid: $userid, ')
          ..write('auditid: $auditid, ')
          ..write('buildingid: $buildingid, ')
          ..write('locationid: $locationid, ')
          ..write('equipmentparamid: $equipmentparamid, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('equipmenttemplateid: $equipmenttemplateid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      issubparamavailable,
      guid,
      templatename,
      equipmentname,
      parametername,
      ParameterLimits,
      userid,
      auditid,
      buildingid,
      locationid,
      equipmentparamid,
      equipmentnameid,
      equipmenttemplateid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParameterData &&
          other.id == this.id &&
          other.issubparamavailable == this.issubparamavailable &&
          other.guid == this.guid &&
          other.templatename == this.templatename &&
          other.equipmentname == this.equipmentname &&
          other.parametername == this.parametername &&
          other.ParameterLimits == this.ParameterLimits &&
          other.userid == this.userid &&
          other.auditid == this.auditid &&
          other.buildingid == this.buildingid &&
          other.locationid == this.locationid &&
          other.equipmentparamid == this.equipmentparamid &&
          other.equipmentnameid == this.equipmentnameid &&
          other.equipmenttemplateid == this.equipmenttemplateid);
}

class ParameterCompanion extends UpdateCompanion<ParameterData> {
  final Value<int> id;
  final Value<bool> issubparamavailable;
  final Value<String> guid;
  final Value<String> templatename;
  final Value<String> equipmentname;
  final Value<String> parametername;
  final Value<String> ParameterLimits;
  final Value<int> userid;
  final Value<int> auditid;
  final Value<int> buildingid;
  final Value<int> locationid;
  final Value<int> equipmentparamid;
  final Value<int> equipmentnameid;
  final Value<int> equipmenttemplateid;
  const ParameterCompanion({
    this.id = const Value.absent(),
    this.issubparamavailable = const Value.absent(),
    this.guid = const Value.absent(),
    this.templatename = const Value.absent(),
    this.equipmentname = const Value.absent(),
    this.parametername = const Value.absent(),
    this.ParameterLimits = const Value.absent(),
    this.userid = const Value.absent(),
    this.auditid = const Value.absent(),
    this.buildingid = const Value.absent(),
    this.locationid = const Value.absent(),
    this.equipmentparamid = const Value.absent(),
    this.equipmentnameid = const Value.absent(),
    this.equipmenttemplateid = const Value.absent(),
  });
  ParameterCompanion.insert({
    this.id = const Value.absent(),
    required bool issubparamavailable,
    required String guid,
    required String templatename,
    required String equipmentname,
    required String parametername,
    required String ParameterLimits,
    required int userid,
    required int auditid,
    required int buildingid,
    required int locationid,
    required int equipmentparamid,
    required int equipmentnameid,
    required int equipmenttemplateid,
  })  : issubparamavailable = Value(issubparamavailable),
        guid = Value(guid),
        templatename = Value(templatename),
        equipmentname = Value(equipmentname),
        parametername = Value(parametername),
        ParameterLimits = Value(ParameterLimits),
        userid = Value(userid),
        auditid = Value(auditid),
        buildingid = Value(buildingid),
        locationid = Value(locationid),
        equipmentparamid = Value(equipmentparamid),
        equipmentnameid = Value(equipmentnameid),
        equipmenttemplateid = Value(equipmenttemplateid);
  static Insertable<ParameterData> custom({
    Expression<int>? id,
    Expression<bool>? issubparamavailable,
    Expression<String>? guid,
    Expression<String>? templatename,
    Expression<String>? equipmentname,
    Expression<String>? parametername,
    Expression<String>? ParameterLimits,
    Expression<int>? userid,
    Expression<int>? auditid,
    Expression<int>? buildingid,
    Expression<int>? locationid,
    Expression<int>? equipmentparamid,
    Expression<int>? equipmentnameid,
    Expression<int>? equipmenttemplateid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (issubparamavailable != null)
        'issubparamavailable': issubparamavailable,
      if (guid != null) 'guid': guid,
      if (templatename != null) 'templatename': templatename,
      if (equipmentname != null) 'equipmentname': equipmentname,
      if (parametername != null) 'parametername': parametername,
      if (ParameterLimits != null) 'parameter_limits': ParameterLimits,
      if (userid != null) 'userid': userid,
      if (auditid != null) 'auditid': auditid,
      if (buildingid != null) 'buildingid': buildingid,
      if (locationid != null) 'locationid': locationid,
      if (equipmentparamid != null) 'equipmentparamid': equipmentparamid,
      if (equipmentnameid != null) 'equipmentnameid': equipmentnameid,
      if (equipmenttemplateid != null)
        'equipmenttemplateid': equipmenttemplateid,
    });
  }

  ParameterCompanion copyWith(
      {Value<int>? id,
      Value<bool>? issubparamavailable,
      Value<String>? guid,
      Value<String>? templatename,
      Value<String>? equipmentname,
      Value<String>? parametername,
      Value<String>? ParameterLimits,
      Value<int>? userid,
      Value<int>? auditid,
      Value<int>? buildingid,
      Value<int>? locationid,
      Value<int>? equipmentparamid,
      Value<int>? equipmentnameid,
      Value<int>? equipmenttemplateid}) {
    return ParameterCompanion(
      id: id ?? this.id,
      issubparamavailable: issubparamavailable ?? this.issubparamavailable,
      guid: guid ?? this.guid,
      templatename: templatename ?? this.templatename,
      equipmentname: equipmentname ?? this.equipmentname,
      parametername: parametername ?? this.parametername,
      ParameterLimits: ParameterLimits ?? this.ParameterLimits,
      userid: userid ?? this.userid,
      auditid: auditid ?? this.auditid,
      buildingid: buildingid ?? this.buildingid,
      locationid: locationid ?? this.locationid,
      equipmentparamid: equipmentparamid ?? this.equipmentparamid,
      equipmentnameid: equipmentnameid ?? this.equipmentnameid,
      equipmenttemplateid: equipmenttemplateid ?? this.equipmenttemplateid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (issubparamavailable.present) {
      map['issubparamavailable'] = Variable<bool>(issubparamavailable.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (templatename.present) {
      map['templatename'] = Variable<String>(templatename.value);
    }
    if (equipmentname.present) {
      map['equipmentname'] = Variable<String>(equipmentname.value);
    }
    if (parametername.present) {
      map['parametername'] = Variable<String>(parametername.value);
    }
    if (ParameterLimits.present) {
      map['parameter_limits'] = Variable<String>(ParameterLimits.value);
    }
    if (userid.present) {
      map['userid'] = Variable<int>(userid.value);
    }
    if (auditid.present) {
      map['auditid'] = Variable<int>(auditid.value);
    }
    if (buildingid.present) {
      map['buildingid'] = Variable<int>(buildingid.value);
    }
    if (locationid.present) {
      map['locationid'] = Variable<int>(locationid.value);
    }
    if (equipmentparamid.present) {
      map['equipmentparamid'] = Variable<int>(equipmentparamid.value);
    }
    if (equipmentnameid.present) {
      map['equipmentnameid'] = Variable<int>(equipmentnameid.value);
    }
    if (equipmenttemplateid.present) {
      map['equipmenttemplateid'] = Variable<int>(equipmenttemplateid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParameterCompanion(')
          ..write('id: $id, ')
          ..write('issubparamavailable: $issubparamavailable, ')
          ..write('guid: $guid, ')
          ..write('templatename: $templatename, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('parametername: $parametername, ')
          ..write('ParameterLimits: $ParameterLimits, ')
          ..write('userid: $userid, ')
          ..write('auditid: $auditid, ')
          ..write('buildingid: $buildingid, ')
          ..write('locationid: $locationid, ')
          ..write('equipmentparamid: $equipmentparamid, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('equipmenttemplateid: $equipmenttemplateid')
          ..write(')'))
        .toString();
  }
}

class $ParameterTable extends Parameter
    with TableInfo<$ParameterTable, ParameterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParameterTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _issubparamavailableMeta =
      const VerificationMeta('issubparamavailable');
  @override
  late final GeneratedColumn<bool> issubparamavailable = GeneratedColumn<bool>(
      'issubparamavailable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("issubparamavailable" IN (0, 1))');
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _templatenameMeta =
      const VerificationMeta('templatename');
  @override
  late final GeneratedColumn<String> templatename = GeneratedColumn<String>(
      'templatename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameMeta =
      const VerificationMeta('equipmentname');
  @override
  late final GeneratedColumn<String> equipmentname = GeneratedColumn<String>(
      'equipmentname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _parameternameMeta =
      const VerificationMeta('parametername');
  @override
  late final GeneratedColumn<String> parametername = GeneratedColumn<String>(
      'parametername', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _ParameterLimitsMeta =
      const VerificationMeta('ParameterLimits');
  @override
  late final GeneratedColumn<String> ParameterLimits = GeneratedColumn<String>(
      'parameter_limits', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _useridMeta = const VerificationMeta('userid');
  @override
  late final GeneratedColumn<int> userid = GeneratedColumn<int>(
      'userid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditidMeta = const VerificationMeta('auditid');
  @override
  late final GeneratedColumn<int> auditid = GeneratedColumn<int>(
      'auditid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _buildingidMeta = const VerificationMeta('buildingid');
  @override
  late final GeneratedColumn<int> buildingid = GeneratedColumn<int>(
      'buildingid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _locationidMeta = const VerificationMeta('locationid');
  @override
  late final GeneratedColumn<int> locationid = GeneratedColumn<int>(
      'locationid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentparamidMeta =
      const VerificationMeta('equipmentparamid');
  @override
  late final GeneratedColumn<int> equipmentparamid = GeneratedColumn<int>(
      'equipmentparamid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameidMeta =
      const VerificationMeta('equipmentnameid');
  @override
  late final GeneratedColumn<int> equipmentnameid = GeneratedColumn<int>(
      'equipmentnameid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmenttemplateidMeta =
      const VerificationMeta('equipmenttemplateid');
  @override
  late final GeneratedColumn<int> equipmenttemplateid = GeneratedColumn<int>(
      'equipmenttemplateid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        issubparamavailable,
        guid,
        templatename,
        equipmentname,
        parametername,
        ParameterLimits,
        userid,
        auditid,
        buildingid,
        locationid,
        equipmentparamid,
        equipmentnameid,
        equipmenttemplateid
      ];
  @override
  String get aliasedName => _alias ?? 'parameter';
  @override
  String get actualTableName => 'parameter';
  @override
  VerificationContext validateIntegrity(Insertable<ParameterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('issubparamavailable')) {
      context.handle(
          _issubparamavailableMeta,
          issubparamavailable.isAcceptableOrUnknown(
              data['issubparamavailable']!, _issubparamavailableMeta));
    } else if (isInserting) {
      context.missing(_issubparamavailableMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('templatename')) {
      context.handle(
          _templatenameMeta,
          templatename.isAcceptableOrUnknown(
              data['templatename']!, _templatenameMeta));
    } else if (isInserting) {
      context.missing(_templatenameMeta);
    }
    if (data.containsKey('equipmentname')) {
      context.handle(
          _equipmentnameMeta,
          equipmentname.isAcceptableOrUnknown(
              data['equipmentname']!, _equipmentnameMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameMeta);
    }
    if (data.containsKey('parametername')) {
      context.handle(
          _parameternameMeta,
          parametername.isAcceptableOrUnknown(
              data['parametername']!, _parameternameMeta));
    } else if (isInserting) {
      context.missing(_parameternameMeta);
    }
    if (data.containsKey('parameter_limits')) {
      context.handle(
          _ParameterLimitsMeta,
          ParameterLimits.isAcceptableOrUnknown(
              data['parameter_limits']!, _ParameterLimitsMeta));
    } else if (isInserting) {
      context.missing(_ParameterLimitsMeta);
    }
    if (data.containsKey('userid')) {
      context.handle(_useridMeta,
          userid.isAcceptableOrUnknown(data['userid']!, _useridMeta));
    } else if (isInserting) {
      context.missing(_useridMeta);
    }
    if (data.containsKey('auditid')) {
      context.handle(_auditidMeta,
          auditid.isAcceptableOrUnknown(data['auditid']!, _auditidMeta));
    } else if (isInserting) {
      context.missing(_auditidMeta);
    }
    if (data.containsKey('buildingid')) {
      context.handle(
          _buildingidMeta,
          buildingid.isAcceptableOrUnknown(
              data['buildingid']!, _buildingidMeta));
    } else if (isInserting) {
      context.missing(_buildingidMeta);
    }
    if (data.containsKey('locationid')) {
      context.handle(
          _locationidMeta,
          locationid.isAcceptableOrUnknown(
              data['locationid']!, _locationidMeta));
    } else if (isInserting) {
      context.missing(_locationidMeta);
    }
    if (data.containsKey('equipmentparamid')) {
      context.handle(
          _equipmentparamidMeta,
          equipmentparamid.isAcceptableOrUnknown(
              data['equipmentparamid']!, _equipmentparamidMeta));
    } else if (isInserting) {
      context.missing(_equipmentparamidMeta);
    }
    if (data.containsKey('equipmentnameid')) {
      context.handle(
          _equipmentnameidMeta,
          equipmentnameid.isAcceptableOrUnknown(
              data['equipmentnameid']!, _equipmentnameidMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameidMeta);
    }
    if (data.containsKey('equipmenttemplateid')) {
      context.handle(
          _equipmenttemplateidMeta,
          equipmenttemplateid.isAcceptableOrUnknown(
              data['equipmenttemplateid']!, _equipmenttemplateidMeta));
    } else if (isInserting) {
      context.missing(_equipmenttemplateidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParameterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParameterData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      issubparamavailable: attachedDatabase.options.types.read(
          DriftSqlType.bool, data['${effectivePrefix}issubparamavailable'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      templatename: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}templatename'])!,
      equipmentname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}equipmentname'])!,
      parametername: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}parametername'])!,
      ParameterLimits: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}parameter_limits'])!,
      userid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}userid'])!,
      auditid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}auditid'])!,
      buildingid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}buildingid'])!,
      locationid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}locationid'])!,
      equipmentparamid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipmentparamid'])!,
      equipmentnameid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipmentnameid'])!,
      equipmenttemplateid: attachedDatabase.options.types.read(
          DriftSqlType.int, data['${effectivePrefix}equipmenttemplateid'])!,
    );
  }

  @override
  $ParameterTable createAlias(String alias) {
    return $ParameterTable(attachedDatabase, alias);
  }
}

class QuestionData extends DataClass implements Insertable<QuestionData> {
  final int id;
  final bool isNightActivity;
  final bool isSaturdayReq;
  final bool isSundayReq;
  final String endtime;
  final String starttime;
  final String guid;
  final String imageBase64;
  final String questionimage;
  final String colourcode;
  final String enddate;
  final String categoryname;
  final String startdate;
  final String auditname;
  final String WingShortName;
  final String WingName;
  final String FloorShortName;
  final String FloorName;
  final String BuildingShortName;
  final String BuildingName;
  final String LocationName;
  final String CompanyName;
  final String auditqname;
  final int userid;
  final int interval;
  final int sectorid;
  final int score;
  final int scoreid;
  final int categoryid;
  final int auditid;
  final int WingID;
  final int FloorID;
  final int BuildingID;
  final int LocationID;
  final int CompanyID;
  final int auditqid;
  const QuestionData(
      {required this.id,
      required this.isNightActivity,
      required this.isSaturdayReq,
      required this.isSundayReq,
      required this.endtime,
      required this.starttime,
      required this.guid,
      required this.imageBase64,
      required this.questionimage,
      required this.colourcode,
      required this.enddate,
      required this.categoryname,
      required this.startdate,
      required this.auditname,
      required this.WingShortName,
      required this.WingName,
      required this.FloorShortName,
      required this.FloorName,
      required this.BuildingShortName,
      required this.BuildingName,
      required this.LocationName,
      required this.CompanyName,
      required this.auditqname,
      required this.userid,
      required this.interval,
      required this.sectorid,
      required this.score,
      required this.scoreid,
      required this.categoryid,
      required this.auditid,
      required this.WingID,
      required this.FloorID,
      required this.BuildingID,
      required this.LocationID,
      required this.CompanyID,
      required this.auditqid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_night_activity'] = Variable<bool>(isNightActivity);
    map['is_saturday_req'] = Variable<bool>(isSaturdayReq);
    map['is_sunday_req'] = Variable<bool>(isSundayReq);
    map['endtime'] = Variable<String>(endtime);
    map['starttime'] = Variable<String>(starttime);
    map['guid'] = Variable<String>(guid);
    map['image_base64'] = Variable<String>(imageBase64);
    map['questionimage'] = Variable<String>(questionimage);
    map['colourcode'] = Variable<String>(colourcode);
    map['enddate'] = Variable<String>(enddate);
    map['categoryname'] = Variable<String>(categoryname);
    map['startdate'] = Variable<String>(startdate);
    map['auditname'] = Variable<String>(auditname);
    map['wing_short_name'] = Variable<String>(WingShortName);
    map['wing_name'] = Variable<String>(WingName);
    map['floor_short_name'] = Variable<String>(FloorShortName);
    map['floor_name'] = Variable<String>(FloorName);
    map['building_short_name'] = Variable<String>(BuildingShortName);
    map['building_name'] = Variable<String>(BuildingName);
    map['location_name'] = Variable<String>(LocationName);
    map['company_name'] = Variable<String>(CompanyName);
    map['auditqname'] = Variable<String>(auditqname);
    map['userid'] = Variable<int>(userid);
    map['interval'] = Variable<int>(interval);
    map['sectorid'] = Variable<int>(sectorid);
    map['score'] = Variable<int>(score);
    map['scoreid'] = Variable<int>(scoreid);
    map['categoryid'] = Variable<int>(categoryid);
    map['auditid'] = Variable<int>(auditid);
    map['wing_i_d'] = Variable<int>(WingID);
    map['floor_i_d'] = Variable<int>(FloorID);
    map['building_i_d'] = Variable<int>(BuildingID);
    map['location_i_d'] = Variable<int>(LocationID);
    map['company_i_d'] = Variable<int>(CompanyID);
    map['auditqid'] = Variable<int>(auditqid);
    return map;
  }

  QuestionCompanion toCompanion(bool nullToAbsent) {
    return QuestionCompanion(
      id: Value(id),
      isNightActivity: Value(isNightActivity),
      isSaturdayReq: Value(isSaturdayReq),
      isSundayReq: Value(isSundayReq),
      endtime: Value(endtime),
      starttime: Value(starttime),
      guid: Value(guid),
      imageBase64: Value(imageBase64),
      questionimage: Value(questionimage),
      colourcode: Value(colourcode),
      enddate: Value(enddate),
      categoryname: Value(categoryname),
      startdate: Value(startdate),
      auditname: Value(auditname),
      WingShortName: Value(WingShortName),
      WingName: Value(WingName),
      FloorShortName: Value(FloorShortName),
      FloorName: Value(FloorName),
      BuildingShortName: Value(BuildingShortName),
      BuildingName: Value(BuildingName),
      LocationName: Value(LocationName),
      CompanyName: Value(CompanyName),
      auditqname: Value(auditqname),
      userid: Value(userid),
      interval: Value(interval),
      sectorid: Value(sectorid),
      score: Value(score),
      scoreid: Value(scoreid),
      categoryid: Value(categoryid),
      auditid: Value(auditid),
      WingID: Value(WingID),
      FloorID: Value(FloorID),
      BuildingID: Value(BuildingID),
      LocationID: Value(LocationID),
      CompanyID: Value(CompanyID),
      auditqid: Value(auditqid),
    );
  }

  factory QuestionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionData(
      id: serializer.fromJson<int>(json['id']),
      isNightActivity: serializer.fromJson<bool>(json['isNightActivity']),
      isSaturdayReq: serializer.fromJson<bool>(json['isSaturdayReq']),
      isSundayReq: serializer.fromJson<bool>(json['isSundayReq']),
      endtime: serializer.fromJson<String>(json['endtime']),
      starttime: serializer.fromJson<String>(json['starttime']),
      guid: serializer.fromJson<String>(json['guid']),
      imageBase64: serializer.fromJson<String>(json['imageBase64']),
      questionimage: serializer.fromJson<String>(json['questionimage']),
      colourcode: serializer.fromJson<String>(json['colourcode']),
      enddate: serializer.fromJson<String>(json['enddate']),
      categoryname: serializer.fromJson<String>(json['categoryname']),
      startdate: serializer.fromJson<String>(json['startdate']),
      auditname: serializer.fromJson<String>(json['auditname']),
      WingShortName: serializer.fromJson<String>(json['WingShortName']),
      WingName: serializer.fromJson<String>(json['WingName']),
      FloorShortName: serializer.fromJson<String>(json['FloorShortName']),
      FloorName: serializer.fromJson<String>(json['FloorName']),
      BuildingShortName: serializer.fromJson<String>(json['BuildingShortName']),
      BuildingName: serializer.fromJson<String>(json['BuildingName']),
      LocationName: serializer.fromJson<String>(json['LocationName']),
      CompanyName: serializer.fromJson<String>(json['CompanyName']),
      auditqname: serializer.fromJson<String>(json['auditqname']),
      userid: serializer.fromJson<int>(json['userid']),
      interval: serializer.fromJson<int>(json['interval']),
      sectorid: serializer.fromJson<int>(json['sectorid']),
      score: serializer.fromJson<int>(json['score']),
      scoreid: serializer.fromJson<int>(json['scoreid']),
      categoryid: serializer.fromJson<int>(json['categoryid']),
      auditid: serializer.fromJson<int>(json['auditid']),
      WingID: serializer.fromJson<int>(json['WingID']),
      FloorID: serializer.fromJson<int>(json['FloorID']),
      BuildingID: serializer.fromJson<int>(json['BuildingID']),
      LocationID: serializer.fromJson<int>(json['LocationID']),
      CompanyID: serializer.fromJson<int>(json['CompanyID']),
      auditqid: serializer.fromJson<int>(json['auditqid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isNightActivity': serializer.toJson<bool>(isNightActivity),
      'isSaturdayReq': serializer.toJson<bool>(isSaturdayReq),
      'isSundayReq': serializer.toJson<bool>(isSundayReq),
      'endtime': serializer.toJson<String>(endtime),
      'starttime': serializer.toJson<String>(starttime),
      'guid': serializer.toJson<String>(guid),
      'imageBase64': serializer.toJson<String>(imageBase64),
      'questionimage': serializer.toJson<String>(questionimage),
      'colourcode': serializer.toJson<String>(colourcode),
      'enddate': serializer.toJson<String>(enddate),
      'categoryname': serializer.toJson<String>(categoryname),
      'startdate': serializer.toJson<String>(startdate),
      'auditname': serializer.toJson<String>(auditname),
      'WingShortName': serializer.toJson<String>(WingShortName),
      'WingName': serializer.toJson<String>(WingName),
      'FloorShortName': serializer.toJson<String>(FloorShortName),
      'FloorName': serializer.toJson<String>(FloorName),
      'BuildingShortName': serializer.toJson<String>(BuildingShortName),
      'BuildingName': serializer.toJson<String>(BuildingName),
      'LocationName': serializer.toJson<String>(LocationName),
      'CompanyName': serializer.toJson<String>(CompanyName),
      'auditqname': serializer.toJson<String>(auditqname),
      'userid': serializer.toJson<int>(userid),
      'interval': serializer.toJson<int>(interval),
      'sectorid': serializer.toJson<int>(sectorid),
      'score': serializer.toJson<int>(score),
      'scoreid': serializer.toJson<int>(scoreid),
      'categoryid': serializer.toJson<int>(categoryid),
      'auditid': serializer.toJson<int>(auditid),
      'WingID': serializer.toJson<int>(WingID),
      'FloorID': serializer.toJson<int>(FloorID),
      'BuildingID': serializer.toJson<int>(BuildingID),
      'LocationID': serializer.toJson<int>(LocationID),
      'CompanyID': serializer.toJson<int>(CompanyID),
      'auditqid': serializer.toJson<int>(auditqid),
    };
  }

  QuestionData copyWith(
          {int? id,
          bool? isNightActivity,
          bool? isSaturdayReq,
          bool? isSundayReq,
          String? endtime,
          String? starttime,
          String? guid,
          String? imageBase64,
          String? questionimage,
          String? colourcode,
          String? enddate,
          String? categoryname,
          String? startdate,
          String? auditname,
          String? WingShortName,
          String? WingName,
          String? FloorShortName,
          String? FloorName,
          String? BuildingShortName,
          String? BuildingName,
          String? LocationName,
          String? CompanyName,
          String? auditqname,
          int? userid,
          int? interval,
          int? sectorid,
          int? score,
          int? scoreid,
          int? categoryid,
          int? auditid,
          int? WingID,
          int? FloorID,
          int? BuildingID,
          int? LocationID,
          int? CompanyID,
          int? auditqid}) =>
      QuestionData(
        id: id ?? this.id,
        isNightActivity: isNightActivity ?? this.isNightActivity,
        isSaturdayReq: isSaturdayReq ?? this.isSaturdayReq,
        isSundayReq: isSundayReq ?? this.isSundayReq,
        endtime: endtime ?? this.endtime,
        starttime: starttime ?? this.starttime,
        guid: guid ?? this.guid,
        imageBase64: imageBase64 ?? this.imageBase64,
        questionimage: questionimage ?? this.questionimage,
        colourcode: colourcode ?? this.colourcode,
        enddate: enddate ?? this.enddate,
        categoryname: categoryname ?? this.categoryname,
        startdate: startdate ?? this.startdate,
        auditname: auditname ?? this.auditname,
        WingShortName: WingShortName ?? this.WingShortName,
        WingName: WingName ?? this.WingName,
        FloorShortName: FloorShortName ?? this.FloorShortName,
        FloorName: FloorName ?? this.FloorName,
        BuildingShortName: BuildingShortName ?? this.BuildingShortName,
        BuildingName: BuildingName ?? this.BuildingName,
        LocationName: LocationName ?? this.LocationName,
        CompanyName: CompanyName ?? this.CompanyName,
        auditqname: auditqname ?? this.auditqname,
        userid: userid ?? this.userid,
        interval: interval ?? this.interval,
        sectorid: sectorid ?? this.sectorid,
        score: score ?? this.score,
        scoreid: scoreid ?? this.scoreid,
        categoryid: categoryid ?? this.categoryid,
        auditid: auditid ?? this.auditid,
        WingID: WingID ?? this.WingID,
        FloorID: FloorID ?? this.FloorID,
        BuildingID: BuildingID ?? this.BuildingID,
        LocationID: LocationID ?? this.LocationID,
        CompanyID: CompanyID ?? this.CompanyID,
        auditqid: auditqid ?? this.auditqid,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionData(')
          ..write('id: $id, ')
          ..write('isNightActivity: $isNightActivity, ')
          ..write('isSaturdayReq: $isSaturdayReq, ')
          ..write('isSundayReq: $isSundayReq, ')
          ..write('endtime: $endtime, ')
          ..write('starttime: $starttime, ')
          ..write('guid: $guid, ')
          ..write('imageBase64: $imageBase64, ')
          ..write('questionimage: $questionimage, ')
          ..write('colourcode: $colourcode, ')
          ..write('enddate: $enddate, ')
          ..write('categoryname: $categoryname, ')
          ..write('startdate: $startdate, ')
          ..write('auditname: $auditname, ')
          ..write('WingShortName: $WingShortName, ')
          ..write('WingName: $WingName, ')
          ..write('FloorShortName: $FloorShortName, ')
          ..write('FloorName: $FloorName, ')
          ..write('BuildingShortName: $BuildingShortName, ')
          ..write('BuildingName: $BuildingName, ')
          ..write('LocationName: $LocationName, ')
          ..write('CompanyName: $CompanyName, ')
          ..write('auditqname: $auditqname, ')
          ..write('userid: $userid, ')
          ..write('interval: $interval, ')
          ..write('sectorid: $sectorid, ')
          ..write('score: $score, ')
          ..write('scoreid: $scoreid, ')
          ..write('categoryid: $categoryid, ')
          ..write('auditid: $auditid, ')
          ..write('WingID: $WingID, ')
          ..write('FloorID: $FloorID, ')
          ..write('BuildingID: $BuildingID, ')
          ..write('LocationID: $LocationID, ')
          ..write('CompanyID: $CompanyID, ')
          ..write('auditqid: $auditqid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        isNightActivity,
        isSaturdayReq,
        isSundayReq,
        endtime,
        starttime,
        guid,
        imageBase64,
        questionimage,
        colourcode,
        enddate,
        categoryname,
        startdate,
        auditname,
        WingShortName,
        WingName,
        FloorShortName,
        FloorName,
        BuildingShortName,
        BuildingName,
        LocationName,
        CompanyName,
        auditqname,
        userid,
        interval,
        sectorid,
        score,
        scoreid,
        categoryid,
        auditid,
        WingID,
        FloorID,
        BuildingID,
        LocationID,
        CompanyID,
        auditqid
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionData &&
          other.id == this.id &&
          other.isNightActivity == this.isNightActivity &&
          other.isSaturdayReq == this.isSaturdayReq &&
          other.isSundayReq == this.isSundayReq &&
          other.endtime == this.endtime &&
          other.starttime == this.starttime &&
          other.guid == this.guid &&
          other.imageBase64 == this.imageBase64 &&
          other.questionimage == this.questionimage &&
          other.colourcode == this.colourcode &&
          other.enddate == this.enddate &&
          other.categoryname == this.categoryname &&
          other.startdate == this.startdate &&
          other.auditname == this.auditname &&
          other.WingShortName == this.WingShortName &&
          other.WingName == this.WingName &&
          other.FloorShortName == this.FloorShortName &&
          other.FloorName == this.FloorName &&
          other.BuildingShortName == this.BuildingShortName &&
          other.BuildingName == this.BuildingName &&
          other.LocationName == this.LocationName &&
          other.CompanyName == this.CompanyName &&
          other.auditqname == this.auditqname &&
          other.userid == this.userid &&
          other.interval == this.interval &&
          other.sectorid == this.sectorid &&
          other.score == this.score &&
          other.scoreid == this.scoreid &&
          other.categoryid == this.categoryid &&
          other.auditid == this.auditid &&
          other.WingID == this.WingID &&
          other.FloorID == this.FloorID &&
          other.BuildingID == this.BuildingID &&
          other.LocationID == this.LocationID &&
          other.CompanyID == this.CompanyID &&
          other.auditqid == this.auditqid);
}

class QuestionCompanion extends UpdateCompanion<QuestionData> {
  final Value<int> id;
  final Value<bool> isNightActivity;
  final Value<bool> isSaturdayReq;
  final Value<bool> isSundayReq;
  final Value<String> endtime;
  final Value<String> starttime;
  final Value<String> guid;
  final Value<String> imageBase64;
  final Value<String> questionimage;
  final Value<String> colourcode;
  final Value<String> enddate;
  final Value<String> categoryname;
  final Value<String> startdate;
  final Value<String> auditname;
  final Value<String> WingShortName;
  final Value<String> WingName;
  final Value<String> FloorShortName;
  final Value<String> FloorName;
  final Value<String> BuildingShortName;
  final Value<String> BuildingName;
  final Value<String> LocationName;
  final Value<String> CompanyName;
  final Value<String> auditqname;
  final Value<int> userid;
  final Value<int> interval;
  final Value<int> sectorid;
  final Value<int> score;
  final Value<int> scoreid;
  final Value<int> categoryid;
  final Value<int> auditid;
  final Value<int> WingID;
  final Value<int> FloorID;
  final Value<int> BuildingID;
  final Value<int> LocationID;
  final Value<int> CompanyID;
  final Value<int> auditqid;
  const QuestionCompanion({
    this.id = const Value.absent(),
    this.isNightActivity = const Value.absent(),
    this.isSaturdayReq = const Value.absent(),
    this.isSundayReq = const Value.absent(),
    this.endtime = const Value.absent(),
    this.starttime = const Value.absent(),
    this.guid = const Value.absent(),
    this.imageBase64 = const Value.absent(),
    this.questionimage = const Value.absent(),
    this.colourcode = const Value.absent(),
    this.enddate = const Value.absent(),
    this.categoryname = const Value.absent(),
    this.startdate = const Value.absent(),
    this.auditname = const Value.absent(),
    this.WingShortName = const Value.absent(),
    this.WingName = const Value.absent(),
    this.FloorShortName = const Value.absent(),
    this.FloorName = const Value.absent(),
    this.BuildingShortName = const Value.absent(),
    this.BuildingName = const Value.absent(),
    this.LocationName = const Value.absent(),
    this.CompanyName = const Value.absent(),
    this.auditqname = const Value.absent(),
    this.userid = const Value.absent(),
    this.interval = const Value.absent(),
    this.sectorid = const Value.absent(),
    this.score = const Value.absent(),
    this.scoreid = const Value.absent(),
    this.categoryid = const Value.absent(),
    this.auditid = const Value.absent(),
    this.WingID = const Value.absent(),
    this.FloorID = const Value.absent(),
    this.BuildingID = const Value.absent(),
    this.LocationID = const Value.absent(),
    this.CompanyID = const Value.absent(),
    this.auditqid = const Value.absent(),
  });
  QuestionCompanion.insert({
    this.id = const Value.absent(),
    required bool isNightActivity,
    required bool isSaturdayReq,
    required bool isSundayReq,
    required String endtime,
    required String starttime,
    required String guid,
    this.imageBase64 = const Value.absent(),
    required String questionimage,
    required String colourcode,
    required String enddate,
    required String categoryname,
    required String startdate,
    required String auditname,
    required String WingShortName,
    required String WingName,
    required String FloorShortName,
    required String FloorName,
    required String BuildingShortName,
    required String BuildingName,
    required String LocationName,
    required String CompanyName,
    required String auditqname,
    required int userid,
    required int interval,
    required int sectorid,
    required int score,
    required int scoreid,
    required int categoryid,
    required int auditid,
    required int WingID,
    required int FloorID,
    required int BuildingID,
    required int LocationID,
    required int CompanyID,
    required int auditqid,
  })  : isNightActivity = Value(isNightActivity),
        isSaturdayReq = Value(isSaturdayReq),
        isSundayReq = Value(isSundayReq),
        endtime = Value(endtime),
        starttime = Value(starttime),
        guid = Value(guid),
        questionimage = Value(questionimage),
        colourcode = Value(colourcode),
        enddate = Value(enddate),
        categoryname = Value(categoryname),
        startdate = Value(startdate),
        auditname = Value(auditname),
        WingShortName = Value(WingShortName),
        WingName = Value(WingName),
        FloorShortName = Value(FloorShortName),
        FloorName = Value(FloorName),
        BuildingShortName = Value(BuildingShortName),
        BuildingName = Value(BuildingName),
        LocationName = Value(LocationName),
        CompanyName = Value(CompanyName),
        auditqname = Value(auditqname),
        userid = Value(userid),
        interval = Value(interval),
        sectorid = Value(sectorid),
        score = Value(score),
        scoreid = Value(scoreid),
        categoryid = Value(categoryid),
        auditid = Value(auditid),
        WingID = Value(WingID),
        FloorID = Value(FloorID),
        BuildingID = Value(BuildingID),
        LocationID = Value(LocationID),
        CompanyID = Value(CompanyID),
        auditqid = Value(auditqid);
  static Insertable<QuestionData> custom({
    Expression<int>? id,
    Expression<bool>? isNightActivity,
    Expression<bool>? isSaturdayReq,
    Expression<bool>? isSundayReq,
    Expression<String>? endtime,
    Expression<String>? starttime,
    Expression<String>? guid,
    Expression<String>? imageBase64,
    Expression<String>? questionimage,
    Expression<String>? colourcode,
    Expression<String>? enddate,
    Expression<String>? categoryname,
    Expression<String>? startdate,
    Expression<String>? auditname,
    Expression<String>? WingShortName,
    Expression<String>? WingName,
    Expression<String>? FloorShortName,
    Expression<String>? FloorName,
    Expression<String>? BuildingShortName,
    Expression<String>? BuildingName,
    Expression<String>? LocationName,
    Expression<String>? CompanyName,
    Expression<String>? auditqname,
    Expression<int>? userid,
    Expression<int>? interval,
    Expression<int>? sectorid,
    Expression<int>? score,
    Expression<int>? scoreid,
    Expression<int>? categoryid,
    Expression<int>? auditid,
    Expression<int>? WingID,
    Expression<int>? FloorID,
    Expression<int>? BuildingID,
    Expression<int>? LocationID,
    Expression<int>? CompanyID,
    Expression<int>? auditqid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isNightActivity != null) 'is_night_activity': isNightActivity,
      if (isSaturdayReq != null) 'is_saturday_req': isSaturdayReq,
      if (isSundayReq != null) 'is_sunday_req': isSundayReq,
      if (endtime != null) 'endtime': endtime,
      if (starttime != null) 'starttime': starttime,
      if (guid != null) 'guid': guid,
      if (imageBase64 != null) 'image_base64': imageBase64,
      if (questionimage != null) 'questionimage': questionimage,
      if (colourcode != null) 'colourcode': colourcode,
      if (enddate != null) 'enddate': enddate,
      if (categoryname != null) 'categoryname': categoryname,
      if (startdate != null) 'startdate': startdate,
      if (auditname != null) 'auditname': auditname,
      if (WingShortName != null) 'wing_short_name': WingShortName,
      if (WingName != null) 'wing_name': WingName,
      if (FloorShortName != null) 'floor_short_name': FloorShortName,
      if (FloorName != null) 'floor_name': FloorName,
      if (BuildingShortName != null) 'building_short_name': BuildingShortName,
      if (BuildingName != null) 'building_name': BuildingName,
      if (LocationName != null) 'location_name': LocationName,
      if (CompanyName != null) 'company_name': CompanyName,
      if (auditqname != null) 'auditqname': auditqname,
      if (userid != null) 'userid': userid,
      if (interval != null) 'interval': interval,
      if (sectorid != null) 'sectorid': sectorid,
      if (score != null) 'score': score,
      if (scoreid != null) 'scoreid': scoreid,
      if (categoryid != null) 'categoryid': categoryid,
      if (auditid != null) 'auditid': auditid,
      if (WingID != null) 'wing_i_d': WingID,
      if (FloorID != null) 'floor_i_d': FloorID,
      if (BuildingID != null) 'building_i_d': BuildingID,
      if (LocationID != null) 'location_i_d': LocationID,
      if (CompanyID != null) 'company_i_d': CompanyID,
      if (auditqid != null) 'auditqid': auditqid,
    });
  }

  QuestionCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isNightActivity,
      Value<bool>? isSaturdayReq,
      Value<bool>? isSundayReq,
      Value<String>? endtime,
      Value<String>? starttime,
      Value<String>? guid,
      Value<String>? imageBase64,
      Value<String>? questionimage,
      Value<String>? colourcode,
      Value<String>? enddate,
      Value<String>? categoryname,
      Value<String>? startdate,
      Value<String>? auditname,
      Value<String>? WingShortName,
      Value<String>? WingName,
      Value<String>? FloorShortName,
      Value<String>? FloorName,
      Value<String>? BuildingShortName,
      Value<String>? BuildingName,
      Value<String>? LocationName,
      Value<String>? CompanyName,
      Value<String>? auditqname,
      Value<int>? userid,
      Value<int>? interval,
      Value<int>? sectorid,
      Value<int>? score,
      Value<int>? scoreid,
      Value<int>? categoryid,
      Value<int>? auditid,
      Value<int>? WingID,
      Value<int>? FloorID,
      Value<int>? BuildingID,
      Value<int>? LocationID,
      Value<int>? CompanyID,
      Value<int>? auditqid}) {
    return QuestionCompanion(
      id: id ?? this.id,
      isNightActivity: isNightActivity ?? this.isNightActivity,
      isSaturdayReq: isSaturdayReq ?? this.isSaturdayReq,
      isSundayReq: isSundayReq ?? this.isSundayReq,
      endtime: endtime ?? this.endtime,
      starttime: starttime ?? this.starttime,
      guid: guid ?? this.guid,
      imageBase64: imageBase64 ?? this.imageBase64,
      questionimage: questionimage ?? this.questionimage,
      colourcode: colourcode ?? this.colourcode,
      enddate: enddate ?? this.enddate,
      categoryname: categoryname ?? this.categoryname,
      startdate: startdate ?? this.startdate,
      auditname: auditname ?? this.auditname,
      WingShortName: WingShortName ?? this.WingShortName,
      WingName: WingName ?? this.WingName,
      FloorShortName: FloorShortName ?? this.FloorShortName,
      FloorName: FloorName ?? this.FloorName,
      BuildingShortName: BuildingShortName ?? this.BuildingShortName,
      BuildingName: BuildingName ?? this.BuildingName,
      LocationName: LocationName ?? this.LocationName,
      CompanyName: CompanyName ?? this.CompanyName,
      auditqname: auditqname ?? this.auditqname,
      userid: userid ?? this.userid,
      interval: interval ?? this.interval,
      sectorid: sectorid ?? this.sectorid,
      score: score ?? this.score,
      scoreid: scoreid ?? this.scoreid,
      categoryid: categoryid ?? this.categoryid,
      auditid: auditid ?? this.auditid,
      WingID: WingID ?? this.WingID,
      FloorID: FloorID ?? this.FloorID,
      BuildingID: BuildingID ?? this.BuildingID,
      LocationID: LocationID ?? this.LocationID,
      CompanyID: CompanyID ?? this.CompanyID,
      auditqid: auditqid ?? this.auditqid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isNightActivity.present) {
      map['is_night_activity'] = Variable<bool>(isNightActivity.value);
    }
    if (isSaturdayReq.present) {
      map['is_saturday_req'] = Variable<bool>(isSaturdayReq.value);
    }
    if (isSundayReq.present) {
      map['is_sunday_req'] = Variable<bool>(isSundayReq.value);
    }
    if (endtime.present) {
      map['endtime'] = Variable<String>(endtime.value);
    }
    if (starttime.present) {
      map['starttime'] = Variable<String>(starttime.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (imageBase64.present) {
      map['image_base64'] = Variable<String>(imageBase64.value);
    }
    if (questionimage.present) {
      map['questionimage'] = Variable<String>(questionimage.value);
    }
    if (colourcode.present) {
      map['colourcode'] = Variable<String>(colourcode.value);
    }
    if (enddate.present) {
      map['enddate'] = Variable<String>(enddate.value);
    }
    if (categoryname.present) {
      map['categoryname'] = Variable<String>(categoryname.value);
    }
    if (startdate.present) {
      map['startdate'] = Variable<String>(startdate.value);
    }
    if (auditname.present) {
      map['auditname'] = Variable<String>(auditname.value);
    }
    if (WingShortName.present) {
      map['wing_short_name'] = Variable<String>(WingShortName.value);
    }
    if (WingName.present) {
      map['wing_name'] = Variable<String>(WingName.value);
    }
    if (FloorShortName.present) {
      map['floor_short_name'] = Variable<String>(FloorShortName.value);
    }
    if (FloorName.present) {
      map['floor_name'] = Variable<String>(FloorName.value);
    }
    if (BuildingShortName.present) {
      map['building_short_name'] = Variable<String>(BuildingShortName.value);
    }
    if (BuildingName.present) {
      map['building_name'] = Variable<String>(BuildingName.value);
    }
    if (LocationName.present) {
      map['location_name'] = Variable<String>(LocationName.value);
    }
    if (CompanyName.present) {
      map['company_name'] = Variable<String>(CompanyName.value);
    }
    if (auditqname.present) {
      map['auditqname'] = Variable<String>(auditqname.value);
    }
    if (userid.present) {
      map['userid'] = Variable<int>(userid.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (sectorid.present) {
      map['sectorid'] = Variable<int>(sectorid.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (scoreid.present) {
      map['scoreid'] = Variable<int>(scoreid.value);
    }
    if (categoryid.present) {
      map['categoryid'] = Variable<int>(categoryid.value);
    }
    if (auditid.present) {
      map['auditid'] = Variable<int>(auditid.value);
    }
    if (WingID.present) {
      map['wing_i_d'] = Variable<int>(WingID.value);
    }
    if (FloorID.present) {
      map['floor_i_d'] = Variable<int>(FloorID.value);
    }
    if (BuildingID.present) {
      map['building_i_d'] = Variable<int>(BuildingID.value);
    }
    if (LocationID.present) {
      map['location_i_d'] = Variable<int>(LocationID.value);
    }
    if (CompanyID.present) {
      map['company_i_d'] = Variable<int>(CompanyID.value);
    }
    if (auditqid.present) {
      map['auditqid'] = Variable<int>(auditqid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionCompanion(')
          ..write('id: $id, ')
          ..write('isNightActivity: $isNightActivity, ')
          ..write('isSaturdayReq: $isSaturdayReq, ')
          ..write('isSundayReq: $isSundayReq, ')
          ..write('endtime: $endtime, ')
          ..write('starttime: $starttime, ')
          ..write('guid: $guid, ')
          ..write('imageBase64: $imageBase64, ')
          ..write('questionimage: $questionimage, ')
          ..write('colourcode: $colourcode, ')
          ..write('enddate: $enddate, ')
          ..write('categoryname: $categoryname, ')
          ..write('startdate: $startdate, ')
          ..write('auditname: $auditname, ')
          ..write('WingShortName: $WingShortName, ')
          ..write('WingName: $WingName, ')
          ..write('FloorShortName: $FloorShortName, ')
          ..write('FloorName: $FloorName, ')
          ..write('BuildingShortName: $BuildingShortName, ')
          ..write('BuildingName: $BuildingName, ')
          ..write('LocationName: $LocationName, ')
          ..write('CompanyName: $CompanyName, ')
          ..write('auditqname: $auditqname, ')
          ..write('userid: $userid, ')
          ..write('interval: $interval, ')
          ..write('sectorid: $sectorid, ')
          ..write('score: $score, ')
          ..write('scoreid: $scoreid, ')
          ..write('categoryid: $categoryid, ')
          ..write('auditid: $auditid, ')
          ..write('WingID: $WingID, ')
          ..write('FloorID: $FloorID, ')
          ..write('BuildingID: $BuildingID, ')
          ..write('LocationID: $LocationID, ')
          ..write('CompanyID: $CompanyID, ')
          ..write('auditqid: $auditqid')
          ..write(')'))
        .toString();
  }
}

class $QuestionTable extends Question
    with TableInfo<$QuestionTable, QuestionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _isNightActivityMeta =
      const VerificationMeta('isNightActivity');
  @override
  late final GeneratedColumn<bool> isNightActivity = GeneratedColumn<bool>(
      'is_night_activity', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_night_activity" IN (0, 1))');
  final VerificationMeta _isSaturdayReqMeta =
      const VerificationMeta('isSaturdayReq');
  @override
  late final GeneratedColumn<bool> isSaturdayReq = GeneratedColumn<bool>(
      'is_saturday_req', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_saturday_req" IN (0, 1))');
  final VerificationMeta _isSundayReqMeta =
      const VerificationMeta('isSundayReq');
  @override
  late final GeneratedColumn<bool> isSundayReq = GeneratedColumn<bool>(
      'is_sunday_req', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_sunday_req" IN (0, 1))');
  final VerificationMeta _endtimeMeta = const VerificationMeta('endtime');
  @override
  late final GeneratedColumn<String> endtime = GeneratedColumn<String>(
      'endtime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _starttimeMeta = const VerificationMeta('starttime');
  @override
  late final GeneratedColumn<String> starttime = GeneratedColumn<String>(
      'starttime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _imageBase64Meta =
      const VerificationMeta('imageBase64');
  @override
  late final GeneratedColumn<String> imageBase64 = GeneratedColumn<String>(
      'image_base64', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  final VerificationMeta _questionimageMeta =
      const VerificationMeta('questionimage');
  @override
  late final GeneratedColumn<String> questionimage = GeneratedColumn<String>(
      'questionimage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _colourcodeMeta = const VerificationMeta('colourcode');
  @override
  late final GeneratedColumn<String> colourcode = GeneratedColumn<String>(
      'colourcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _enddateMeta = const VerificationMeta('enddate');
  @override
  late final GeneratedColumn<String> enddate = GeneratedColumn<String>(
      'enddate', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categorynameMeta =
      const VerificationMeta('categoryname');
  @override
  late final GeneratedColumn<String> categoryname = GeneratedColumn<String>(
      'categoryname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _startdateMeta = const VerificationMeta('startdate');
  @override
  late final GeneratedColumn<String> startdate = GeneratedColumn<String>(
      'startdate', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _auditnameMeta = const VerificationMeta('auditname');
  @override
  late final GeneratedColumn<String> auditname = GeneratedColumn<String>(
      'auditname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _WingShortNameMeta =
      const VerificationMeta('WingShortName');
  @override
  late final GeneratedColumn<String> WingShortName = GeneratedColumn<String>(
      'wing_short_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _WingNameMeta = const VerificationMeta('WingName');
  @override
  late final GeneratedColumn<String> WingName = GeneratedColumn<String>(
      'wing_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _FloorShortNameMeta =
      const VerificationMeta('FloorShortName');
  @override
  late final GeneratedColumn<String> FloorShortName = GeneratedColumn<String>(
      'floor_short_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _FloorNameMeta = const VerificationMeta('FloorName');
  @override
  late final GeneratedColumn<String> FloorName = GeneratedColumn<String>(
      'floor_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _BuildingShortNameMeta =
      const VerificationMeta('BuildingShortName');
  @override
  late final GeneratedColumn<String> BuildingShortName =
      GeneratedColumn<String>('building_short_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _BuildingNameMeta =
      const VerificationMeta('BuildingName');
  @override
  late final GeneratedColumn<String> BuildingName = GeneratedColumn<String>(
      'building_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _LocationNameMeta =
      const VerificationMeta('LocationName');
  @override
  late final GeneratedColumn<String> LocationName = GeneratedColumn<String>(
      'location_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _CompanyNameMeta =
      const VerificationMeta('CompanyName');
  @override
  late final GeneratedColumn<String> CompanyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _auditqnameMeta = const VerificationMeta('auditqname');
  @override
  late final GeneratedColumn<String> auditqname = GeneratedColumn<String>(
      'auditqname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _useridMeta = const VerificationMeta('userid');
  @override
  late final GeneratedColumn<int> userid = GeneratedColumn<int>(
      'userid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _intervalMeta = const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _sectoridMeta = const VerificationMeta('sectorid');
  @override
  late final GeneratedColumn<int> sectorid = GeneratedColumn<int>(
      'sectorid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _scoreidMeta = const VerificationMeta('scoreid');
  @override
  late final GeneratedColumn<int> scoreid = GeneratedColumn<int>(
      'scoreid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _categoryidMeta = const VerificationMeta('categoryid');
  @override
  late final GeneratedColumn<int> categoryid = GeneratedColumn<int>(
      'categoryid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditidMeta = const VerificationMeta('auditid');
  @override
  late final GeneratedColumn<int> auditid = GeneratedColumn<int>(
      'auditid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _WingIDMeta = const VerificationMeta('WingID');
  @override
  late final GeneratedColumn<int> WingID = GeneratedColumn<int>(
      'wing_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _FloorIDMeta = const VerificationMeta('FloorID');
  @override
  late final GeneratedColumn<int> FloorID = GeneratedColumn<int>(
      'floor_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _BuildingIDMeta = const VerificationMeta('BuildingID');
  @override
  late final GeneratedColumn<int> BuildingID = GeneratedColumn<int>(
      'building_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _LocationIDMeta = const VerificationMeta('LocationID');
  @override
  late final GeneratedColumn<int> LocationID = GeneratedColumn<int>(
      'location_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _CompanyIDMeta = const VerificationMeta('CompanyID');
  @override
  late final GeneratedColumn<int> CompanyID = GeneratedColumn<int>(
      'company_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditqidMeta = const VerificationMeta('auditqid');
  @override
  late final GeneratedColumn<int> auditqid = GeneratedColumn<int>(
      'auditqid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isNightActivity,
        isSaturdayReq,
        isSundayReq,
        endtime,
        starttime,
        guid,
        imageBase64,
        questionimage,
        colourcode,
        enddate,
        categoryname,
        startdate,
        auditname,
        WingShortName,
        WingName,
        FloorShortName,
        FloorName,
        BuildingShortName,
        BuildingName,
        LocationName,
        CompanyName,
        auditqname,
        userid,
        interval,
        sectorid,
        score,
        scoreid,
        categoryid,
        auditid,
        WingID,
        FloorID,
        BuildingID,
        LocationID,
        CompanyID,
        auditqid
      ];
  @override
  String get aliasedName => _alias ?? 'question';
  @override
  String get actualTableName => 'question';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_night_activity')) {
      context.handle(
          _isNightActivityMeta,
          isNightActivity.isAcceptableOrUnknown(
              data['is_night_activity']!, _isNightActivityMeta));
    } else if (isInserting) {
      context.missing(_isNightActivityMeta);
    }
    if (data.containsKey('is_saturday_req')) {
      context.handle(
          _isSaturdayReqMeta,
          isSaturdayReq.isAcceptableOrUnknown(
              data['is_saturday_req']!, _isSaturdayReqMeta));
    } else if (isInserting) {
      context.missing(_isSaturdayReqMeta);
    }
    if (data.containsKey('is_sunday_req')) {
      context.handle(
          _isSundayReqMeta,
          isSundayReq.isAcceptableOrUnknown(
              data['is_sunday_req']!, _isSundayReqMeta));
    } else if (isInserting) {
      context.missing(_isSundayReqMeta);
    }
    if (data.containsKey('endtime')) {
      context.handle(_endtimeMeta,
          endtime.isAcceptableOrUnknown(data['endtime']!, _endtimeMeta));
    } else if (isInserting) {
      context.missing(_endtimeMeta);
    }
    if (data.containsKey('starttime')) {
      context.handle(_starttimeMeta,
          starttime.isAcceptableOrUnknown(data['starttime']!, _starttimeMeta));
    } else if (isInserting) {
      context.missing(_starttimeMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('image_base64')) {
      context.handle(
          _imageBase64Meta,
          imageBase64.isAcceptableOrUnknown(
              data['image_base64']!, _imageBase64Meta));
    }
    if (data.containsKey('questionimage')) {
      context.handle(
          _questionimageMeta,
          questionimage.isAcceptableOrUnknown(
              data['questionimage']!, _questionimageMeta));
    } else if (isInserting) {
      context.missing(_questionimageMeta);
    }
    if (data.containsKey('colourcode')) {
      context.handle(
          _colourcodeMeta,
          colourcode.isAcceptableOrUnknown(
              data['colourcode']!, _colourcodeMeta));
    } else if (isInserting) {
      context.missing(_colourcodeMeta);
    }
    if (data.containsKey('enddate')) {
      context.handle(_enddateMeta,
          enddate.isAcceptableOrUnknown(data['enddate']!, _enddateMeta));
    } else if (isInserting) {
      context.missing(_enddateMeta);
    }
    if (data.containsKey('categoryname')) {
      context.handle(
          _categorynameMeta,
          categoryname.isAcceptableOrUnknown(
              data['categoryname']!, _categorynameMeta));
    } else if (isInserting) {
      context.missing(_categorynameMeta);
    }
    if (data.containsKey('startdate')) {
      context.handle(_startdateMeta,
          startdate.isAcceptableOrUnknown(data['startdate']!, _startdateMeta));
    } else if (isInserting) {
      context.missing(_startdateMeta);
    }
    if (data.containsKey('auditname')) {
      context.handle(_auditnameMeta,
          auditname.isAcceptableOrUnknown(data['auditname']!, _auditnameMeta));
    } else if (isInserting) {
      context.missing(_auditnameMeta);
    }
    if (data.containsKey('wing_short_name')) {
      context.handle(
          _WingShortNameMeta,
          WingShortName.isAcceptableOrUnknown(
              data['wing_short_name']!, _WingShortNameMeta));
    } else if (isInserting) {
      context.missing(_WingShortNameMeta);
    }
    if (data.containsKey('wing_name')) {
      context.handle(_WingNameMeta,
          WingName.isAcceptableOrUnknown(data['wing_name']!, _WingNameMeta));
    } else if (isInserting) {
      context.missing(_WingNameMeta);
    }
    if (data.containsKey('floor_short_name')) {
      context.handle(
          _FloorShortNameMeta,
          FloorShortName.isAcceptableOrUnknown(
              data['floor_short_name']!, _FloorShortNameMeta));
    } else if (isInserting) {
      context.missing(_FloorShortNameMeta);
    }
    if (data.containsKey('floor_name')) {
      context.handle(_FloorNameMeta,
          FloorName.isAcceptableOrUnknown(data['floor_name']!, _FloorNameMeta));
    } else if (isInserting) {
      context.missing(_FloorNameMeta);
    }
    if (data.containsKey('building_short_name')) {
      context.handle(
          _BuildingShortNameMeta,
          BuildingShortName.isAcceptableOrUnknown(
              data['building_short_name']!, _BuildingShortNameMeta));
    } else if (isInserting) {
      context.missing(_BuildingShortNameMeta);
    }
    if (data.containsKey('building_name')) {
      context.handle(
          _BuildingNameMeta,
          BuildingName.isAcceptableOrUnknown(
              data['building_name']!, _BuildingNameMeta));
    } else if (isInserting) {
      context.missing(_BuildingNameMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _LocationNameMeta,
          LocationName.isAcceptableOrUnknown(
              data['location_name']!, _LocationNameMeta));
    } else if (isInserting) {
      context.missing(_LocationNameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _CompanyNameMeta,
          CompanyName.isAcceptableOrUnknown(
              data['company_name']!, _CompanyNameMeta));
    } else if (isInserting) {
      context.missing(_CompanyNameMeta);
    }
    if (data.containsKey('auditqname')) {
      context.handle(
          _auditqnameMeta,
          auditqname.isAcceptableOrUnknown(
              data['auditqname']!, _auditqnameMeta));
    } else if (isInserting) {
      context.missing(_auditqnameMeta);
    }
    if (data.containsKey('userid')) {
      context.handle(_useridMeta,
          userid.isAcceptableOrUnknown(data['userid']!, _useridMeta));
    } else if (isInserting) {
      context.missing(_useridMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    } else if (isInserting) {
      context.missing(_intervalMeta);
    }
    if (data.containsKey('sectorid')) {
      context.handle(_sectoridMeta,
          sectorid.isAcceptableOrUnknown(data['sectorid']!, _sectoridMeta));
    } else if (isInserting) {
      context.missing(_sectoridMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('scoreid')) {
      context.handle(_scoreidMeta,
          scoreid.isAcceptableOrUnknown(data['scoreid']!, _scoreidMeta));
    } else if (isInserting) {
      context.missing(_scoreidMeta);
    }
    if (data.containsKey('categoryid')) {
      context.handle(
          _categoryidMeta,
          categoryid.isAcceptableOrUnknown(
              data['categoryid']!, _categoryidMeta));
    } else if (isInserting) {
      context.missing(_categoryidMeta);
    }
    if (data.containsKey('auditid')) {
      context.handle(_auditidMeta,
          auditid.isAcceptableOrUnknown(data['auditid']!, _auditidMeta));
    } else if (isInserting) {
      context.missing(_auditidMeta);
    }
    if (data.containsKey('wing_i_d')) {
      context.handle(_WingIDMeta,
          WingID.isAcceptableOrUnknown(data['wing_i_d']!, _WingIDMeta));
    } else if (isInserting) {
      context.missing(_WingIDMeta);
    }
    if (data.containsKey('floor_i_d')) {
      context.handle(_FloorIDMeta,
          FloorID.isAcceptableOrUnknown(data['floor_i_d']!, _FloorIDMeta));
    } else if (isInserting) {
      context.missing(_FloorIDMeta);
    }
    if (data.containsKey('building_i_d')) {
      context.handle(
          _BuildingIDMeta,
          BuildingID.isAcceptableOrUnknown(
              data['building_i_d']!, _BuildingIDMeta));
    } else if (isInserting) {
      context.missing(_BuildingIDMeta);
    }
    if (data.containsKey('location_i_d')) {
      context.handle(
          _LocationIDMeta,
          LocationID.isAcceptableOrUnknown(
              data['location_i_d']!, _LocationIDMeta));
    } else if (isInserting) {
      context.missing(_LocationIDMeta);
    }
    if (data.containsKey('company_i_d')) {
      context.handle(
          _CompanyIDMeta,
          CompanyID.isAcceptableOrUnknown(
              data['company_i_d']!, _CompanyIDMeta));
    } else if (isInserting) {
      context.missing(_CompanyIDMeta);
    }
    if (data.containsKey('auditqid')) {
      context.handle(_auditqidMeta,
          auditqid.isAcceptableOrUnknown(data['auditqid']!, _auditqidMeta));
    } else if (isInserting) {
      context.missing(_auditqidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isNightActivity: attachedDatabase.options.types.read(
          DriftSqlType.bool, data['${effectivePrefix}is_night_activity'])!,
      isSaturdayReq: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saturday_req'])!,
      isSundayReq: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sunday_req'])!,
      endtime: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}endtime'])!,
      starttime: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}starttime'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      imageBase64: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image_base64'])!,
      questionimage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}questionimage'])!,
      colourcode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}colourcode'])!,
      enddate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}enddate'])!,
      categoryname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}categoryname'])!,
      startdate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}startdate'])!,
      auditname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}auditname'])!,
      WingShortName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}wing_short_name'])!,
      WingName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}wing_name'])!,
      FloorShortName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}floor_short_name'])!,
      FloorName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}floor_name'])!,
      BuildingShortName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}building_short_name'])!,
      BuildingName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}building_name'])!,
      LocationName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}location_name'])!,
      CompanyName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      auditqname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}auditqname'])!,
      userid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}userid'])!,
      interval: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      sectorid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sectorid'])!,
      score: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      scoreid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}scoreid'])!,
      categoryid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}categoryid'])!,
      auditid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}auditid'])!,
      WingID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}wing_i_d'])!,
      FloorID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}floor_i_d'])!,
      BuildingID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}building_i_d'])!,
      LocationID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}location_i_d'])!,
      CompanyID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}company_i_d'])!,
      auditqid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}auditqid'])!,
    );
  }

  @override
  $QuestionTable createAlias(String alias) {
    return $QuestionTable(attachedDatabase, alias);
  }
}

class ScoreData extends DataClass implements Insertable<ScoreData> {
  final int id;
  final String colourcode;
  final String score;
  final String scorename;
  final int orderno;
  final int auditid;
  final int scoreid;
  const ScoreData(
      {required this.id,
      required this.colourcode,
      required this.score,
      required this.scorename,
      required this.orderno,
      required this.auditid,
      required this.scoreid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['colourcode'] = Variable<String>(colourcode);
    map['score'] = Variable<String>(score);
    map['scorename'] = Variable<String>(scorename);
    map['orderno'] = Variable<int>(orderno);
    map['auditid'] = Variable<int>(auditid);
    map['scoreid'] = Variable<int>(scoreid);
    return map;
  }

  ScoreCompanion toCompanion(bool nullToAbsent) {
    return ScoreCompanion(
      id: Value(id),
      colourcode: Value(colourcode),
      score: Value(score),
      scorename: Value(scorename),
      orderno: Value(orderno),
      auditid: Value(auditid),
      scoreid: Value(scoreid),
    );
  }

  factory ScoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScoreData(
      id: serializer.fromJson<int>(json['id']),
      colourcode: serializer.fromJson<String>(json['colourcode']),
      score: serializer.fromJson<String>(json['score']),
      scorename: serializer.fromJson<String>(json['scorename']),
      orderno: serializer.fromJson<int>(json['orderno']),
      auditid: serializer.fromJson<int>(json['auditid']),
      scoreid: serializer.fromJson<int>(json['scoreid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'colourcode': serializer.toJson<String>(colourcode),
      'score': serializer.toJson<String>(score),
      'scorename': serializer.toJson<String>(scorename),
      'orderno': serializer.toJson<int>(orderno),
      'auditid': serializer.toJson<int>(auditid),
      'scoreid': serializer.toJson<int>(scoreid),
    };
  }

  ScoreData copyWith(
          {int? id,
          String? colourcode,
          String? score,
          String? scorename,
          int? orderno,
          int? auditid,
          int? scoreid}) =>
      ScoreData(
        id: id ?? this.id,
        colourcode: colourcode ?? this.colourcode,
        score: score ?? this.score,
        scorename: scorename ?? this.scorename,
        orderno: orderno ?? this.orderno,
        auditid: auditid ?? this.auditid,
        scoreid: scoreid ?? this.scoreid,
      );
  @override
  String toString() {
    return (StringBuffer('ScoreData(')
          ..write('id: $id, ')
          ..write('colourcode: $colourcode, ')
          ..write('score: $score, ')
          ..write('scorename: $scorename, ')
          ..write('orderno: $orderno, ')
          ..write('auditid: $auditid, ')
          ..write('scoreid: $scoreid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, colourcode, score, scorename, orderno, auditid, scoreid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScoreData &&
          other.id == this.id &&
          other.colourcode == this.colourcode &&
          other.score == this.score &&
          other.scorename == this.scorename &&
          other.orderno == this.orderno &&
          other.auditid == this.auditid &&
          other.scoreid == this.scoreid);
}

class ScoreCompanion extends UpdateCompanion<ScoreData> {
  final Value<int> id;
  final Value<String> colourcode;
  final Value<String> score;
  final Value<String> scorename;
  final Value<int> orderno;
  final Value<int> auditid;
  final Value<int> scoreid;
  const ScoreCompanion({
    this.id = const Value.absent(),
    this.colourcode = const Value.absent(),
    this.score = const Value.absent(),
    this.scorename = const Value.absent(),
    this.orderno = const Value.absent(),
    this.auditid = const Value.absent(),
    this.scoreid = const Value.absent(),
  });
  ScoreCompanion.insert({
    this.id = const Value.absent(),
    required String colourcode,
    required String score,
    required String scorename,
    required int orderno,
    required int auditid,
    required int scoreid,
  })  : colourcode = Value(colourcode),
        score = Value(score),
        scorename = Value(scorename),
        orderno = Value(orderno),
        auditid = Value(auditid),
        scoreid = Value(scoreid);
  static Insertable<ScoreData> custom({
    Expression<int>? id,
    Expression<String>? colourcode,
    Expression<String>? score,
    Expression<String>? scorename,
    Expression<int>? orderno,
    Expression<int>? auditid,
    Expression<int>? scoreid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (colourcode != null) 'colourcode': colourcode,
      if (score != null) 'score': score,
      if (scorename != null) 'scorename': scorename,
      if (orderno != null) 'orderno': orderno,
      if (auditid != null) 'auditid': auditid,
      if (scoreid != null) 'scoreid': scoreid,
    });
  }

  ScoreCompanion copyWith(
      {Value<int>? id,
      Value<String>? colourcode,
      Value<String>? score,
      Value<String>? scorename,
      Value<int>? orderno,
      Value<int>? auditid,
      Value<int>? scoreid}) {
    return ScoreCompanion(
      id: id ?? this.id,
      colourcode: colourcode ?? this.colourcode,
      score: score ?? this.score,
      scorename: scorename ?? this.scorename,
      orderno: orderno ?? this.orderno,
      auditid: auditid ?? this.auditid,
      scoreid: scoreid ?? this.scoreid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (colourcode.present) {
      map['colourcode'] = Variable<String>(colourcode.value);
    }
    if (score.present) {
      map['score'] = Variable<String>(score.value);
    }
    if (scorename.present) {
      map['scorename'] = Variable<String>(scorename.value);
    }
    if (orderno.present) {
      map['orderno'] = Variable<int>(orderno.value);
    }
    if (auditid.present) {
      map['auditid'] = Variable<int>(auditid.value);
    }
    if (scoreid.present) {
      map['scoreid'] = Variable<int>(scoreid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoreCompanion(')
          ..write('id: $id, ')
          ..write('colourcode: $colourcode, ')
          ..write('score: $score, ')
          ..write('scorename: $scorename, ')
          ..write('orderno: $orderno, ')
          ..write('auditid: $auditid, ')
          ..write('scoreid: $scoreid')
          ..write(')'))
        .toString();
  }
}

class $ScoreTable extends Score with TableInfo<$ScoreTable, ScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScoreTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _colourcodeMeta = const VerificationMeta('colourcode');
  @override
  late final GeneratedColumn<String> colourcode = GeneratedColumn<String>(
      'colourcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<String> score = GeneratedColumn<String>(
      'score', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _scorenameMeta = const VerificationMeta('scorename');
  @override
  late final GeneratedColumn<String> scorename = GeneratedColumn<String>(
      'scorename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _ordernoMeta = const VerificationMeta('orderno');
  @override
  late final GeneratedColumn<int> orderno = GeneratedColumn<int>(
      'orderno', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditidMeta = const VerificationMeta('auditid');
  @override
  late final GeneratedColumn<int> auditid = GeneratedColumn<int>(
      'auditid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _scoreidMeta = const VerificationMeta('scoreid');
  @override
  late final GeneratedColumn<int> scoreid = GeneratedColumn<int>(
      'scoreid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, colourcode, score, scorename, orderno, auditid, scoreid];
  @override
  String get aliasedName => _alias ?? 'score';
  @override
  String get actualTableName => 'score';
  @override
  VerificationContext validateIntegrity(Insertable<ScoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('colourcode')) {
      context.handle(
          _colourcodeMeta,
          colourcode.isAcceptableOrUnknown(
              data['colourcode']!, _colourcodeMeta));
    } else if (isInserting) {
      context.missing(_colourcodeMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('scorename')) {
      context.handle(_scorenameMeta,
          scorename.isAcceptableOrUnknown(data['scorename']!, _scorenameMeta));
    } else if (isInserting) {
      context.missing(_scorenameMeta);
    }
    if (data.containsKey('orderno')) {
      context.handle(_ordernoMeta,
          orderno.isAcceptableOrUnknown(data['orderno']!, _ordernoMeta));
    } else if (isInserting) {
      context.missing(_ordernoMeta);
    }
    if (data.containsKey('auditid')) {
      context.handle(_auditidMeta,
          auditid.isAcceptableOrUnknown(data['auditid']!, _auditidMeta));
    } else if (isInserting) {
      context.missing(_auditidMeta);
    }
    if (data.containsKey('scoreid')) {
      context.handle(_scoreidMeta,
          scoreid.isAcceptableOrUnknown(data['scoreid']!, _scoreidMeta));
    } else if (isInserting) {
      context.missing(_scoreidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScoreData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      colourcode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}colourcode'])!,
      score: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}score'])!,
      scorename: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}scorename'])!,
      orderno: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}orderno'])!,
      auditid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}auditid'])!,
      scoreid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}scoreid'])!,
    );
  }

  @override
  $ScoreTable createAlias(String alias) {
    return $ScoreTable(attachedDatabase, alias);
  }
}

class SubParameterData extends DataClass
    implements Insertable<SubParameterData> {
  final int id;
  final String ParameterLimits;
  final String equiplimits;
  final String equipsubparamname;
  final String parametername;
  final String equipmentname;
  final String templatename;
  final int equiplimitid;
  final int equipsubparamid;
  final int equipmentparamid;
  final int equipmentnameid;
  final int equiptemplateid;
  final bool issubparamavailable;
  const SubParameterData(
      {required this.id,
      required this.ParameterLimits,
      required this.equiplimits,
      required this.equipsubparamname,
      required this.parametername,
      required this.equipmentname,
      required this.templatename,
      required this.equiplimitid,
      required this.equipsubparamid,
      required this.equipmentparamid,
      required this.equipmentnameid,
      required this.equiptemplateid,
      required this.issubparamavailable});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parameter_limits'] = Variable<String>(ParameterLimits);
    map['equiplimits'] = Variable<String>(equiplimits);
    map['equipsubparamname'] = Variable<String>(equipsubparamname);
    map['parametername'] = Variable<String>(parametername);
    map['equipmentname'] = Variable<String>(equipmentname);
    map['templatename'] = Variable<String>(templatename);
    map['equiplimitid'] = Variable<int>(equiplimitid);
    map['equipsubparamid'] = Variable<int>(equipsubparamid);
    map['equipmentparamid'] = Variable<int>(equipmentparamid);
    map['equipmentnameid'] = Variable<int>(equipmentnameid);
    map['equiptemplateid'] = Variable<int>(equiptemplateid);
    map['issubparamavailable'] = Variable<bool>(issubparamavailable);
    return map;
  }

  SubParameterCompanion toCompanion(bool nullToAbsent) {
    return SubParameterCompanion(
      id: Value(id),
      ParameterLimits: Value(ParameterLimits),
      equiplimits: Value(equiplimits),
      equipsubparamname: Value(equipsubparamname),
      parametername: Value(parametername),
      equipmentname: Value(equipmentname),
      templatename: Value(templatename),
      equiplimitid: Value(equiplimitid),
      equipsubparamid: Value(equipsubparamid),
      equipmentparamid: Value(equipmentparamid),
      equipmentnameid: Value(equipmentnameid),
      equiptemplateid: Value(equiptemplateid),
      issubparamavailable: Value(issubparamavailable),
    );
  }

  factory SubParameterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubParameterData(
      id: serializer.fromJson<int>(json['id']),
      ParameterLimits: serializer.fromJson<String>(json['ParameterLimits']),
      equiplimits: serializer.fromJson<String>(json['equiplimits']),
      equipsubparamname: serializer.fromJson<String>(json['equipsubparamname']),
      parametername: serializer.fromJson<String>(json['parametername']),
      equipmentname: serializer.fromJson<String>(json['equipmentname']),
      templatename: serializer.fromJson<String>(json['templatename']),
      equiplimitid: serializer.fromJson<int>(json['equiplimitid']),
      equipsubparamid: serializer.fromJson<int>(json['equipsubparamid']),
      equipmentparamid: serializer.fromJson<int>(json['equipmentparamid']),
      equipmentnameid: serializer.fromJson<int>(json['equipmentnameid']),
      equiptemplateid: serializer.fromJson<int>(json['equiptemplateid']),
      issubparamavailable:
          serializer.fromJson<bool>(json['issubparamavailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ParameterLimits': serializer.toJson<String>(ParameterLimits),
      'equiplimits': serializer.toJson<String>(equiplimits),
      'equipsubparamname': serializer.toJson<String>(equipsubparamname),
      'parametername': serializer.toJson<String>(parametername),
      'equipmentname': serializer.toJson<String>(equipmentname),
      'templatename': serializer.toJson<String>(templatename),
      'equiplimitid': serializer.toJson<int>(equiplimitid),
      'equipsubparamid': serializer.toJson<int>(equipsubparamid),
      'equipmentparamid': serializer.toJson<int>(equipmentparamid),
      'equipmentnameid': serializer.toJson<int>(equipmentnameid),
      'equiptemplateid': serializer.toJson<int>(equiptemplateid),
      'issubparamavailable': serializer.toJson<bool>(issubparamavailable),
    };
  }

  SubParameterData copyWith(
          {int? id,
          String? ParameterLimits,
          String? equiplimits,
          String? equipsubparamname,
          String? parametername,
          String? equipmentname,
          String? templatename,
          int? equiplimitid,
          int? equipsubparamid,
          int? equipmentparamid,
          int? equipmentnameid,
          int? equiptemplateid,
          bool? issubparamavailable}) =>
      SubParameterData(
        id: id ?? this.id,
        ParameterLimits: ParameterLimits ?? this.ParameterLimits,
        equiplimits: equiplimits ?? this.equiplimits,
        equipsubparamname: equipsubparamname ?? this.equipsubparamname,
        parametername: parametername ?? this.parametername,
        equipmentname: equipmentname ?? this.equipmentname,
        templatename: templatename ?? this.templatename,
        equiplimitid: equiplimitid ?? this.equiplimitid,
        equipsubparamid: equipsubparamid ?? this.equipsubparamid,
        equipmentparamid: equipmentparamid ?? this.equipmentparamid,
        equipmentnameid: equipmentnameid ?? this.equipmentnameid,
        equiptemplateid: equiptemplateid ?? this.equiptemplateid,
        issubparamavailable: issubparamavailable ?? this.issubparamavailable,
      );
  @override
  String toString() {
    return (StringBuffer('SubParameterData(')
          ..write('id: $id, ')
          ..write('ParameterLimits: $ParameterLimits, ')
          ..write('equiplimits: $equiplimits, ')
          ..write('equipsubparamname: $equipsubparamname, ')
          ..write('parametername: $parametername, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('templatename: $templatename, ')
          ..write('equiplimitid: $equiplimitid, ')
          ..write('equipsubparamid: $equipsubparamid, ')
          ..write('equipmentparamid: $equipmentparamid, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('equiptemplateid: $equiptemplateid, ')
          ..write('issubparamavailable: $issubparamavailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      ParameterLimits,
      equiplimits,
      equipsubparamname,
      parametername,
      equipmentname,
      templatename,
      equiplimitid,
      equipsubparamid,
      equipmentparamid,
      equipmentnameid,
      equiptemplateid,
      issubparamavailable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubParameterData &&
          other.id == this.id &&
          other.ParameterLimits == this.ParameterLimits &&
          other.equiplimits == this.equiplimits &&
          other.equipsubparamname == this.equipsubparamname &&
          other.parametername == this.parametername &&
          other.equipmentname == this.equipmentname &&
          other.templatename == this.templatename &&
          other.equiplimitid == this.equiplimitid &&
          other.equipsubparamid == this.equipsubparamid &&
          other.equipmentparamid == this.equipmentparamid &&
          other.equipmentnameid == this.equipmentnameid &&
          other.equiptemplateid == this.equiptemplateid &&
          other.issubparamavailable == this.issubparamavailable);
}

class SubParameterCompanion extends UpdateCompanion<SubParameterData> {
  final Value<int> id;
  final Value<String> ParameterLimits;
  final Value<String> equiplimits;
  final Value<String> equipsubparamname;
  final Value<String> parametername;
  final Value<String> equipmentname;
  final Value<String> templatename;
  final Value<int> equiplimitid;
  final Value<int> equipsubparamid;
  final Value<int> equipmentparamid;
  final Value<int> equipmentnameid;
  final Value<int> equiptemplateid;
  final Value<bool> issubparamavailable;
  const SubParameterCompanion({
    this.id = const Value.absent(),
    this.ParameterLimits = const Value.absent(),
    this.equiplimits = const Value.absent(),
    this.equipsubparamname = const Value.absent(),
    this.parametername = const Value.absent(),
    this.equipmentname = const Value.absent(),
    this.templatename = const Value.absent(),
    this.equiplimitid = const Value.absent(),
    this.equipsubparamid = const Value.absent(),
    this.equipmentparamid = const Value.absent(),
    this.equipmentnameid = const Value.absent(),
    this.equiptemplateid = const Value.absent(),
    this.issubparamavailable = const Value.absent(),
  });
  SubParameterCompanion.insert({
    this.id = const Value.absent(),
    required String ParameterLimits,
    required String equiplimits,
    required String equipsubparamname,
    required String parametername,
    required String equipmentname,
    required String templatename,
    required int equiplimitid,
    required int equipsubparamid,
    required int equipmentparamid,
    required int equipmentnameid,
    required int equiptemplateid,
    required bool issubparamavailable,
  })  : ParameterLimits = Value(ParameterLimits),
        equiplimits = Value(equiplimits),
        equipsubparamname = Value(equipsubparamname),
        parametername = Value(parametername),
        equipmentname = Value(equipmentname),
        templatename = Value(templatename),
        equiplimitid = Value(equiplimitid),
        equipsubparamid = Value(equipsubparamid),
        equipmentparamid = Value(equipmentparamid),
        equipmentnameid = Value(equipmentnameid),
        equiptemplateid = Value(equiptemplateid),
        issubparamavailable = Value(issubparamavailable);
  static Insertable<SubParameterData> custom({
    Expression<int>? id,
    Expression<String>? ParameterLimits,
    Expression<String>? equiplimits,
    Expression<String>? equipsubparamname,
    Expression<String>? parametername,
    Expression<String>? equipmentname,
    Expression<String>? templatename,
    Expression<int>? equiplimitid,
    Expression<int>? equipsubparamid,
    Expression<int>? equipmentparamid,
    Expression<int>? equipmentnameid,
    Expression<int>? equiptemplateid,
    Expression<bool>? issubparamavailable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ParameterLimits != null) 'parameter_limits': ParameterLimits,
      if (equiplimits != null) 'equiplimits': equiplimits,
      if (equipsubparamname != null) 'equipsubparamname': equipsubparamname,
      if (parametername != null) 'parametername': parametername,
      if (equipmentname != null) 'equipmentname': equipmentname,
      if (templatename != null) 'templatename': templatename,
      if (equiplimitid != null) 'equiplimitid': equiplimitid,
      if (equipsubparamid != null) 'equipsubparamid': equipsubparamid,
      if (equipmentparamid != null) 'equipmentparamid': equipmentparamid,
      if (equipmentnameid != null) 'equipmentnameid': equipmentnameid,
      if (equiptemplateid != null) 'equiptemplateid': equiptemplateid,
      if (issubparamavailable != null)
        'issubparamavailable': issubparamavailable,
    });
  }

  SubParameterCompanion copyWith(
      {Value<int>? id,
      Value<String>? ParameterLimits,
      Value<String>? equiplimits,
      Value<String>? equipsubparamname,
      Value<String>? parametername,
      Value<String>? equipmentname,
      Value<String>? templatename,
      Value<int>? equiplimitid,
      Value<int>? equipsubparamid,
      Value<int>? equipmentparamid,
      Value<int>? equipmentnameid,
      Value<int>? equiptemplateid,
      Value<bool>? issubparamavailable}) {
    return SubParameterCompanion(
      id: id ?? this.id,
      ParameterLimits: ParameterLimits ?? this.ParameterLimits,
      equiplimits: equiplimits ?? this.equiplimits,
      equipsubparamname: equipsubparamname ?? this.equipsubparamname,
      parametername: parametername ?? this.parametername,
      equipmentname: equipmentname ?? this.equipmentname,
      templatename: templatename ?? this.templatename,
      equiplimitid: equiplimitid ?? this.equiplimitid,
      equipsubparamid: equipsubparamid ?? this.equipsubparamid,
      equipmentparamid: equipmentparamid ?? this.equipmentparamid,
      equipmentnameid: equipmentnameid ?? this.equipmentnameid,
      equiptemplateid: equiptemplateid ?? this.equiptemplateid,
      issubparamavailable: issubparamavailable ?? this.issubparamavailable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ParameterLimits.present) {
      map['parameter_limits'] = Variable<String>(ParameterLimits.value);
    }
    if (equiplimits.present) {
      map['equiplimits'] = Variable<String>(equiplimits.value);
    }
    if (equipsubparamname.present) {
      map['equipsubparamname'] = Variable<String>(equipsubparamname.value);
    }
    if (parametername.present) {
      map['parametername'] = Variable<String>(parametername.value);
    }
    if (equipmentname.present) {
      map['equipmentname'] = Variable<String>(equipmentname.value);
    }
    if (templatename.present) {
      map['templatename'] = Variable<String>(templatename.value);
    }
    if (equiplimitid.present) {
      map['equiplimitid'] = Variable<int>(equiplimitid.value);
    }
    if (equipsubparamid.present) {
      map['equipsubparamid'] = Variable<int>(equipsubparamid.value);
    }
    if (equipmentparamid.present) {
      map['equipmentparamid'] = Variable<int>(equipmentparamid.value);
    }
    if (equipmentnameid.present) {
      map['equipmentnameid'] = Variable<int>(equipmentnameid.value);
    }
    if (equiptemplateid.present) {
      map['equiptemplateid'] = Variable<int>(equiptemplateid.value);
    }
    if (issubparamavailable.present) {
      map['issubparamavailable'] = Variable<bool>(issubparamavailable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubParameterCompanion(')
          ..write('id: $id, ')
          ..write('ParameterLimits: $ParameterLimits, ')
          ..write('equiplimits: $equiplimits, ')
          ..write('equipsubparamname: $equipsubparamname, ')
          ..write('parametername: $parametername, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('templatename: $templatename, ')
          ..write('equiplimitid: $equiplimitid, ')
          ..write('equipsubparamid: $equipsubparamid, ')
          ..write('equipmentparamid: $equipmentparamid, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('equiptemplateid: $equiptemplateid, ')
          ..write('issubparamavailable: $issubparamavailable')
          ..write(')'))
        .toString();
  }
}

class $SubParameterTable extends SubParameter
    with TableInfo<$SubParameterTable, SubParameterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubParameterTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _ParameterLimitsMeta =
      const VerificationMeta('ParameterLimits');
  @override
  late final GeneratedColumn<String> ParameterLimits = GeneratedColumn<String>(
      'parameter_limits', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equiplimitsMeta =
      const VerificationMeta('equiplimits');
  @override
  late final GeneratedColumn<String> equiplimits = GeneratedColumn<String>(
      'equiplimits', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipsubparamnameMeta =
      const VerificationMeta('equipsubparamname');
  @override
  late final GeneratedColumn<String> equipsubparamname =
      GeneratedColumn<String>('equipsubparamname', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _parameternameMeta =
      const VerificationMeta('parametername');
  @override
  late final GeneratedColumn<String> parametername = GeneratedColumn<String>(
      'parametername', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameMeta =
      const VerificationMeta('equipmentname');
  @override
  late final GeneratedColumn<String> equipmentname = GeneratedColumn<String>(
      'equipmentname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _templatenameMeta =
      const VerificationMeta('templatename');
  @override
  late final GeneratedColumn<String> templatename = GeneratedColumn<String>(
      'templatename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equiplimitidMeta =
      const VerificationMeta('equiplimitid');
  @override
  late final GeneratedColumn<int> equiplimitid = GeneratedColumn<int>(
      'equiplimitid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipsubparamidMeta =
      const VerificationMeta('equipsubparamid');
  @override
  late final GeneratedColumn<int> equipsubparamid = GeneratedColumn<int>(
      'equipsubparamid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentparamidMeta =
      const VerificationMeta('equipmentparamid');
  @override
  late final GeneratedColumn<int> equipmentparamid = GeneratedColumn<int>(
      'equipmentparamid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameidMeta =
      const VerificationMeta('equipmentnameid');
  @override
  late final GeneratedColumn<int> equipmentnameid = GeneratedColumn<int>(
      'equipmentnameid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equiptemplateidMeta =
      const VerificationMeta('equiptemplateid');
  @override
  late final GeneratedColumn<int> equiptemplateid = GeneratedColumn<int>(
      'equiptemplateid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _issubparamavailableMeta =
      const VerificationMeta('issubparamavailable');
  @override
  late final GeneratedColumn<bool> issubparamavailable = GeneratedColumn<bool>(
      'issubparamavailable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("issubparamavailable" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ParameterLimits,
        equiplimits,
        equipsubparamname,
        parametername,
        equipmentname,
        templatename,
        equiplimitid,
        equipsubparamid,
        equipmentparamid,
        equipmentnameid,
        equiptemplateid,
        issubparamavailable
      ];
  @override
  String get aliasedName => _alias ?? 'sub_parameter';
  @override
  String get actualTableName => 'sub_parameter';
  @override
  VerificationContext validateIntegrity(Insertable<SubParameterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parameter_limits')) {
      context.handle(
          _ParameterLimitsMeta,
          ParameterLimits.isAcceptableOrUnknown(
              data['parameter_limits']!, _ParameterLimitsMeta));
    } else if (isInserting) {
      context.missing(_ParameterLimitsMeta);
    }
    if (data.containsKey('equiplimits')) {
      context.handle(
          _equiplimitsMeta,
          equiplimits.isAcceptableOrUnknown(
              data['equiplimits']!, _equiplimitsMeta));
    } else if (isInserting) {
      context.missing(_equiplimitsMeta);
    }
    if (data.containsKey('equipsubparamname')) {
      context.handle(
          _equipsubparamnameMeta,
          equipsubparamname.isAcceptableOrUnknown(
              data['equipsubparamname']!, _equipsubparamnameMeta));
    } else if (isInserting) {
      context.missing(_equipsubparamnameMeta);
    }
    if (data.containsKey('parametername')) {
      context.handle(
          _parameternameMeta,
          parametername.isAcceptableOrUnknown(
              data['parametername']!, _parameternameMeta));
    } else if (isInserting) {
      context.missing(_parameternameMeta);
    }
    if (data.containsKey('equipmentname')) {
      context.handle(
          _equipmentnameMeta,
          equipmentname.isAcceptableOrUnknown(
              data['equipmentname']!, _equipmentnameMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameMeta);
    }
    if (data.containsKey('templatename')) {
      context.handle(
          _templatenameMeta,
          templatename.isAcceptableOrUnknown(
              data['templatename']!, _templatenameMeta));
    } else if (isInserting) {
      context.missing(_templatenameMeta);
    }
    if (data.containsKey('equiplimitid')) {
      context.handle(
          _equiplimitidMeta,
          equiplimitid.isAcceptableOrUnknown(
              data['equiplimitid']!, _equiplimitidMeta));
    } else if (isInserting) {
      context.missing(_equiplimitidMeta);
    }
    if (data.containsKey('equipsubparamid')) {
      context.handle(
          _equipsubparamidMeta,
          equipsubparamid.isAcceptableOrUnknown(
              data['equipsubparamid']!, _equipsubparamidMeta));
    } else if (isInserting) {
      context.missing(_equipsubparamidMeta);
    }
    if (data.containsKey('equipmentparamid')) {
      context.handle(
          _equipmentparamidMeta,
          equipmentparamid.isAcceptableOrUnknown(
              data['equipmentparamid']!, _equipmentparamidMeta));
    } else if (isInserting) {
      context.missing(_equipmentparamidMeta);
    }
    if (data.containsKey('equipmentnameid')) {
      context.handle(
          _equipmentnameidMeta,
          equipmentnameid.isAcceptableOrUnknown(
              data['equipmentnameid']!, _equipmentnameidMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameidMeta);
    }
    if (data.containsKey('equiptemplateid')) {
      context.handle(
          _equiptemplateidMeta,
          equiptemplateid.isAcceptableOrUnknown(
              data['equiptemplateid']!, _equiptemplateidMeta));
    } else if (isInserting) {
      context.missing(_equiptemplateidMeta);
    }
    if (data.containsKey('issubparamavailable')) {
      context.handle(
          _issubparamavailableMeta,
          issubparamavailable.isAcceptableOrUnknown(
              data['issubparamavailable']!, _issubparamavailableMeta));
    } else if (isInserting) {
      context.missing(_issubparamavailableMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubParameterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubParameterData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ParameterLimits: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}parameter_limits'])!,
      equiplimits: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}equiplimits'])!,
      equipsubparamname: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}equipsubparamname'])!,
      parametername: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}parametername'])!,
      equipmentname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}equipmentname'])!,
      templatename: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}templatename'])!,
      equiplimitid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equiplimitid'])!,
      equipsubparamid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipsubparamid'])!,
      equipmentparamid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipmentparamid'])!,
      equipmentnameid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipmentnameid'])!,
      equiptemplateid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equiptemplateid'])!,
      issubparamavailable: attachedDatabase.options.types.read(
          DriftSqlType.bool, data['${effectivePrefix}issubparamavailable'])!,
    );
  }

  @override
  $SubParameterTable createAlias(String alias) {
    return $SubParameterTable(attachedDatabase, alias);
  }
}

class TemplateData extends DataClass implements Insertable<TemplateData> {
  final int id;
  final String templatename;
  final String categoryname;
  final String guid;
  final int templateid;
  final int categoryid;
  final bool isSaturdayReq;
  final bool isSundayReq;
  const TemplateData(
      {required this.id,
      required this.templatename,
      required this.categoryname,
      required this.guid,
      required this.templateid,
      required this.categoryid,
      required this.isSaturdayReq,
      required this.isSundayReq});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['templatename'] = Variable<String>(templatename);
    map['categoryname'] = Variable<String>(categoryname);
    map['guid'] = Variable<String>(guid);
    map['templateid'] = Variable<int>(templateid);
    map['categoryid'] = Variable<int>(categoryid);
    map['is_saturday_req'] = Variable<bool>(isSaturdayReq);
    map['is_sunday_req'] = Variable<bool>(isSundayReq);
    return map;
  }

  TemplateCompanion toCompanion(bool nullToAbsent) {
    return TemplateCompanion(
      id: Value(id),
      templatename: Value(templatename),
      categoryname: Value(categoryname),
      guid: Value(guid),
      templateid: Value(templateid),
      categoryid: Value(categoryid),
      isSaturdayReq: Value(isSaturdayReq),
      isSundayReq: Value(isSundayReq),
    );
  }

  factory TemplateData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateData(
      id: serializer.fromJson<int>(json['id']),
      templatename: serializer.fromJson<String>(json['templatename']),
      categoryname: serializer.fromJson<String>(json['categoryname']),
      guid: serializer.fromJson<String>(json['guid']),
      templateid: serializer.fromJson<int>(json['templateid']),
      categoryid: serializer.fromJson<int>(json['categoryid']),
      isSaturdayReq: serializer.fromJson<bool>(json['isSaturdayReq']),
      isSundayReq: serializer.fromJson<bool>(json['isSundayReq']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'templatename': serializer.toJson<String>(templatename),
      'categoryname': serializer.toJson<String>(categoryname),
      'guid': serializer.toJson<String>(guid),
      'templateid': serializer.toJson<int>(templateid),
      'categoryid': serializer.toJson<int>(categoryid),
      'isSaturdayReq': serializer.toJson<bool>(isSaturdayReq),
      'isSundayReq': serializer.toJson<bool>(isSundayReq),
    };
  }

  TemplateData copyWith(
          {int? id,
          String? templatename,
          String? categoryname,
          String? guid,
          int? templateid,
          int? categoryid,
          bool? isSaturdayReq,
          bool? isSundayReq}) =>
      TemplateData(
        id: id ?? this.id,
        templatename: templatename ?? this.templatename,
        categoryname: categoryname ?? this.categoryname,
        guid: guid ?? this.guid,
        templateid: templateid ?? this.templateid,
        categoryid: categoryid ?? this.categoryid,
        isSaturdayReq: isSaturdayReq ?? this.isSaturdayReq,
        isSundayReq: isSundayReq ?? this.isSundayReq,
      );
  @override
  String toString() {
    return (StringBuffer('TemplateData(')
          ..write('id: $id, ')
          ..write('templatename: $templatename, ')
          ..write('categoryname: $categoryname, ')
          ..write('guid: $guid, ')
          ..write('templateid: $templateid, ')
          ..write('categoryid: $categoryid, ')
          ..write('isSaturdayReq: $isSaturdayReq, ')
          ..write('isSundayReq: $isSundayReq')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templatename, categoryname, guid,
      templateid, categoryid, isSaturdayReq, isSundayReq);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateData &&
          other.id == this.id &&
          other.templatename == this.templatename &&
          other.categoryname == this.categoryname &&
          other.guid == this.guid &&
          other.templateid == this.templateid &&
          other.categoryid == this.categoryid &&
          other.isSaturdayReq == this.isSaturdayReq &&
          other.isSundayReq == this.isSundayReq);
}

class TemplateCompanion extends UpdateCompanion<TemplateData> {
  final Value<int> id;
  final Value<String> templatename;
  final Value<String> categoryname;
  final Value<String> guid;
  final Value<int> templateid;
  final Value<int> categoryid;
  final Value<bool> isSaturdayReq;
  final Value<bool> isSundayReq;
  const TemplateCompanion({
    this.id = const Value.absent(),
    this.templatename = const Value.absent(),
    this.categoryname = const Value.absent(),
    this.guid = const Value.absent(),
    this.templateid = const Value.absent(),
    this.categoryid = const Value.absent(),
    this.isSaturdayReq = const Value.absent(),
    this.isSundayReq = const Value.absent(),
  });
  TemplateCompanion.insert({
    this.id = const Value.absent(),
    required String templatename,
    required String categoryname,
    required String guid,
    required int templateid,
    required int categoryid,
    required bool isSaturdayReq,
    required bool isSundayReq,
  })  : templatename = Value(templatename),
        categoryname = Value(categoryname),
        guid = Value(guid),
        templateid = Value(templateid),
        categoryid = Value(categoryid),
        isSaturdayReq = Value(isSaturdayReq),
        isSundayReq = Value(isSundayReq);
  static Insertable<TemplateData> custom({
    Expression<int>? id,
    Expression<String>? templatename,
    Expression<String>? categoryname,
    Expression<String>? guid,
    Expression<int>? templateid,
    Expression<int>? categoryid,
    Expression<bool>? isSaturdayReq,
    Expression<bool>? isSundayReq,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templatename != null) 'templatename': templatename,
      if (categoryname != null) 'categoryname': categoryname,
      if (guid != null) 'guid': guid,
      if (templateid != null) 'templateid': templateid,
      if (categoryid != null) 'categoryid': categoryid,
      if (isSaturdayReq != null) 'is_saturday_req': isSaturdayReq,
      if (isSundayReq != null) 'is_sunday_req': isSundayReq,
    });
  }

  TemplateCompanion copyWith(
      {Value<int>? id,
      Value<String>? templatename,
      Value<String>? categoryname,
      Value<String>? guid,
      Value<int>? templateid,
      Value<int>? categoryid,
      Value<bool>? isSaturdayReq,
      Value<bool>? isSundayReq}) {
    return TemplateCompanion(
      id: id ?? this.id,
      templatename: templatename ?? this.templatename,
      categoryname: categoryname ?? this.categoryname,
      guid: guid ?? this.guid,
      templateid: templateid ?? this.templateid,
      categoryid: categoryid ?? this.categoryid,
      isSaturdayReq: isSaturdayReq ?? this.isSaturdayReq,
      isSundayReq: isSundayReq ?? this.isSundayReq,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (templatename.present) {
      map['templatename'] = Variable<String>(templatename.value);
    }
    if (categoryname.present) {
      map['categoryname'] = Variable<String>(categoryname.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (templateid.present) {
      map['templateid'] = Variable<int>(templateid.value);
    }
    if (categoryid.present) {
      map['categoryid'] = Variable<int>(categoryid.value);
    }
    if (isSaturdayReq.present) {
      map['is_saturday_req'] = Variable<bool>(isSaturdayReq.value);
    }
    if (isSundayReq.present) {
      map['is_sunday_req'] = Variable<bool>(isSundayReq.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateCompanion(')
          ..write('id: $id, ')
          ..write('templatename: $templatename, ')
          ..write('categoryname: $categoryname, ')
          ..write('guid: $guid, ')
          ..write('templateid: $templateid, ')
          ..write('categoryid: $categoryid, ')
          ..write('isSaturdayReq: $isSaturdayReq, ')
          ..write('isSundayReq: $isSundayReq')
          ..write(')'))
        .toString();
  }
}

class $TemplateTable extends Template
    with TableInfo<$TemplateTable, TemplateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _templatenameMeta =
      const VerificationMeta('templatename');
  @override
  late final GeneratedColumn<String> templatename = GeneratedColumn<String>(
      'templatename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categorynameMeta =
      const VerificationMeta('categoryname');
  @override
  late final GeneratedColumn<String> categoryname = GeneratedColumn<String>(
      'categoryname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _templateidMeta = const VerificationMeta('templateid');
  @override
  late final GeneratedColumn<int> templateid = GeneratedColumn<int>(
      'templateid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _categoryidMeta = const VerificationMeta('categoryid');
  @override
  late final GeneratedColumn<int> categoryid = GeneratedColumn<int>(
      'categoryid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _isSaturdayReqMeta =
      const VerificationMeta('isSaturdayReq');
  @override
  late final GeneratedColumn<bool> isSaturdayReq = GeneratedColumn<bool>(
      'is_saturday_req', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_saturday_req" IN (0, 1))');
  final VerificationMeta _isSundayReqMeta =
      const VerificationMeta('isSundayReq');
  @override
  late final GeneratedColumn<bool> isSundayReq = GeneratedColumn<bool>(
      'is_sunday_req', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_sunday_req" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        templatename,
        categoryname,
        guid,
        templateid,
        categoryid,
        isSaturdayReq,
        isSundayReq
      ];
  @override
  String get aliasedName => _alias ?? 'template';
  @override
  String get actualTableName => 'template';
  @override
  VerificationContext validateIntegrity(Insertable<TemplateData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('templatename')) {
      context.handle(
          _templatenameMeta,
          templatename.isAcceptableOrUnknown(
              data['templatename']!, _templatenameMeta));
    } else if (isInserting) {
      context.missing(_templatenameMeta);
    }
    if (data.containsKey('categoryname')) {
      context.handle(
          _categorynameMeta,
          categoryname.isAcceptableOrUnknown(
              data['categoryname']!, _categorynameMeta));
    } else if (isInserting) {
      context.missing(_categorynameMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('templateid')) {
      context.handle(
          _templateidMeta,
          templateid.isAcceptableOrUnknown(
              data['templateid']!, _templateidMeta));
    } else if (isInserting) {
      context.missing(_templateidMeta);
    }
    if (data.containsKey('categoryid')) {
      context.handle(
          _categoryidMeta,
          categoryid.isAcceptableOrUnknown(
              data['categoryid']!, _categoryidMeta));
    } else if (isInserting) {
      context.missing(_categoryidMeta);
    }
    if (data.containsKey('is_saturday_req')) {
      context.handle(
          _isSaturdayReqMeta,
          isSaturdayReq.isAcceptableOrUnknown(
              data['is_saturday_req']!, _isSaturdayReqMeta));
    } else if (isInserting) {
      context.missing(_isSaturdayReqMeta);
    }
    if (data.containsKey('is_sunday_req')) {
      context.handle(
          _isSundayReqMeta,
          isSundayReq.isAcceptableOrUnknown(
              data['is_sunday_req']!, _isSundayReqMeta));
    } else if (isInserting) {
      context.missing(_isSundayReqMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      templatename: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}templatename'])!,
      categoryname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}categoryname'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      templateid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}templateid'])!,
      categoryid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}categoryid'])!,
      isSaturdayReq: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saturday_req'])!,
      isSundayReq: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sunday_req'])!,
    );
  }

  @override
  $TemplateTable createAlias(String alias) {
    return $TemplateTable(attachedDatabase, alias);
  }
}

class TemplateDetailData extends DataClass
    implements Insertable<TemplateDetailData> {
  final int id;
  final int UserID;
  final String equipmentname;
  final int equipmentnameid;
  final String templatename;
  final int equipmenttemplateid;
  final String guid;
  final int interval;
  final String endtime;
  final String starttime;
  final String categoryname;
  final int categoryid;
  final String auditname;
  final int auditid;
  final String wingname;
  final int wingid;
  final String floorname;
  final int floorid;
  final String buildingname;
  final int BuildingID;
  final String LocationName;
  final int locationid;
  final int sectorid;
  final String companyname;
  final int companyid;
  const TemplateDetailData(
      {required this.id,
      required this.UserID,
      required this.equipmentname,
      required this.equipmentnameid,
      required this.templatename,
      required this.equipmenttemplateid,
      required this.guid,
      required this.interval,
      required this.endtime,
      required this.starttime,
      required this.categoryname,
      required this.categoryid,
      required this.auditname,
      required this.auditid,
      required this.wingname,
      required this.wingid,
      required this.floorname,
      required this.floorid,
      required this.buildingname,
      required this.BuildingID,
      required this.LocationName,
      required this.locationid,
      required this.sectorid,
      required this.companyname,
      required this.companyid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_i_d'] = Variable<int>(UserID);
    map['equipmentname'] = Variable<String>(equipmentname);
    map['equipmentnameid'] = Variable<int>(equipmentnameid);
    map['templatename'] = Variable<String>(templatename);
    map['equipmenttemplateid'] = Variable<int>(equipmenttemplateid);
    map['guid'] = Variable<String>(guid);
    map['interval'] = Variable<int>(interval);
    map['endtime'] = Variable<String>(endtime);
    map['starttime'] = Variable<String>(starttime);
    map['categoryname'] = Variable<String>(categoryname);
    map['categoryid'] = Variable<int>(categoryid);
    map['auditname'] = Variable<String>(auditname);
    map['auditid'] = Variable<int>(auditid);
    map['wingname'] = Variable<String>(wingname);
    map['wingid'] = Variable<int>(wingid);
    map['floorname'] = Variable<String>(floorname);
    map['floorid'] = Variable<int>(floorid);
    map['buildingname'] = Variable<String>(buildingname);
    map['building_i_d'] = Variable<int>(BuildingID);
    map['location_name'] = Variable<String>(LocationName);
    map['locationid'] = Variable<int>(locationid);
    map['sectorid'] = Variable<int>(sectorid);
    map['companyname'] = Variable<String>(companyname);
    map['companyid'] = Variable<int>(companyid);
    return map;
  }

  TemplateDetailCompanion toCompanion(bool nullToAbsent) {
    return TemplateDetailCompanion(
      id: Value(id),
      UserID: Value(UserID),
      equipmentname: Value(equipmentname),
      equipmentnameid: Value(equipmentnameid),
      templatename: Value(templatename),
      equipmenttemplateid: Value(equipmenttemplateid),
      guid: Value(guid),
      interval: Value(interval),
      endtime: Value(endtime),
      starttime: Value(starttime),
      categoryname: Value(categoryname),
      categoryid: Value(categoryid),
      auditname: Value(auditname),
      auditid: Value(auditid),
      wingname: Value(wingname),
      wingid: Value(wingid),
      floorname: Value(floorname),
      floorid: Value(floorid),
      buildingname: Value(buildingname),
      BuildingID: Value(BuildingID),
      LocationName: Value(LocationName),
      locationid: Value(locationid),
      sectorid: Value(sectorid),
      companyname: Value(companyname),
      companyid: Value(companyid),
    );
  }

  factory TemplateDetailData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateDetailData(
      id: serializer.fromJson<int>(json['id']),
      UserID: serializer.fromJson<int>(json['UserID']),
      equipmentname: serializer.fromJson<String>(json['equipmentname']),
      equipmentnameid: serializer.fromJson<int>(json['equipmentnameid']),
      templatename: serializer.fromJson<String>(json['templatename']),
      equipmenttemplateid:
          serializer.fromJson<int>(json['equipmenttemplateid']),
      guid: serializer.fromJson<String>(json['guid']),
      interval: serializer.fromJson<int>(json['interval']),
      endtime: serializer.fromJson<String>(json['endtime']),
      starttime: serializer.fromJson<String>(json['starttime']),
      categoryname: serializer.fromJson<String>(json['categoryname']),
      categoryid: serializer.fromJson<int>(json['categoryid']),
      auditname: serializer.fromJson<String>(json['auditname']),
      auditid: serializer.fromJson<int>(json['auditid']),
      wingname: serializer.fromJson<String>(json['wingname']),
      wingid: serializer.fromJson<int>(json['wingid']),
      floorname: serializer.fromJson<String>(json['floorname']),
      floorid: serializer.fromJson<int>(json['floorid']),
      buildingname: serializer.fromJson<String>(json['buildingname']),
      BuildingID: serializer.fromJson<int>(json['BuildingID']),
      LocationName: serializer.fromJson<String>(json['LocationName']),
      locationid: serializer.fromJson<int>(json['locationid']),
      sectorid: serializer.fromJson<int>(json['sectorid']),
      companyname: serializer.fromJson<String>(json['companyname']),
      companyid: serializer.fromJson<int>(json['companyid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'UserID': serializer.toJson<int>(UserID),
      'equipmentname': serializer.toJson<String>(equipmentname),
      'equipmentnameid': serializer.toJson<int>(equipmentnameid),
      'templatename': serializer.toJson<String>(templatename),
      'equipmenttemplateid': serializer.toJson<int>(equipmenttemplateid),
      'guid': serializer.toJson<String>(guid),
      'interval': serializer.toJson<int>(interval),
      'endtime': serializer.toJson<String>(endtime),
      'starttime': serializer.toJson<String>(starttime),
      'categoryname': serializer.toJson<String>(categoryname),
      'categoryid': serializer.toJson<int>(categoryid),
      'auditname': serializer.toJson<String>(auditname),
      'auditid': serializer.toJson<int>(auditid),
      'wingname': serializer.toJson<String>(wingname),
      'wingid': serializer.toJson<int>(wingid),
      'floorname': serializer.toJson<String>(floorname),
      'floorid': serializer.toJson<int>(floorid),
      'buildingname': serializer.toJson<String>(buildingname),
      'BuildingID': serializer.toJson<int>(BuildingID),
      'LocationName': serializer.toJson<String>(LocationName),
      'locationid': serializer.toJson<int>(locationid),
      'sectorid': serializer.toJson<int>(sectorid),
      'companyname': serializer.toJson<String>(companyname),
      'companyid': serializer.toJson<int>(companyid),
    };
  }

  TemplateDetailData copyWith(
          {int? id,
          int? UserID,
          String? equipmentname,
          int? equipmentnameid,
          String? templatename,
          int? equipmenttemplateid,
          String? guid,
          int? interval,
          String? endtime,
          String? starttime,
          String? categoryname,
          int? categoryid,
          String? auditname,
          int? auditid,
          String? wingname,
          int? wingid,
          String? floorname,
          int? floorid,
          String? buildingname,
          int? BuildingID,
          String? LocationName,
          int? locationid,
          int? sectorid,
          String? companyname,
          int? companyid}) =>
      TemplateDetailData(
        id: id ?? this.id,
        UserID: UserID ?? this.UserID,
        equipmentname: equipmentname ?? this.equipmentname,
        equipmentnameid: equipmentnameid ?? this.equipmentnameid,
        templatename: templatename ?? this.templatename,
        equipmenttemplateid: equipmenttemplateid ?? this.equipmenttemplateid,
        guid: guid ?? this.guid,
        interval: interval ?? this.interval,
        endtime: endtime ?? this.endtime,
        starttime: starttime ?? this.starttime,
        categoryname: categoryname ?? this.categoryname,
        categoryid: categoryid ?? this.categoryid,
        auditname: auditname ?? this.auditname,
        auditid: auditid ?? this.auditid,
        wingname: wingname ?? this.wingname,
        wingid: wingid ?? this.wingid,
        floorname: floorname ?? this.floorname,
        floorid: floorid ?? this.floorid,
        buildingname: buildingname ?? this.buildingname,
        BuildingID: BuildingID ?? this.BuildingID,
        LocationName: LocationName ?? this.LocationName,
        locationid: locationid ?? this.locationid,
        sectorid: sectorid ?? this.sectorid,
        companyname: companyname ?? this.companyname,
        companyid: companyid ?? this.companyid,
      );
  @override
  String toString() {
    return (StringBuffer('TemplateDetailData(')
          ..write('id: $id, ')
          ..write('UserID: $UserID, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('templatename: $templatename, ')
          ..write('equipmenttemplateid: $equipmenttemplateid, ')
          ..write('guid: $guid, ')
          ..write('interval: $interval, ')
          ..write('endtime: $endtime, ')
          ..write('starttime: $starttime, ')
          ..write('categoryname: $categoryname, ')
          ..write('categoryid: $categoryid, ')
          ..write('auditname: $auditname, ')
          ..write('auditid: $auditid, ')
          ..write('wingname: $wingname, ')
          ..write('wingid: $wingid, ')
          ..write('floorname: $floorname, ')
          ..write('floorid: $floorid, ')
          ..write('buildingname: $buildingname, ')
          ..write('BuildingID: $BuildingID, ')
          ..write('LocationName: $LocationName, ')
          ..write('locationid: $locationid, ')
          ..write('sectorid: $sectorid, ')
          ..write('companyname: $companyname, ')
          ..write('companyid: $companyid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        UserID,
        equipmentname,
        equipmentnameid,
        templatename,
        equipmenttemplateid,
        guid,
        interval,
        endtime,
        starttime,
        categoryname,
        categoryid,
        auditname,
        auditid,
        wingname,
        wingid,
        floorname,
        floorid,
        buildingname,
        BuildingID,
        LocationName,
        locationid,
        sectorid,
        companyname,
        companyid
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateDetailData &&
          other.id == this.id &&
          other.UserID == this.UserID &&
          other.equipmentname == this.equipmentname &&
          other.equipmentnameid == this.equipmentnameid &&
          other.templatename == this.templatename &&
          other.equipmenttemplateid == this.equipmenttemplateid &&
          other.guid == this.guid &&
          other.interval == this.interval &&
          other.endtime == this.endtime &&
          other.starttime == this.starttime &&
          other.categoryname == this.categoryname &&
          other.categoryid == this.categoryid &&
          other.auditname == this.auditname &&
          other.auditid == this.auditid &&
          other.wingname == this.wingname &&
          other.wingid == this.wingid &&
          other.floorname == this.floorname &&
          other.floorid == this.floorid &&
          other.buildingname == this.buildingname &&
          other.BuildingID == this.BuildingID &&
          other.LocationName == this.LocationName &&
          other.locationid == this.locationid &&
          other.sectorid == this.sectorid &&
          other.companyname == this.companyname &&
          other.companyid == this.companyid);
}

class TemplateDetailCompanion extends UpdateCompanion<TemplateDetailData> {
  final Value<int> id;
  final Value<int> UserID;
  final Value<String> equipmentname;
  final Value<int> equipmentnameid;
  final Value<String> templatename;
  final Value<int> equipmenttemplateid;
  final Value<String> guid;
  final Value<int> interval;
  final Value<String> endtime;
  final Value<String> starttime;
  final Value<String> categoryname;
  final Value<int> categoryid;
  final Value<String> auditname;
  final Value<int> auditid;
  final Value<String> wingname;
  final Value<int> wingid;
  final Value<String> floorname;
  final Value<int> floorid;
  final Value<String> buildingname;
  final Value<int> BuildingID;
  final Value<String> LocationName;
  final Value<int> locationid;
  final Value<int> sectorid;
  final Value<String> companyname;
  final Value<int> companyid;
  const TemplateDetailCompanion({
    this.id = const Value.absent(),
    this.UserID = const Value.absent(),
    this.equipmentname = const Value.absent(),
    this.equipmentnameid = const Value.absent(),
    this.templatename = const Value.absent(),
    this.equipmenttemplateid = const Value.absent(),
    this.guid = const Value.absent(),
    this.interval = const Value.absent(),
    this.endtime = const Value.absent(),
    this.starttime = const Value.absent(),
    this.categoryname = const Value.absent(),
    this.categoryid = const Value.absent(),
    this.auditname = const Value.absent(),
    this.auditid = const Value.absent(),
    this.wingname = const Value.absent(),
    this.wingid = const Value.absent(),
    this.floorname = const Value.absent(),
    this.floorid = const Value.absent(),
    this.buildingname = const Value.absent(),
    this.BuildingID = const Value.absent(),
    this.LocationName = const Value.absent(),
    this.locationid = const Value.absent(),
    this.sectorid = const Value.absent(),
    this.companyname = const Value.absent(),
    this.companyid = const Value.absent(),
  });
  TemplateDetailCompanion.insert({
    this.id = const Value.absent(),
    required int UserID,
    required String equipmentname,
    required int equipmentnameid,
    required String templatename,
    required int equipmenttemplateid,
    required String guid,
    required int interval,
    required String endtime,
    required String starttime,
    required String categoryname,
    required int categoryid,
    required String auditname,
    required int auditid,
    required String wingname,
    required int wingid,
    required String floorname,
    required int floorid,
    required String buildingname,
    required int BuildingID,
    required String LocationName,
    required int locationid,
    required int sectorid,
    required String companyname,
    required int companyid,
  })  : UserID = Value(UserID),
        equipmentname = Value(equipmentname),
        equipmentnameid = Value(equipmentnameid),
        templatename = Value(templatename),
        equipmenttemplateid = Value(equipmenttemplateid),
        guid = Value(guid),
        interval = Value(interval),
        endtime = Value(endtime),
        starttime = Value(starttime),
        categoryname = Value(categoryname),
        categoryid = Value(categoryid),
        auditname = Value(auditname),
        auditid = Value(auditid),
        wingname = Value(wingname),
        wingid = Value(wingid),
        floorname = Value(floorname),
        floorid = Value(floorid),
        buildingname = Value(buildingname),
        BuildingID = Value(BuildingID),
        LocationName = Value(LocationName),
        locationid = Value(locationid),
        sectorid = Value(sectorid),
        companyname = Value(companyname),
        companyid = Value(companyid);
  static Insertable<TemplateDetailData> custom({
    Expression<int>? id,
    Expression<int>? UserID,
    Expression<String>? equipmentname,
    Expression<int>? equipmentnameid,
    Expression<String>? templatename,
    Expression<int>? equipmenttemplateid,
    Expression<String>? guid,
    Expression<int>? interval,
    Expression<String>? endtime,
    Expression<String>? starttime,
    Expression<String>? categoryname,
    Expression<int>? categoryid,
    Expression<String>? auditname,
    Expression<int>? auditid,
    Expression<String>? wingname,
    Expression<int>? wingid,
    Expression<String>? floorname,
    Expression<int>? floorid,
    Expression<String>? buildingname,
    Expression<int>? BuildingID,
    Expression<String>? LocationName,
    Expression<int>? locationid,
    Expression<int>? sectorid,
    Expression<String>? companyname,
    Expression<int>? companyid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (UserID != null) 'user_i_d': UserID,
      if (equipmentname != null) 'equipmentname': equipmentname,
      if (equipmentnameid != null) 'equipmentnameid': equipmentnameid,
      if (templatename != null) 'templatename': templatename,
      if (equipmenttemplateid != null)
        'equipmenttemplateid': equipmenttemplateid,
      if (guid != null) 'guid': guid,
      if (interval != null) 'interval': interval,
      if (endtime != null) 'endtime': endtime,
      if (starttime != null) 'starttime': starttime,
      if (categoryname != null) 'categoryname': categoryname,
      if (categoryid != null) 'categoryid': categoryid,
      if (auditname != null) 'auditname': auditname,
      if (auditid != null) 'auditid': auditid,
      if (wingname != null) 'wingname': wingname,
      if (wingid != null) 'wingid': wingid,
      if (floorname != null) 'floorname': floorname,
      if (floorid != null) 'floorid': floorid,
      if (buildingname != null) 'buildingname': buildingname,
      if (BuildingID != null) 'building_i_d': BuildingID,
      if (LocationName != null) 'location_name': LocationName,
      if (locationid != null) 'locationid': locationid,
      if (sectorid != null) 'sectorid': sectorid,
      if (companyname != null) 'companyname': companyname,
      if (companyid != null) 'companyid': companyid,
    });
  }

  TemplateDetailCompanion copyWith(
      {Value<int>? id,
      Value<int>? UserID,
      Value<String>? equipmentname,
      Value<int>? equipmentnameid,
      Value<String>? templatename,
      Value<int>? equipmenttemplateid,
      Value<String>? guid,
      Value<int>? interval,
      Value<String>? endtime,
      Value<String>? starttime,
      Value<String>? categoryname,
      Value<int>? categoryid,
      Value<String>? auditname,
      Value<int>? auditid,
      Value<String>? wingname,
      Value<int>? wingid,
      Value<String>? floorname,
      Value<int>? floorid,
      Value<String>? buildingname,
      Value<int>? BuildingID,
      Value<String>? LocationName,
      Value<int>? locationid,
      Value<int>? sectorid,
      Value<String>? companyname,
      Value<int>? companyid}) {
    return TemplateDetailCompanion(
      id: id ?? this.id,
      UserID: UserID ?? this.UserID,
      equipmentname: equipmentname ?? this.equipmentname,
      equipmentnameid: equipmentnameid ?? this.equipmentnameid,
      templatename: templatename ?? this.templatename,
      equipmenttemplateid: equipmenttemplateid ?? this.equipmenttemplateid,
      guid: guid ?? this.guid,
      interval: interval ?? this.interval,
      endtime: endtime ?? this.endtime,
      starttime: starttime ?? this.starttime,
      categoryname: categoryname ?? this.categoryname,
      categoryid: categoryid ?? this.categoryid,
      auditname: auditname ?? this.auditname,
      auditid: auditid ?? this.auditid,
      wingname: wingname ?? this.wingname,
      wingid: wingid ?? this.wingid,
      floorname: floorname ?? this.floorname,
      floorid: floorid ?? this.floorid,
      buildingname: buildingname ?? this.buildingname,
      BuildingID: BuildingID ?? this.BuildingID,
      LocationName: LocationName ?? this.LocationName,
      locationid: locationid ?? this.locationid,
      sectorid: sectorid ?? this.sectorid,
      companyname: companyname ?? this.companyname,
      companyid: companyid ?? this.companyid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (UserID.present) {
      map['user_i_d'] = Variable<int>(UserID.value);
    }
    if (equipmentname.present) {
      map['equipmentname'] = Variable<String>(equipmentname.value);
    }
    if (equipmentnameid.present) {
      map['equipmentnameid'] = Variable<int>(equipmentnameid.value);
    }
    if (templatename.present) {
      map['templatename'] = Variable<String>(templatename.value);
    }
    if (equipmenttemplateid.present) {
      map['equipmenttemplateid'] = Variable<int>(equipmenttemplateid.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (endtime.present) {
      map['endtime'] = Variable<String>(endtime.value);
    }
    if (starttime.present) {
      map['starttime'] = Variable<String>(starttime.value);
    }
    if (categoryname.present) {
      map['categoryname'] = Variable<String>(categoryname.value);
    }
    if (categoryid.present) {
      map['categoryid'] = Variable<int>(categoryid.value);
    }
    if (auditname.present) {
      map['auditname'] = Variable<String>(auditname.value);
    }
    if (auditid.present) {
      map['auditid'] = Variable<int>(auditid.value);
    }
    if (wingname.present) {
      map['wingname'] = Variable<String>(wingname.value);
    }
    if (wingid.present) {
      map['wingid'] = Variable<int>(wingid.value);
    }
    if (floorname.present) {
      map['floorname'] = Variable<String>(floorname.value);
    }
    if (floorid.present) {
      map['floorid'] = Variable<int>(floorid.value);
    }
    if (buildingname.present) {
      map['buildingname'] = Variable<String>(buildingname.value);
    }
    if (BuildingID.present) {
      map['building_i_d'] = Variable<int>(BuildingID.value);
    }
    if (LocationName.present) {
      map['location_name'] = Variable<String>(LocationName.value);
    }
    if (locationid.present) {
      map['locationid'] = Variable<int>(locationid.value);
    }
    if (sectorid.present) {
      map['sectorid'] = Variable<int>(sectorid.value);
    }
    if (companyname.present) {
      map['companyname'] = Variable<String>(companyname.value);
    }
    if (companyid.present) {
      map['companyid'] = Variable<int>(companyid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateDetailCompanion(')
          ..write('id: $id, ')
          ..write('UserID: $UserID, ')
          ..write('equipmentname: $equipmentname, ')
          ..write('equipmentnameid: $equipmentnameid, ')
          ..write('templatename: $templatename, ')
          ..write('equipmenttemplateid: $equipmenttemplateid, ')
          ..write('guid: $guid, ')
          ..write('interval: $interval, ')
          ..write('endtime: $endtime, ')
          ..write('starttime: $starttime, ')
          ..write('categoryname: $categoryname, ')
          ..write('categoryid: $categoryid, ')
          ..write('auditname: $auditname, ')
          ..write('auditid: $auditid, ')
          ..write('wingname: $wingname, ')
          ..write('wingid: $wingid, ')
          ..write('floorname: $floorname, ')
          ..write('floorid: $floorid, ')
          ..write('buildingname: $buildingname, ')
          ..write('BuildingID: $BuildingID, ')
          ..write('LocationName: $LocationName, ')
          ..write('locationid: $locationid, ')
          ..write('sectorid: $sectorid, ')
          ..write('companyname: $companyname, ')
          ..write('companyid: $companyid')
          ..write(')'))
        .toString();
  }
}

class $TemplateDetailTable extends TemplateDetail
    with TableInfo<$TemplateDetailTable, TemplateDetailData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateDetailTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _UserIDMeta = const VerificationMeta('UserID');
  @override
  late final GeneratedColumn<int> UserID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameMeta =
      const VerificationMeta('equipmentname');
  @override
  late final GeneratedColumn<String> equipmentname = GeneratedColumn<String>(
      'equipmentname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipmentnameidMeta =
      const VerificationMeta('equipmentnameid');
  @override
  late final GeneratedColumn<int> equipmentnameid = GeneratedColumn<int>(
      'equipmentnameid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _templatenameMeta =
      const VerificationMeta('templatename');
  @override
  late final GeneratedColumn<String> templatename = GeneratedColumn<String>(
      'templatename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _equipmenttemplateidMeta =
      const VerificationMeta('equipmenttemplateid');
  @override
  late final GeneratedColumn<int> equipmenttemplateid = GeneratedColumn<int>(
      'equipmenttemplateid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
      'guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _intervalMeta = const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _endtimeMeta = const VerificationMeta('endtime');
  @override
  late final GeneratedColumn<String> endtime = GeneratedColumn<String>(
      'endtime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _starttimeMeta = const VerificationMeta('starttime');
  @override
  late final GeneratedColumn<String> starttime = GeneratedColumn<String>(
      'starttime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categorynameMeta =
      const VerificationMeta('categoryname');
  @override
  late final GeneratedColumn<String> categoryname = GeneratedColumn<String>(
      'categoryname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categoryidMeta = const VerificationMeta('categoryid');
  @override
  late final GeneratedColumn<int> categoryid = GeneratedColumn<int>(
      'categoryid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _auditnameMeta = const VerificationMeta('auditname');
  @override
  late final GeneratedColumn<String> auditname = GeneratedColumn<String>(
      'auditname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _auditidMeta = const VerificationMeta('auditid');
  @override
  late final GeneratedColumn<int> auditid = GeneratedColumn<int>(
      'auditid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _wingnameMeta = const VerificationMeta('wingname');
  @override
  late final GeneratedColumn<String> wingname = GeneratedColumn<String>(
      'wingname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _wingidMeta = const VerificationMeta('wingid');
  @override
  late final GeneratedColumn<int> wingid = GeneratedColumn<int>(
      'wingid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _floornameMeta = const VerificationMeta('floorname');
  @override
  late final GeneratedColumn<String> floorname = GeneratedColumn<String>(
      'floorname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _flooridMeta = const VerificationMeta('floorid');
  @override
  late final GeneratedColumn<int> floorid = GeneratedColumn<int>(
      'floorid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _buildingnameMeta =
      const VerificationMeta('buildingname');
  @override
  late final GeneratedColumn<String> buildingname = GeneratedColumn<String>(
      'buildingname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _BuildingIDMeta = const VerificationMeta('BuildingID');
  @override
  late final GeneratedColumn<int> BuildingID = GeneratedColumn<int>(
      'building_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _LocationNameMeta =
      const VerificationMeta('LocationName');
  @override
  late final GeneratedColumn<String> LocationName = GeneratedColumn<String>(
      'location_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _locationidMeta = const VerificationMeta('locationid');
  @override
  late final GeneratedColumn<int> locationid = GeneratedColumn<int>(
      'locationid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _sectoridMeta = const VerificationMeta('sectorid');
  @override
  late final GeneratedColumn<int> sectorid = GeneratedColumn<int>(
      'sectorid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _companynameMeta =
      const VerificationMeta('companyname');
  @override
  late final GeneratedColumn<String> companyname = GeneratedColumn<String>(
      'companyname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companyidMeta = const VerificationMeta('companyid');
  @override
  late final GeneratedColumn<int> companyid = GeneratedColumn<int>(
      'companyid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        UserID,
        equipmentname,
        equipmentnameid,
        templatename,
        equipmenttemplateid,
        guid,
        interval,
        endtime,
        starttime,
        categoryname,
        categoryid,
        auditname,
        auditid,
        wingname,
        wingid,
        floorname,
        floorid,
        buildingname,
        BuildingID,
        LocationName,
        locationid,
        sectorid,
        companyname,
        companyid
      ];
  @override
  String get aliasedName => _alias ?? 'template_detail';
  @override
  String get actualTableName => 'template_detail';
  @override
  VerificationContext validateIntegrity(Insertable<TemplateDetailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_i_d')) {
      context.handle(_UserIDMeta,
          UserID.isAcceptableOrUnknown(data['user_i_d']!, _UserIDMeta));
    } else if (isInserting) {
      context.missing(_UserIDMeta);
    }
    if (data.containsKey('equipmentname')) {
      context.handle(
          _equipmentnameMeta,
          equipmentname.isAcceptableOrUnknown(
              data['equipmentname']!, _equipmentnameMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameMeta);
    }
    if (data.containsKey('equipmentnameid')) {
      context.handle(
          _equipmentnameidMeta,
          equipmentnameid.isAcceptableOrUnknown(
              data['equipmentnameid']!, _equipmentnameidMeta));
    } else if (isInserting) {
      context.missing(_equipmentnameidMeta);
    }
    if (data.containsKey('templatename')) {
      context.handle(
          _templatenameMeta,
          templatename.isAcceptableOrUnknown(
              data['templatename']!, _templatenameMeta));
    } else if (isInserting) {
      context.missing(_templatenameMeta);
    }
    if (data.containsKey('equipmenttemplateid')) {
      context.handle(
          _equipmenttemplateidMeta,
          equipmenttemplateid.isAcceptableOrUnknown(
              data['equipmenttemplateid']!, _equipmenttemplateidMeta));
    } else if (isInserting) {
      context.missing(_equipmenttemplateidMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid']!, _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    } else if (isInserting) {
      context.missing(_intervalMeta);
    }
    if (data.containsKey('endtime')) {
      context.handle(_endtimeMeta,
          endtime.isAcceptableOrUnknown(data['endtime']!, _endtimeMeta));
    } else if (isInserting) {
      context.missing(_endtimeMeta);
    }
    if (data.containsKey('starttime')) {
      context.handle(_starttimeMeta,
          starttime.isAcceptableOrUnknown(data['starttime']!, _starttimeMeta));
    } else if (isInserting) {
      context.missing(_starttimeMeta);
    }
    if (data.containsKey('categoryname')) {
      context.handle(
          _categorynameMeta,
          categoryname.isAcceptableOrUnknown(
              data['categoryname']!, _categorynameMeta));
    } else if (isInserting) {
      context.missing(_categorynameMeta);
    }
    if (data.containsKey('categoryid')) {
      context.handle(
          _categoryidMeta,
          categoryid.isAcceptableOrUnknown(
              data['categoryid']!, _categoryidMeta));
    } else if (isInserting) {
      context.missing(_categoryidMeta);
    }
    if (data.containsKey('auditname')) {
      context.handle(_auditnameMeta,
          auditname.isAcceptableOrUnknown(data['auditname']!, _auditnameMeta));
    } else if (isInserting) {
      context.missing(_auditnameMeta);
    }
    if (data.containsKey('auditid')) {
      context.handle(_auditidMeta,
          auditid.isAcceptableOrUnknown(data['auditid']!, _auditidMeta));
    } else if (isInserting) {
      context.missing(_auditidMeta);
    }
    if (data.containsKey('wingname')) {
      context.handle(_wingnameMeta,
          wingname.isAcceptableOrUnknown(data['wingname']!, _wingnameMeta));
    } else if (isInserting) {
      context.missing(_wingnameMeta);
    }
    if (data.containsKey('wingid')) {
      context.handle(_wingidMeta,
          wingid.isAcceptableOrUnknown(data['wingid']!, _wingidMeta));
    } else if (isInserting) {
      context.missing(_wingidMeta);
    }
    if (data.containsKey('floorname')) {
      context.handle(_floornameMeta,
          floorname.isAcceptableOrUnknown(data['floorname']!, _floornameMeta));
    } else if (isInserting) {
      context.missing(_floornameMeta);
    }
    if (data.containsKey('floorid')) {
      context.handle(_flooridMeta,
          floorid.isAcceptableOrUnknown(data['floorid']!, _flooridMeta));
    } else if (isInserting) {
      context.missing(_flooridMeta);
    }
    if (data.containsKey('buildingname')) {
      context.handle(
          _buildingnameMeta,
          buildingname.isAcceptableOrUnknown(
              data['buildingname']!, _buildingnameMeta));
    } else if (isInserting) {
      context.missing(_buildingnameMeta);
    }
    if (data.containsKey('building_i_d')) {
      context.handle(
          _BuildingIDMeta,
          BuildingID.isAcceptableOrUnknown(
              data['building_i_d']!, _BuildingIDMeta));
    } else if (isInserting) {
      context.missing(_BuildingIDMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _LocationNameMeta,
          LocationName.isAcceptableOrUnknown(
              data['location_name']!, _LocationNameMeta));
    } else if (isInserting) {
      context.missing(_LocationNameMeta);
    }
    if (data.containsKey('locationid')) {
      context.handle(
          _locationidMeta,
          locationid.isAcceptableOrUnknown(
              data['locationid']!, _locationidMeta));
    } else if (isInserting) {
      context.missing(_locationidMeta);
    }
    if (data.containsKey('sectorid')) {
      context.handle(_sectoridMeta,
          sectorid.isAcceptableOrUnknown(data['sectorid']!, _sectoridMeta));
    } else if (isInserting) {
      context.missing(_sectoridMeta);
    }
    if (data.containsKey('companyname')) {
      context.handle(
          _companynameMeta,
          companyname.isAcceptableOrUnknown(
              data['companyname']!, _companynameMeta));
    } else if (isInserting) {
      context.missing(_companynameMeta);
    }
    if (data.containsKey('companyid')) {
      context.handle(_companyidMeta,
          companyid.isAcceptableOrUnknown(data['companyid']!, _companyidMeta));
    } else if (isInserting) {
      context.missing(_companyidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateDetailData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateDetailData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      UserID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
      equipmentname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}equipmentname'])!,
      equipmentnameid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}equipmentnameid'])!,
      templatename: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}templatename'])!,
      equipmenttemplateid: attachedDatabase.options.types.read(
          DriftSqlType.int, data['${effectivePrefix}equipmenttemplateid'])!,
      guid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}guid'])!,
      interval: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      endtime: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}endtime'])!,
      starttime: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}starttime'])!,
      categoryname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}categoryname'])!,
      categoryid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}categoryid'])!,
      auditname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}auditname'])!,
      auditid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}auditid'])!,
      wingname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}wingname'])!,
      wingid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}wingid'])!,
      floorname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}floorname'])!,
      floorid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}floorid'])!,
      buildingname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}buildingname'])!,
      BuildingID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}building_i_d'])!,
      LocationName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}location_name'])!,
      locationid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}locationid'])!,
      sectorid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sectorid'])!,
      companyname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}companyname'])!,
      companyid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}companyid'])!,
    );
  }

  @override
  $TemplateDetailTable createAlias(String alias) {
    return $TemplateDetailTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String AppTypes;
  final int ProductID;
  final String Language;
  final String RoleShortName;
  final String mobileno;
  final String emailid;
  final String name;
  final bool islogsheet;
  final bool isadmin;
  final bool ishelpdesk;
  final bool ischecklist;
  final String locationame;
  final String companylogo;
  final String companyName;
  final String userID;
  final String password;
  final int locationID;
  final int CompanyID;
  final String Department;
  const UserData(
      {required this.id,
      required this.AppTypes,
      required this.ProductID,
      required this.Language,
      required this.RoleShortName,
      required this.mobileno,
      required this.emailid,
      required this.name,
      required this.islogsheet,
      required this.isadmin,
      required this.ishelpdesk,
      required this.ischecklist,
      required this.locationame,
      required this.companylogo,
      required this.companyName,
      required this.userID,
      required this.password,
      required this.locationID,
      required this.CompanyID,
      required this.Department});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['app_types'] = Variable<String>(AppTypes);
    map['product_i_d'] = Variable<int>(ProductID);
    map['language'] = Variable<String>(Language);
    map['role_short_name'] = Variable<String>(RoleShortName);
    map['mobileno'] = Variable<String>(mobileno);
    map['emailid'] = Variable<String>(emailid);
    map['name'] = Variable<String>(name);
    map['islogsheet'] = Variable<bool>(islogsheet);
    map['isadmin'] = Variable<bool>(isadmin);
    map['ishelpdesk'] = Variable<bool>(ishelpdesk);
    map['ischecklist'] = Variable<bool>(ischecklist);
    map['locationame'] = Variable<String>(locationame);
    map['companylogo'] = Variable<String>(companylogo);
    map['company_name'] = Variable<String>(companyName);
    map['user_i_d'] = Variable<String>(userID);
    map['password'] = Variable<String>(password);
    map['location_i_d'] = Variable<int>(locationID);
    map['company_i_d'] = Variable<int>(CompanyID);
    map['department'] = Variable<String>(Department);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      AppTypes: Value(AppTypes),
      ProductID: Value(ProductID),
      Language: Value(Language),
      RoleShortName: Value(RoleShortName),
      mobileno: Value(mobileno),
      emailid: Value(emailid),
      name: Value(name),
      islogsheet: Value(islogsheet),
      isadmin: Value(isadmin),
      ishelpdesk: Value(ishelpdesk),
      ischecklist: Value(ischecklist),
      locationame: Value(locationame),
      companylogo: Value(companylogo),
      companyName: Value(companyName),
      userID: Value(userID),
      password: Value(password),
      locationID: Value(locationID),
      CompanyID: Value(CompanyID),
      Department: Value(Department),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      AppTypes: serializer.fromJson<String>(json['AppTypes']),
      ProductID: serializer.fromJson<int>(json['ProductID']),
      Language: serializer.fromJson<String>(json['Language']),
      RoleShortName: serializer.fromJson<String>(json['RoleShortName']),
      mobileno: serializer.fromJson<String>(json['mobileno']),
      emailid: serializer.fromJson<String>(json['emailid']),
      name: serializer.fromJson<String>(json['name']),
      islogsheet: serializer.fromJson<bool>(json['islogsheet']),
      isadmin: serializer.fromJson<bool>(json['isadmin']),
      ishelpdesk: serializer.fromJson<bool>(json['ishelpdesk']),
      ischecklist: serializer.fromJson<bool>(json['ischecklist']),
      locationame: serializer.fromJson<String>(json['locationame']),
      companylogo: serializer.fromJson<String>(json['companylogo']),
      companyName: serializer.fromJson<String>(json['companyName']),
      userID: serializer.fromJson<String>(json['userID']),
      password: serializer.fromJson<String>(json['password']),
      locationID: serializer.fromJson<int>(json['locationID']),
      CompanyID: serializer.fromJson<int>(json['CompanyID']),
      Department: serializer.fromJson<String>(json['Department']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'AppTypes': serializer.toJson<String>(AppTypes),
      'ProductID': serializer.toJson<int>(ProductID),
      'Language': serializer.toJson<String>(Language),
      'RoleShortName': serializer.toJson<String>(RoleShortName),
      'mobileno': serializer.toJson<String>(mobileno),
      'emailid': serializer.toJson<String>(emailid),
      'name': serializer.toJson<String>(name),
      'islogsheet': serializer.toJson<bool>(islogsheet),
      'isadmin': serializer.toJson<bool>(isadmin),
      'ishelpdesk': serializer.toJson<bool>(ishelpdesk),
      'ischecklist': serializer.toJson<bool>(ischecklist),
      'locationame': serializer.toJson<String>(locationame),
      'companylogo': serializer.toJson<String>(companylogo),
      'companyName': serializer.toJson<String>(companyName),
      'userID': serializer.toJson<String>(userID),
      'password': serializer.toJson<String>(password),
      'locationID': serializer.toJson<int>(locationID),
      'CompanyID': serializer.toJson<int>(CompanyID),
      'Department': serializer.toJson<String>(Department),
    };
  }

  UserData copyWith(
          {int? id,
          String? AppTypes,
          int? ProductID,
          String? Language,
          String? RoleShortName,
          String? mobileno,
          String? emailid,
          String? name,
          bool? islogsheet,
          bool? isadmin,
          bool? ishelpdesk,
          bool? ischecklist,
          String? locationame,
          String? companylogo,
          String? companyName,
          String? userID,
          String? password,
          int? locationID,
          int? CompanyID,
          String? Department}) =>
      UserData(
        id: id ?? this.id,
        AppTypes: AppTypes ?? this.AppTypes,
        ProductID: ProductID ?? this.ProductID,
        Language: Language ?? this.Language,
        RoleShortName: RoleShortName ?? this.RoleShortName,
        mobileno: mobileno ?? this.mobileno,
        emailid: emailid ?? this.emailid,
        name: name ?? this.name,
        islogsheet: islogsheet ?? this.islogsheet,
        isadmin: isadmin ?? this.isadmin,
        ishelpdesk: ishelpdesk ?? this.ishelpdesk,
        ischecklist: ischecklist ?? this.ischecklist,
        locationame: locationame ?? this.locationame,
        companylogo: companylogo ?? this.companylogo,
        companyName: companyName ?? this.companyName,
        userID: userID ?? this.userID,
        password: password ?? this.password,
        locationID: locationID ?? this.locationID,
        CompanyID: CompanyID ?? this.CompanyID,
        Department: Department ?? this.Department,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('AppTypes: $AppTypes, ')
          ..write('ProductID: $ProductID, ')
          ..write('Language: $Language, ')
          ..write('RoleShortName: $RoleShortName, ')
          ..write('mobileno: $mobileno, ')
          ..write('emailid: $emailid, ')
          ..write('name: $name, ')
          ..write('islogsheet: $islogsheet, ')
          ..write('isadmin: $isadmin, ')
          ..write('ishelpdesk: $ishelpdesk, ')
          ..write('ischecklist: $ischecklist, ')
          ..write('locationame: $locationame, ')
          ..write('companylogo: $companylogo, ')
          ..write('companyName: $companyName, ')
          ..write('userID: $userID, ')
          ..write('password: $password, ')
          ..write('locationID: $locationID, ')
          ..write('CompanyID: $CompanyID, ')
          ..write('Department: $Department')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      AppTypes,
      ProductID,
      Language,
      RoleShortName,
      mobileno,
      emailid,
      name,
      islogsheet,
      isadmin,
      ishelpdesk,
      ischecklist,
      locationame,
      companylogo,
      companyName,
      userID,
      password,
      locationID,
      CompanyID,
      Department);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.AppTypes == this.AppTypes &&
          other.ProductID == this.ProductID &&
          other.Language == this.Language &&
          other.RoleShortName == this.RoleShortName &&
          other.mobileno == this.mobileno &&
          other.emailid == this.emailid &&
          other.name == this.name &&
          other.islogsheet == this.islogsheet &&
          other.isadmin == this.isadmin &&
          other.ishelpdesk == this.ishelpdesk &&
          other.ischecklist == this.ischecklist &&
          other.locationame == this.locationame &&
          other.companylogo == this.companylogo &&
          other.companyName == this.companyName &&
          other.userID == this.userID &&
          other.password == this.password &&
          other.locationID == this.locationID &&
          other.CompanyID == this.CompanyID &&
          other.Department == this.Department);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> AppTypes;
  final Value<int> ProductID;
  final Value<String> Language;
  final Value<String> RoleShortName;
  final Value<String> mobileno;
  final Value<String> emailid;
  final Value<String> name;
  final Value<bool> islogsheet;
  final Value<bool> isadmin;
  final Value<bool> ishelpdesk;
  final Value<bool> ischecklist;
  final Value<String> locationame;
  final Value<String> companylogo;
  final Value<String> companyName;
  final Value<String> userID;
  final Value<String> password;
  final Value<int> locationID;
  final Value<int> CompanyID;
  final Value<String> Department;
  const UserCompanion({
    this.id = const Value.absent(),
    this.AppTypes = const Value.absent(),
    this.ProductID = const Value.absent(),
    this.Language = const Value.absent(),
    this.RoleShortName = const Value.absent(),
    this.mobileno = const Value.absent(),
    this.emailid = const Value.absent(),
    this.name = const Value.absent(),
    this.islogsheet = const Value.absent(),
    this.isadmin = const Value.absent(),
    this.ishelpdesk = const Value.absent(),
    this.ischecklist = const Value.absent(),
    this.locationame = const Value.absent(),
    this.companylogo = const Value.absent(),
    this.companyName = const Value.absent(),
    this.userID = const Value.absent(),
    this.password = const Value.absent(),
    this.locationID = const Value.absent(),
    this.CompanyID = const Value.absent(),
    this.Department = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String AppTypes,
    required int ProductID,
    required String Language,
    required String RoleShortName,
    required String mobileno,
    required String emailid,
    required String name,
    required bool islogsheet,
    required bool isadmin,
    required bool ishelpdesk,
    required bool ischecklist,
    required String locationame,
    required String companylogo,
    required String companyName,
    required String userID,
    required String password,
    required int locationID,
    required int CompanyID,
    required String Department,
  })  : AppTypes = Value(AppTypes),
        ProductID = Value(ProductID),
        Language = Value(Language),
        RoleShortName = Value(RoleShortName),
        mobileno = Value(mobileno),
        emailid = Value(emailid),
        name = Value(name),
        islogsheet = Value(islogsheet),
        isadmin = Value(isadmin),
        ishelpdesk = Value(ishelpdesk),
        ischecklist = Value(ischecklist),
        locationame = Value(locationame),
        companylogo = Value(companylogo),
        companyName = Value(companyName),
        userID = Value(userID),
        password = Value(password),
        locationID = Value(locationID),
        CompanyID = Value(CompanyID),
        Department = Value(Department);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? AppTypes,
    Expression<int>? ProductID,
    Expression<String>? Language,
    Expression<String>? RoleShortName,
    Expression<String>? mobileno,
    Expression<String>? emailid,
    Expression<String>? name,
    Expression<bool>? islogsheet,
    Expression<bool>? isadmin,
    Expression<bool>? ishelpdesk,
    Expression<bool>? ischecklist,
    Expression<String>? locationame,
    Expression<String>? companylogo,
    Expression<String>? companyName,
    Expression<String>? userID,
    Expression<String>? password,
    Expression<int>? locationID,
    Expression<int>? CompanyID,
    Expression<String>? Department,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (AppTypes != null) 'app_types': AppTypes,
      if (ProductID != null) 'product_i_d': ProductID,
      if (Language != null) 'language': Language,
      if (RoleShortName != null) 'role_short_name': RoleShortName,
      if (mobileno != null) 'mobileno': mobileno,
      if (emailid != null) 'emailid': emailid,
      if (name != null) 'name': name,
      if (islogsheet != null) 'islogsheet': islogsheet,
      if (isadmin != null) 'isadmin': isadmin,
      if (ishelpdesk != null) 'ishelpdesk': ishelpdesk,
      if (ischecklist != null) 'ischecklist': ischecklist,
      if (locationame != null) 'locationame': locationame,
      if (companylogo != null) 'companylogo': companylogo,
      if (companyName != null) 'company_name': companyName,
      if (userID != null) 'user_i_d': userID,
      if (password != null) 'password': password,
      if (locationID != null) 'location_i_d': locationID,
      if (CompanyID != null) 'company_i_d': CompanyID,
      if (Department != null) 'department': Department,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? AppTypes,
      Value<int>? ProductID,
      Value<String>? Language,
      Value<String>? RoleShortName,
      Value<String>? mobileno,
      Value<String>? emailid,
      Value<String>? name,
      Value<bool>? islogsheet,
      Value<bool>? isadmin,
      Value<bool>? ishelpdesk,
      Value<bool>? ischecklist,
      Value<String>? locationame,
      Value<String>? companylogo,
      Value<String>? companyName,
      Value<String>? userID,
      Value<String>? password,
      Value<int>? locationID,
      Value<int>? CompanyID,
      Value<String>? Department}) {
    return UserCompanion(
      id: id ?? this.id,
      AppTypes: AppTypes ?? this.AppTypes,
      ProductID: ProductID ?? this.ProductID,
      Language: Language ?? this.Language,
      RoleShortName: RoleShortName ?? this.RoleShortName,
      mobileno: mobileno ?? this.mobileno,
      emailid: emailid ?? this.emailid,
      name: name ?? this.name,
      islogsheet: islogsheet ?? this.islogsheet,
      isadmin: isadmin ?? this.isadmin,
      ishelpdesk: ishelpdesk ?? this.ishelpdesk,
      ischecklist: ischecklist ?? this.ischecklist,
      locationame: locationame ?? this.locationame,
      companylogo: companylogo ?? this.companylogo,
      companyName: companyName ?? this.companyName,
      userID: userID ?? this.userID,
      password: password ?? this.password,
      locationID: locationID ?? this.locationID,
      CompanyID: CompanyID ?? this.CompanyID,
      Department: Department ?? this.Department,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (AppTypes.present) {
      map['app_types'] = Variable<String>(AppTypes.value);
    }
    if (ProductID.present) {
      map['product_i_d'] = Variable<int>(ProductID.value);
    }
    if (Language.present) {
      map['language'] = Variable<String>(Language.value);
    }
    if (RoleShortName.present) {
      map['role_short_name'] = Variable<String>(RoleShortName.value);
    }
    if (mobileno.present) {
      map['mobileno'] = Variable<String>(mobileno.value);
    }
    if (emailid.present) {
      map['emailid'] = Variable<String>(emailid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (islogsheet.present) {
      map['islogsheet'] = Variable<bool>(islogsheet.value);
    }
    if (isadmin.present) {
      map['isadmin'] = Variable<bool>(isadmin.value);
    }
    if (ishelpdesk.present) {
      map['ishelpdesk'] = Variable<bool>(ishelpdesk.value);
    }
    if (ischecklist.present) {
      map['ischecklist'] = Variable<bool>(ischecklist.value);
    }
    if (locationame.present) {
      map['locationame'] = Variable<String>(locationame.value);
    }
    if (companylogo.present) {
      map['companylogo'] = Variable<String>(companylogo.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<String>(userID.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (locationID.present) {
      map['location_i_d'] = Variable<int>(locationID.value);
    }
    if (CompanyID.present) {
      map['company_i_d'] = Variable<int>(CompanyID.value);
    }
    if (Department.present) {
      map['department'] = Variable<String>(Department.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('AppTypes: $AppTypes, ')
          ..write('ProductID: $ProductID, ')
          ..write('Language: $Language, ')
          ..write('RoleShortName: $RoleShortName, ')
          ..write('mobileno: $mobileno, ')
          ..write('emailid: $emailid, ')
          ..write('name: $name, ')
          ..write('islogsheet: $islogsheet, ')
          ..write('isadmin: $isadmin, ')
          ..write('ishelpdesk: $ishelpdesk, ')
          ..write('ischecklist: $ischecklist, ')
          ..write('locationame: $locationame, ')
          ..write('companylogo: $companylogo, ')
          ..write('companyName: $companyName, ')
          ..write('userID: $userID, ')
          ..write('password: $password, ')
          ..write('locationID: $locationID, ')
          ..write('CompanyID: $CompanyID, ')
          ..write('Department: $Department')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _AppTypesMeta = const VerificationMeta('AppTypes');
  @override
  late final GeneratedColumn<String> AppTypes = GeneratedColumn<String>(
      'app_types', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _ProductIDMeta = const VerificationMeta('ProductID');
  @override
  late final GeneratedColumn<int> ProductID = GeneratedColumn<int>(
      'product_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _LanguageMeta = const VerificationMeta('Language');
  @override
  late final GeneratedColumn<String> Language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _RoleShortNameMeta =
      const VerificationMeta('RoleShortName');
  @override
  late final GeneratedColumn<String> RoleShortName = GeneratedColumn<String>(
      'role_short_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _mobilenoMeta = const VerificationMeta('mobileno');
  @override
  late final GeneratedColumn<String> mobileno = GeneratedColumn<String>(
      'mobileno', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _emailidMeta = const VerificationMeta('emailid');
  @override
  late final GeneratedColumn<String> emailid = GeneratedColumn<String>(
      'emailid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _islogsheetMeta = const VerificationMeta('islogsheet');
  @override
  late final GeneratedColumn<bool> islogsheet = GeneratedColumn<bool>(
      'islogsheet', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("islogsheet" IN (0, 1))');
  final VerificationMeta _isadminMeta = const VerificationMeta('isadmin');
  @override
  late final GeneratedColumn<bool> isadmin = GeneratedColumn<bool>(
      'isadmin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("isadmin" IN (0, 1))');
  final VerificationMeta _ishelpdeskMeta = const VerificationMeta('ishelpdesk');
  @override
  late final GeneratedColumn<bool> ishelpdesk = GeneratedColumn<bool>(
      'ishelpdesk', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("ishelpdesk" IN (0, 1))');
  final VerificationMeta _ischecklistMeta =
      const VerificationMeta('ischecklist');
  @override
  late final GeneratedColumn<bool> ischecklist = GeneratedColumn<bool>(
      'ischecklist', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("ischecklist" IN (0, 1))');
  final VerificationMeta _locationameMeta =
      const VerificationMeta('locationame');
  @override
  late final GeneratedColumn<String> locationame = GeneratedColumn<String>(
      'locationame', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companylogoMeta =
      const VerificationMeta('companylogo');
  @override
  late final GeneratedColumn<String> companylogo = GeneratedColumn<String>(
      'companylogo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<String> userID = GeneratedColumn<String>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _locationIDMeta = const VerificationMeta('locationID');
  @override
  late final GeneratedColumn<int> locationID = GeneratedColumn<int>(
      'location_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _CompanyIDMeta = const VerificationMeta('CompanyID');
  @override
  late final GeneratedColumn<int> CompanyID = GeneratedColumn<int>(
      'company_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _DepartmentMeta = const VerificationMeta('Department');
  @override
  late final GeneratedColumn<String> Department = GeneratedColumn<String>(
      'department', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        AppTypes,
        ProductID,
        Language,
        RoleShortName,
        mobileno,
        emailid,
        name,
        islogsheet,
        isadmin,
        ishelpdesk,
        ischecklist,
        locationame,
        companylogo,
        companyName,
        userID,
        password,
        locationID,
        CompanyID,
        Department
      ];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('app_types')) {
      context.handle(_AppTypesMeta,
          AppTypes.isAcceptableOrUnknown(data['app_types']!, _AppTypesMeta));
    } else if (isInserting) {
      context.missing(_AppTypesMeta);
    }
    if (data.containsKey('product_i_d')) {
      context.handle(
          _ProductIDMeta,
          ProductID.isAcceptableOrUnknown(
              data['product_i_d']!, _ProductIDMeta));
    } else if (isInserting) {
      context.missing(_ProductIDMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_LanguageMeta,
          Language.isAcceptableOrUnknown(data['language']!, _LanguageMeta));
    } else if (isInserting) {
      context.missing(_LanguageMeta);
    }
    if (data.containsKey('role_short_name')) {
      context.handle(
          _RoleShortNameMeta,
          RoleShortName.isAcceptableOrUnknown(
              data['role_short_name']!, _RoleShortNameMeta));
    } else if (isInserting) {
      context.missing(_RoleShortNameMeta);
    }
    if (data.containsKey('mobileno')) {
      context.handle(_mobilenoMeta,
          mobileno.isAcceptableOrUnknown(data['mobileno']!, _mobilenoMeta));
    } else if (isInserting) {
      context.missing(_mobilenoMeta);
    }
    if (data.containsKey('emailid')) {
      context.handle(_emailidMeta,
          emailid.isAcceptableOrUnknown(data['emailid']!, _emailidMeta));
    } else if (isInserting) {
      context.missing(_emailidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('islogsheet')) {
      context.handle(
          _islogsheetMeta,
          islogsheet.isAcceptableOrUnknown(
              data['islogsheet']!, _islogsheetMeta));
    } else if (isInserting) {
      context.missing(_islogsheetMeta);
    }
    if (data.containsKey('isadmin')) {
      context.handle(_isadminMeta,
          isadmin.isAcceptableOrUnknown(data['isadmin']!, _isadminMeta));
    } else if (isInserting) {
      context.missing(_isadminMeta);
    }
    if (data.containsKey('ishelpdesk')) {
      context.handle(
          _ishelpdeskMeta,
          ishelpdesk.isAcceptableOrUnknown(
              data['ishelpdesk']!, _ishelpdeskMeta));
    } else if (isInserting) {
      context.missing(_ishelpdeskMeta);
    }
    if (data.containsKey('ischecklist')) {
      context.handle(
          _ischecklistMeta,
          ischecklist.isAcceptableOrUnknown(
              data['ischecklist']!, _ischecklistMeta));
    } else if (isInserting) {
      context.missing(_ischecklistMeta);
    }
    if (data.containsKey('locationame')) {
      context.handle(
          _locationameMeta,
          locationame.isAcceptableOrUnknown(
              data['locationame']!, _locationameMeta));
    } else if (isInserting) {
      context.missing(_locationameMeta);
    }
    if (data.containsKey('companylogo')) {
      context.handle(
          _companylogoMeta,
          companylogo.isAcceptableOrUnknown(
              data['companylogo']!, _companylogoMeta));
    } else if (isInserting) {
      context.missing(_companylogoMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('location_i_d')) {
      context.handle(
          _locationIDMeta,
          locationID.isAcceptableOrUnknown(
              data['location_i_d']!, _locationIDMeta));
    } else if (isInserting) {
      context.missing(_locationIDMeta);
    }
    if (data.containsKey('company_i_d')) {
      context.handle(
          _CompanyIDMeta,
          CompanyID.isAcceptableOrUnknown(
              data['company_i_d']!, _CompanyIDMeta));
    } else if (isInserting) {
      context.missing(_CompanyIDMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
          _DepartmentMeta,
          Department.isAcceptableOrUnknown(
              data['department']!, _DepartmentMeta));
    } else if (isInserting) {
      context.missing(_DepartmentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      AppTypes: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}app_types'])!,
      ProductID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}product_i_d'])!,
      Language: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      RoleShortName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}role_short_name'])!,
      mobileno: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}mobileno'])!,
      emailid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}emailid'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      islogsheet: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}islogsheet'])!,
      isadmin: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}isadmin'])!,
      ishelpdesk: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}ishelpdesk'])!,
      ischecklist: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}ischecklist'])!,
      locationame: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}locationame'])!,
      companylogo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}companylogo'])!,
      companyName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      userID: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}user_i_d'])!,
      password: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      locationID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}location_i_d'])!,
      CompanyID: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}company_i_d'])!,
      Department: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}department'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

abstract class _$GCAppDb extends GeneratedDatabase {
  _$GCAppDb(QueryExecutor e) : super(e);
  late final $BarcodeTable barcode = $BarcodeTable(this);
  late final $ChecklistTransactionTable checklistTransaction =
      $ChecklistTransactionTable(this);
  late final $LogsheetTransactionTable logsheetTransaction =
      $LogsheetTransactionTable(this);
  late final $ParameterTable parameter = $ParameterTable(this);
  late final $QuestionTable question = $QuestionTable(this);
  late final $ScoreTable score = $ScoreTable(this);
  late final $SubParameterTable subParameter = $SubParameterTable(this);
  late final $TemplateTable template = $TemplateTable(this);
  late final $TemplateDetailTable templateDetail = $TemplateDetailTable(this);
  late final $UserTable user = $UserTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        barcode,
        checklistTransaction,
        logsheetTransaction,
        parameter,
        question,
        score,
        subParameter,
        template,
        templateDetail,
        user
      ];
}
