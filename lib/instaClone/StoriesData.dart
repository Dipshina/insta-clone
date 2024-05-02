class StoriesData {
  String? _name;
  String? _image;
  bool? _isMyStory;

  StoriesData({String? name, String? image, bool? isMyStory}) {
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (isMyStory != null) {
      this._isMyStory = isMyStory;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  bool? get isMyStory => _isMyStory;
  set isMyStory(bool? isMyStory) => _isMyStory = isMyStory;

  StoriesData.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _image = json['image'];
    _isMyStory = json['isMyStory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['image'] = this._image;
    data['isMyStory'] = this._isMyStory;
    return data;
  }
}
