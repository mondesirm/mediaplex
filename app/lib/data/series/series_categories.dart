class SeriesCategories {
  final String categoryUrl;
  final String categoryLogo;
  final String categoryName;
  const SeriesCategories({ required this.categoryUrl, required this.categoryLogo, required this.categoryName });
}

const List<SeriesCategories> seriesCategories = [
  SeriesCategories(
    categoryName: 'Action',
    categoryUrl: 'actionSeries',
    categoryLogo: 'images/categories/action.png'),
  SeriesCategories(
    categoryName: 'Adventure',
    categoryUrl: 'adventureSeries',
    categoryLogo: 'images/categories/action.png'),
  SeriesCategories(
    categoryName: 'Animated',
    categoryUrl: 'animatedSeries',
    categoryLogo: 'images/categories/animation.png'),
  SeriesCategories(
    categoryName: 'Comedies',
    categoryUrl: 'comediesSeries',
    categoryLogo: 'images/categories/comedy.png'),
  SeriesCategories(
    categoryName: 'Dramas',
    categoryUrl: 'dramasSeries',
    categoryLogo: 'images/categories/drama.png'),
  SeriesCategories(
    categoryName: 'Horror',
    categoryUrl: 'horrorSeries',
    categoryLogo: 'images/categories/horror.png'),
  SeriesCategories(
    categoryName: 'Musical',
    categoryUrl: 'musicalSeries',
    categoryLogo: 'images/categories/musical.png'),
  SeriesCategories(
    categoryName: 'Other',
    categoryUrl: 'otherSeries',
    categoryLogo: 'images/categories/musical.png'),
  SeriesCategories(
    categoryName: 'RealLife',
    categoryUrl: 'reallifeSeries',
    categoryLogo: 'images/categories/musical.png'),
  SeriesCategories(
    categoryName: 'Romantic',
    categoryUrl: 'romanticSeries',
    categoryLogo: 'images/categories/romance.png')
];