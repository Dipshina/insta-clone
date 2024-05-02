class Chapters {
  int? _id;
  String? _name;
  String? _slug;
  String? _nameTransliterated;
  String? _nameTranslated;
  int? _versesCount;
  int? _chapterNumber;
  String? _nameMeaning;
  String? _chapterSummary;
  String? _chapterSummaryHindi;

  Chapters(
      {int? id,
      String? name,
      String? slug,
      String? nameTransliterated,
      String? nameTranslated,
      int? versesCount,
      int? chapterNumber,
      String? nameMeaning,
      String? chapterSummary,
      String? chapterSummaryHindi}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (nameTransliterated != null) {
      this._nameTransliterated = nameTransliterated;
    }
    if (nameTranslated != null) {
      this._nameTranslated = nameTranslated;
    }
    if (versesCount != null) {
      this._versesCount = versesCount;
    }
    if (chapterNumber != null) {
      this._chapterNumber = chapterNumber;
    }
    if (nameMeaning != null) {
      this._nameMeaning = nameMeaning;
    }
    if (chapterSummary != null) {
      this._chapterSummary = chapterSummary;
    }
    if (chapterSummaryHindi != null) {
      this._chapterSummaryHindi = chapterSummaryHindi;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get nameTransliterated => _nameTransliterated;
  set nameTransliterated(String? nameTransliterated) =>
      _nameTransliterated = nameTransliterated;
  String? get nameTranslated => _nameTranslated;
  set nameTranslated(String? nameTranslated) =>
      _nameTranslated = nameTranslated;
  int? get versesCount => _versesCount;
  set versesCount(int? versesCount) => _versesCount = versesCount;
  int? get chapterNumber => _chapterNumber;
  set chapterNumber(int? chapterNumber) => _chapterNumber = chapterNumber;
  String? get nameMeaning => _nameMeaning;
  set nameMeaning(String? nameMeaning) => _nameMeaning = nameMeaning;
  String? get chapterSummary => _chapterSummary;
  set chapterSummary(String? chapterSummary) =>
      _chapterSummary = chapterSummary;
  String? get chapterSummaryHindi => _chapterSummaryHindi;
  set chapterSummaryHindi(String? chapterSummaryHindi) =>
      _chapterSummaryHindi = chapterSummaryHindi;

  Chapters.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _nameTransliterated = json['name_transliterated'];
    _nameTranslated = json['name_translated'];
    _versesCount = json['verses_count'];
    _chapterNumber = json['chapter_number'];
    _nameMeaning = json['name_meaning'];
    _chapterSummary = json['chapter_summary'];
    _chapterSummaryHindi = json['chapter_summary_hindi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['name_transliterated'] = this._nameTransliterated;
    data['name_translated'] = this._nameTranslated;
    data['verses_count'] = this._versesCount;
    data['chapter_number'] = this._chapterNumber;
    data['name_meaning'] = this._nameMeaning;
    data['chapter_summary'] = this._chapterSummary;
    data['chapter_summary_hindi'] = this._chapterSummaryHindi;
    return data;
  }
}