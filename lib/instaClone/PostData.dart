class PostData {
  String? _name;
  String? _location;
  String? _image;
  String? _post;
  String? _postTitle;
  List<String>? _likedBy;

  PostData(
      {String? name,
        String? location,
        String? image,
        String? post,
        String? postTitle,
        List<String>? likedBy}) {
    if (name != null) {
      this._name = name;
    }
    if (location != null) {
      this._location = location;
    }
    if (image != null) {
      this._image = image;
    }
    if (post != null) {
      this._post = post;
    }
    if (postTitle != null) {
      this._postTitle = postTitle;
    }
    if (likedBy != null) {
      this._likedBy = likedBy;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get post => _post;
  set post(String? post) => _post = post;
  String? get postTitle => _postTitle;
  set postTitle(String? postTitle) => _postTitle = postTitle;
  List<String>? get likedBy => _likedBy;
  set likedBy(List<String>? likedBy) => _likedBy = likedBy;

  PostData.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _location = json['location'];
    _image = json['image'];
    _post = json['post'];
    _postTitle = json['postTitle'];
    _likedBy = json['likedBy'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['location'] = this._location;
    data['image'] = this._image;
    data['post'] = this._post;
    data['postTitle'] = this._postTitle;
    data['likedBy'] = this._likedBy;
    return data;
  }
}
