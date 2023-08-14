class RecommendItem {
  final String? title;
  final String? Content;
  final String? imageUrl;
  const RecommendItem(this.title, this.Content, this.imageUrl);
}

const List<RecommendItem> recommendData = [
  RecommendItem("排行榜", "海量精品小说立即去看看", "http://book.aiheadn.cn/assets/news-deacc675.png"),
  RecommendItem("精选", "全网同步追书快人一步", "http://book.aiheadn.cn/assets/news-deacc675.png"),
];
