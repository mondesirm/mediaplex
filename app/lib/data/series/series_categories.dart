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
    categoryLogo: 'https://loremflickr.com/g/640/640/series,action'),
  SeriesCategories(
    categoryName: 'Adventure',
    categoryUrl: 'adventureSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,adventure'),
  SeriesCategories(
    categoryName: 'Animated',
    categoryUrl: 'animatedSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,animated'),
  SeriesCategories(
    categoryName: 'Comedies',
    categoryUrl: 'comediesSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,comedies'),
  SeriesCategories(
    categoryName: 'Dramas',
    categoryUrl: 'dramasSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,dramas'),
  SeriesCategories(
    categoryName: 'Horror',
    categoryUrl: 'horrorSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,horror'),
  SeriesCategories(
    categoryName: 'Musical',
    categoryUrl: 'musicalSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,musical'),
  SeriesCategories(
    categoryName: 'Other',
    categoryUrl: 'otherSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,other'),
  SeriesCategories(
    categoryName: 'RealLife',
    categoryUrl: 'reallifeSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,reallife'),
  SeriesCategories(
    categoryName: 'Romantic',
    categoryUrl: 'romanticSeries',
    categoryLogo: 'https://loremflickr.com/g/640/640/series,romantic')
];