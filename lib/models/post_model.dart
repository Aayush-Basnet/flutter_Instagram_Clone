class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String isLiked;
  String isCommented;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
    required this.isLiked,
    required this.isCommented,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Aayush Basnet',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post0.png',
    isLiked: '5038',
    isCommented: '1253',
  ),
  Post(
    authorName: 'Aayush Basnet',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '20 min',
    imageUrl: 'assets/images/user4.png',
    isLiked: '6138',
    isCommented: '3416',
  ),
  Post(
    authorName: 'Aayush Basnet',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '45 min',
    imageUrl: 'assets/images/user2.png',
    isLiked: '4538',
    isCommented: '1982',
  ),
  Post(
    authorName: 'Aayush Basnet',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/images/user1.png',
    isLiked: '5438',
    isCommented: '3109',
  ),
];
final List<String> stories = [
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
  'assets/images/user0.png',
  'assets/images/user1.png',
];
