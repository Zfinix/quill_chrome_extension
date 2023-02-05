import 'dart:convert';
import 'package:equatable/equatable.dart';

class QuillBotModel with EquatableMixin {
  final String message;
  final String traceID;
  final String code;
  final List<QuillModelData> data;
  final int status;

  const QuillBotModel({
    required this.message,
    required this.traceID,
    required this.code,
    required this.data,
    required this.status,
  });

  QuillBotModel copyWith({
    String? message,
    String? traceID,
    String? code,
    List<QuillModelData>? data,
    int? status,
  }) {
    return QuillBotModel(
      message: message ?? this.message,
      traceID: traceID ?? this.traceID,
      code: code ?? this.code,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'traceID': traceID,
      'code': code,
      'data': data.map((x) => x.toMap()).toList(),
      'status': status,
    };
  }

  factory QuillBotModel.fromMap(Map<String, dynamic> map) {
    return QuillBotModel(
      message: map['message'] ?? '',
      traceID: map['traceID'] ?? '',
      code: map['code'] ?? '',
      data: List<QuillModelData>.from(
        (map['data'] ?? []).map(
          (x) => QuillModelData.fromMap(x),
        ),
      ),
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuillBotModel.fromJson(String source) =>
      QuillBotModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuillBotModel(message: $message, traceID: $traceID, code: $code, data: $data, status: $status)';
  }

  @override
  List<Object> get props {
    return [
      message,
      traceID,
      code,
      data,
      status,
    ];
  }
}

class QuillModelData with EquatableMixin {
  final String sent;
  final String id;
  final String modelId;
  final List<Paras3> paras3;
  final String respId;
  final RunTimes runTimes;

  const QuillModelData({
    required this.sent,
    required this.id,
    required this.modelId,
    required this.paras3,
    required this.respId,
    required this.runTimes,
  });

  QuillModelData copyWith({
    String? sent,
    String? id,
    String? modelId,
    List<Paras3>? paras3,
    String? respId,
    RunTimes? runTimes,
  }) {
    return QuillModelData(
      sent: sent ?? this.sent,
      id: id ?? this.id,
      modelId: modelId ?? this.modelId,
      paras3: paras3 ?? this.paras3,
      respId: respId ?? this.respId,
      runTimes: runTimes ?? this.runTimes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sent': sent,
      'id': id,
      'MODEL_ID': modelId,
      'paras_3': paras3.map((x) => x.toMap()).toList(),
      'resp_id': respId,
      'run_times': runTimes.toMap(),
    };
  }

  factory QuillModelData.fromMap(Map<String, dynamic> map) {
    return QuillModelData(
      sent: map['sent'] ?? '',
      id: map['id'] ?? '',
      modelId: map['MODEL_ID'] ?? '',
      paras3: List<Paras3>.from(map['paras_3']?.map((x) => Paras3.fromMap(x))),
      respId: map['resp_id'] ?? '',
      runTimes: RunTimes.fromMap(map['run_times']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuillModelData.fromJson(String source) =>
      QuillModelData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuillModelData(sent: $sent, id: $id, MODEL_ID: $modelId, paras_3: $paras3, resp_id: $respId, run_times: $runTimes)';
  }

  @override
  List<Object> get props {
    return [
      sent,
      id,
      modelId,
      paras3,
      respId,
      runTimes,
    ];
  }
}

class Paras3 with EquatableMixin {
  final String alt;
  const Paras3({
    required this.alt,
  });

  Paras3 copyWith({
    String? alt,
  }) {
    return Paras3(
      alt: alt ?? this.alt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alt': alt,
    };
  }

  factory Paras3.fromMap(Map<String, dynamic> map) {
    return Paras3(
      alt: map['alt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Paras3.fromJson(String source) => Paras3.fromMap(json.decode(source));

  @override
  String toString() => 'Paras3(alt: $alt)';

  @override
  List<Object> get props => [alt];
}

class RunTimes with EquatableMixin {
  final int paraStart;
  final int paraEnd;

  const RunTimes({
    required this.paraStart,
    required this.paraEnd,
  });

  RunTimes copyWith({
    int? paraStart,
    int? paraEnd,
  }) {
    return RunTimes(
      paraStart: paraStart ?? this.paraStart,
      paraEnd: paraEnd ?? this.paraEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'para_start': paraStart,
      'para_end': paraEnd,
    };
  }

  factory RunTimes.fromMap(Map<String, dynamic> map) {
    return RunTimes(
      paraStart: map['para_start']?.toInt() ?? 0,
      paraEnd: map['para_end']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RunTimes.fromJson(String source) =>
      RunTimes.fromMap(json.decode(source));

  @override
  String toString() => 'Run_times(para_start: $paraStart, para_end: $paraEnd)';

  @override
  List<Object> get props => [paraStart, paraEnd];
}
