class WorkCategoryItem{
  final String image;
  final String title;
  WorkCategoryItem({
    this.image,
    this.title
});}
List<WorkCategoryItem> allWork =[
  WorkCategoryItem(
      image: 'assets/images/ic_news.png',
    title: 'Tin tức'
  ),
  WorkCategoryItem(
      image: 'assets/images/ic_events.png',
      title: 'Sự kiện'
  ),
  WorkCategoryItem(
      image: 'assets/images/ic_media.png',
      title: 'VDONE Media'
  ),
  WorkCategoryItem(
      image: 'assets/images/ic_contract.png',
      title: 'Lập KHKD'
  ),
  WorkCategoryItem(
      image: 'assets/images/ic_course.png',
      title: 'Khoá học'
  ),
];
