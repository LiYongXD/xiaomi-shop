class PContentModel {
  PContentItemModel? result;

  PContentModel({
    this.result,
  });

  PContentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? PContentItemModel?.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class PContentItemModel {
  String? sId;
  String? title;
  String? cid;
  num? price;
  num? oldPrice;
  num? isBest;
  num? isHot;
  num? isNew;
  num? status;
  String? pic;
  String? content;
  String? cname;
  List<PContentAttrModel>? attr;
  String? subTitle;
  num? salecount;
  String? specs;
  num? count;

  PContentItemModel({
    this.sId,
    this.title,
    this.cid,
    this.price,
    this.oldPrice,
    this.isBest,
    this.isHot,
    this.isNew,
    this.status,
    this.pic,
    this.content,
    this.cname,
    this.attr,
    this.subTitle,
    this.salecount,
    this.specs,
    this.count,
  });

  PContentItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'] as num?;
    oldPrice = json['old_price'] as num?;
    isBest = json['is_best'] as num?;
    isHot = json['is_hot'] as num?;
    isNew = json['is_new'] as num?;
    status = json['status'] as num?;
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = <PContentAttrModel>[];
      json['attr'].forEach((v) {
        attr?.add(PContentAttrModel.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'] as num?;
    specs = json['specs'];
    count = json['count'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['cname'] = cname;
    if (attr != null) {
      data['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    data['sub_title'] = subTitle;
    data['salecount'] = salecount;
    data['specs'] = specs;
    data['count'] = count;
    return data;
  }
}

class PContentAttrModel {
  String? cate;
  List<String>? list;
  List<Map>? attrList;

  PContentAttrModel({
    this.cate,
    this.list,
    this.attrList,
  });

  PContentAttrModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list']?.cast<String>();
    attrList = [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    
    return data;
  }
}
