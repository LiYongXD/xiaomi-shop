class CategoryModel {
  List<CategoryItemModel>? result;

  CategoryModel({
    this.result,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategoryItemModel>[];
      json['result'].forEach((v) {
        result?.add(CategoryItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryItemModel {
  String? sId;
  String? title;
  num? status;
  String? pic;
  String? pid;
  dynamic? sort;
  num? isBest;
  num? goProduct;
  String? productId;

  CategoryItemModel({
    this.sId,
    this.title,
    this.status,
    this.pic,
    this.pid,
    this.sort,
    this.isBest,
    this.goProduct,
    this.productId,
  });

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'] as num?;
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'] as num?;
    isBest = json['is_best'] as num?;
    goProduct = json['go_product'] as num?;
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    data['sort'] = sort;
    data['is_best'] = isBest;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}
