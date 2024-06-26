/* class ProductModel{
  final String image;
  final String name;
  final double price;
  int count;

  ProductModel({required this.image, required this.name, required this.price, this.count=1});
} */

class HomeModel {
  String? name;
  String? description;
  List<ProductsModel>? products;
  int? numberOfProducts;
  String? imageURL;
  bool? isActive;
  int? id;
  String? created;
  String? createdBy;
  String? updated;
  String? updatedBy;

  HomeModel(
      {this.name,
      this.description,
      this.products,
      this.numberOfProducts,
      this.imageURL,
      this.isActive,
      this.id,
      this.created,
      this.createdBy,
      this.updated,
      this.updatedBy});

  HomeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(new ProductsModel.fromJson(v));
      });
    }
    numberOfProducts = json['numberOfProducts'];
    imageURL = json['imageURL'];
    isActive = json['isActive'];
    id = json['id'];
    created = json['created'];
    createdBy = json['createdBy'];
    updated = json['updated'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['numberOfProducts'] = this.numberOfProducts;
    data['imageURL'] = this.imageURL;
    data['isActive'] = this.isActive;
    data['id'] = this.id;
    data['created'] = this.created;
    data['createdBy'] = this.createdBy;
    data['updated'] = this.updated;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class ProductsModel {
  String? name;
  String? description;
  int? categoryId;
  bool? isActive;
  String? imageURL;
  int amount = 0;
  double? price;
  Null? canteenTransactionProducts;
  int? id;
  String? created;
  String? createdBy;
  String? updated;
  String? updatedBy;

  ProductsModel(
      {this.name,
      this.description,
      this.categoryId,
      this.isActive,
      this.imageURL,
      this.price,
      this.canteenTransactionProducts,
      this.id,
      this.created,
      this.createdBy,
      this.updated,
      this.updatedBy});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    categoryId = json['categoryId'];
    isActive = json['isActive'];
    imageURL = json['imageURL'];
    amount = 0;
    price = json['price'];
    canteenTransactionProducts = json['canteenTransactionProducts'];
    id = json['id'];
    created = json['created'];
    createdBy = json['createdBy'];
    updated = json['updated'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['isActive'] = this.isActive;
    data['imageURL'] = this.imageURL;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['canteenTransactionProducts'] = this.canteenTransactionProducts;
    data['id'] = this.id;
    data['created'] = this.created;
    data['createdBy'] = this.createdBy;
    data['updated'] = this.updated;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}
