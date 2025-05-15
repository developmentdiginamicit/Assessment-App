class TraitInfoModel {
  bool? status;
  List<Data>? data;
  String? message;

  TraitInfoModel({this.status, this.data, this.message});

  TraitInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  TraitInfo? traitInfo;
  String? sId;
  int? iV;

  Data({this.traitInfo, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    traitInfo = json['trait_info'] != null
        ? TraitInfo.fromJson(json['trait_info'])
        : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (traitInfo != null) {
      data['trait_info'] = traitInfo!.toJson();
    }
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}

class TraitInfo {
  List<BrightTrait>? brightTrait;
  List<DarkTrait>? darkTrait;

  TraitInfo({this.brightTrait, this.darkTrait});

  TraitInfo.fromJson(Map<String, dynamic> json) {
    if (json['Bright_Trait'] != null) {
      brightTrait = <BrightTrait>[];
      json['Bright_Trait'].forEach((v) {
        brightTrait!.add(BrightTrait.fromJson(v));
      });
    }
    if (json['Dark_Trait'] != null) {
      darkTrait = <DarkTrait>[];
      json['Dark_Trait'].forEach((v) {
        darkTrait!.add(DarkTrait.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (brightTrait != null) {
      data['Bright_Trait'] = brightTrait!.map((v) => v.toJson()).toList();
    }
    if (darkTrait != null) {
      data['Dark_Trait'] = darkTrait!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrightTrait {
  String? title;
  String? meaning;
  String? example;
  List<String>? factorsAffectingTrait;

  BrightTrait(
      {this.title, this.meaning, this.example, this.factorsAffectingTrait});

  BrightTrait.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    meaning = json['meaning'];
    example = json['example'];
    factorsAffectingTrait = json['factors_affecting_trait'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['meaning'] = meaning;
    data['example'] = example;
    data['factors_affecting_trait'] = factorsAffectingTrait;
    return data;
  }
}


class DarkTrait {
  String? title;
  String? meaning;
  String? example;
  List<String>? factorsAffectingTrait;

  DarkTrait(
      {this.title, this.meaning, this.example, this.factorsAffectingTrait});

  DarkTrait.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    meaning = json['meaning'];
    example = json['example'];
    factorsAffectingTrait = json['factors_affecting_trait'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['meaning'] = meaning;
    data['example'] = example;
    data['factors_affecting_trait'] = factorsAffectingTrait;
    return data;
  }
}
