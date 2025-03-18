class Product{
  late String _item;
  late String _name;
  late String _image;

  Product(this._item, this._name, this._image);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get item => _item;

  set item(String value) {
    _item = value;
  }

  Map<String, dynamic> toJson() {
    return {
      "item": item,
      "name": name,
      "image": image,
    };
  }

  @override
  String toString() {
    return 'Product{_item: $_item, _name: $_name, _image: $_image}';
  }
}