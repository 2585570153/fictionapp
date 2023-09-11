class FictionItem {
  int? _fictionId;
  String? _name;
  String? _author;
  String? _prcture;
  String? _brief;
  String? _bigclass;
  String? _classify;
  int? _collect;
  int? _click;
  String? _creatTime;

  FictionItem(
      {int? fictionId,
      String? name,
      String? author,
      String? prcture,
      String? brief,
      String? bigclass,
      String? classify,
      int? collect,
      int? click,
      String? creatTime}) {
    if (fictionId != null) {
      this._fictionId = fictionId;
    }
    if (name != null) {
      this._name = name;
    }
    if (author != null) {
      this._author = author;
    }
    if (prcture != null) {
      this._prcture = prcture;
    }
    if (brief != null) {
      this._brief = brief;
    }
    if (bigclass != null) {
      this._bigclass = bigclass;
    }
    if (classify != null) {
      this._classify = classify;
    }
    if (collect != null) {
      this._collect = collect;
    }
    if (click != null) {
      this._click = click;
    }
    if (creatTime != null) {
      this._creatTime = creatTime;
    }
  }
  
  bool isEmpty() {
  return (_name == null || _name!.isEmpty) &&
         (_author == null || _author!.isEmpty);
}

  int? get fictionId => _fictionId;
  set fictionId(int? fictionId) => _fictionId = fictionId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get author => _author;
  set author(String? author) => _author = author;
  String? get prcture => _prcture;
  set prcture(String? prcture) => _prcture = prcture;
  String? get brief => _brief;
  set brief(String? brief) => _brief = brief;
  String? get bigclass => _bigclass;
  set bigclass(String? bigclass) => _bigclass = bigclass;
  String? get classify => _classify;
  set classify(String? classify) => _classify = classify;
  int? get collect => _collect;
  set collect(int? collect) => _collect = collect;
  int? get click => _click;
  set click(int? click) => _click = click;
  String? get creatTime => _creatTime;
  set creatTime(String? creatTime) => _creatTime = creatTime;

  FictionItem.fromJson(Map<String, dynamic> json) {
    _fictionId = json['fictionId'];
    _name = json['name'];
    _author = json['author'];
    _prcture = json['prcture'];
    _brief = json['brief'];
    _bigclass = json['bigclass'];
    _classify = json['classify'];
    _collect = json['collect'];
    _click = json['click'];
    _creatTime = json['creatTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fictionId'] = this._fictionId;
    data['name'] = this._name;
    data['author'] = this._author;
    data['prcture'] = this._prcture;
    data['brief'] = this._brief;
    data['bigclass'] = this._bigclass;
    data['classify'] = this._classify;
    data['collect'] = this._collect;
    data['click'] = this._click;
    data['creatTime'] = this._creatTime;
    return data;
  }

}
