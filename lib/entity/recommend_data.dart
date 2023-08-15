class RecommendItem {
  final String? title;
  final String? Content;
  final String? imageUrl;
  const RecommendItem(this.title, this.Content, this.imageUrl);
}

const List<RecommendItem> recommendData = [
  RecommendItem("排行榜", "海量精品小说立即去看看", "assets/images/trophy.png"),
  RecommendItem("精选", "全网同步追书快人一步", "assets/images/recommend.png"),
];
