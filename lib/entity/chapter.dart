class ChapterItem {
  int? chapterId;
  String? title;
  int? fictionId;
  String? updataTime;
  String? content;

  ChapterItem(
      {this.chapterId,
      this.title,
      this.fictionId,
      this.updataTime,
      this.content});

  ChapterItem.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapterId'];
    title = json['title'];
    fictionId = json['fictionId'];
    updataTime = json['updataTime'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapterId'] = this.chapterId;
    data['title'] = this.title;
    data['fictionId'] = this.fictionId;
    data['updataTime'] = this.updataTime;
    data['content'] = this.content;
    return data;
  }
}