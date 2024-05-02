class Verse {
  int? _id;
  int? _verseNumber;
  int? _chapterNumber;
  String? _slug;
  String? _text;
  String? _transliteration;
  String? _wordMeanings;
  List<Translations>? _translations;
  List<Commentaries>? _commentaries;

  Verse(
      {int? id,
        int? verseNumber,
        int? chapterNumber,
        String? slug,
        String? text,
        String? transliteration,
        String? wordMeanings,
        List<Translations>? translations,
        List<Commentaries>? commentaries}) {
    if (id != null) {
      this._id = id;
    }
    if (verseNumber != null) {
      this._verseNumber = verseNumber;
    }
    if (chapterNumber != null) {
      this._chapterNumber = chapterNumber;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (text != null) {
      this._text = text;
    }
    if (transliteration != null) {
      this._transliteration = transliteration;
    }
    if (wordMeanings != null) {
      this._wordMeanings = wordMeanings;
    }
    if (translations != null) {
      this._translations = translations;
    }
    if (commentaries != null) {
      this._commentaries = commentaries;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get verseNumber => _verseNumber;
  set verseNumber(int? verseNumber) => _verseNumber = verseNumber;
  int? get chapterNumber => _chapterNumber;
  set chapterNumber(int? chapterNumber) => _chapterNumber = chapterNumber;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get text => _text;
  set text(String? text) => _text = text;
  String? get transliteration => _transliteration;
  set transliteration(String? transliteration) =>
      _transliteration = transliteration;
  String? get wordMeanings => _wordMeanings;
  set wordMeanings(String? wordMeanings) => _wordMeanings = wordMeanings;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;
  List<Commentaries>? get commentaries => _commentaries;
  set commentaries(List<Commentaries>? commentaries) =>
      _commentaries = commentaries;

  Verse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _verseNumber = json['verse_number'];
    _chapterNumber = json['chapter_number'];
    _slug = json['slug'];
    _text = json['text'];
    _transliteration = json['transliteration'];
    _wordMeanings = json['word_meanings'];
    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(new Translations.fromJson(v));
      });
    }
    if (json['commentaries'] != null) {
      _commentaries = <Commentaries>[];
      json['commentaries'].forEach((v) {
        _commentaries!.add(new Commentaries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['verse_number'] = this._verseNumber;
    data['chapter_number'] = this._chapterNumber;
    data['slug'] = this._slug;
    data['text'] = this._text;
    data['transliteration'] = this._transliteration;
    data['word_meanings'] = this._wordMeanings;
    if (this._translations != null) {
      data['translations'] =
          this._translations!.map((v) => v.toJson()).toList();
    }
    if (this._commentaries != null) {
      data['commentaries'] =
          this._commentaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? _id;
  String? _description;
  String? _authorName;
  String? _language;

  Translations(
      {int? id, String? description, String? authorName, String? language}) {
    if (id != null) {
      this._id = id;
    }
    if (description != null) {
      this._description = description;
    }
    if (authorName != null) {
      this._authorName = authorName;
    }
    if (language != null) {
      this._language = language;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get authorName => _authorName;
  set authorName(String? authorName) => _authorName = authorName;
  String? get language => _language;
  set language(String? language) => _language = language;

  Translations.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _description = json['description'];
    _authorName = json['author_name'];
    _language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['description'] = this._description;
    data['author_name'] = this._authorName;
    data['language'] = this._language;
    return data;
  }
}
class Commentaries {
  int? _id;
  String? _description;
  String? _authorName;
  String? _language;

  Commentaries(
      {int? id, String? description, String? authorName, String? language}) {
    if (id != null) {
      this._id = id;
    }
    if (description != null) {
      this._description = description;
    }
    if (authorName != null) {
      this._authorName = authorName;
    }
    if (language != null) {
      this._language = language;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get authorName => _authorName;
  set authorName(String? authorName) => _authorName = authorName;
  String? get language => _language;
  set language(String? language) => _language = language;

  Commentaries.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _description = json['description'];
    _authorName = json['author_name'];
    _language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['description'] = this._description;
    data['author_name'] = this._authorName;
    data['language'] = this._language;
    return data;
  }
}
