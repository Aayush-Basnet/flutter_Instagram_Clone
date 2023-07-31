class Comment {
  String authorName;
  String authorImageUrl;
  String text;

  Comment({
    required this.authorName,
    required this.authorImageUrl,
    required this.text,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: 'Uthsav',
    authorImageUrl: 'assets/images/user2.png',
    text: 'Loving this photo!!',
  ),
  Comment(
    authorName: 'Aayush',
    authorImageUrl: 'assets/images/user3.png',
    text: 'One of the best photos of you...',
  ),
  Comment(
    authorName: 'Akash',
    authorImageUrl: 'assets/images/user4.png',
    text: 'Can\'t wait for you to post more!',
  ),
  Comment(
    authorName: 'Sumit',
    authorImageUrl: 'assets/images/user1.png',
    text: 'Nice job',
  ),
  Comment(
    authorName: 'Aayush Basnet',
    authorImageUrl: 'assets/images/user0.png',
    text: 'Thanks everyone :)',
  ),
];
