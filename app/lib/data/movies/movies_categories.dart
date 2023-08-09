class MoviesCategories {
  final String categoryUrl;
  final String categoryLogo;
  final String categoryName;
  const MoviesCategories({ required this.categoryUrl, required this.categoryLogo, required this.categoryName });
}

const List<MoviesCategories> moviesCategories = [
  MoviesCategories(
    categoryName: 'Action',
    categoryUrl: 'actionMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,action/all'),
  MoviesCategories(
    categoryName: 'Adventure',
    categoryUrl: 'adventureMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,adventure/all'),
  MoviesCategories(
    categoryName: 'Animated',
    categoryUrl: 'animatedMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,animated/all'),
  MoviesCategories(
    categoryName: 'Comedies',
    categoryUrl: 'comediesMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,comedies/all'),
  MoviesCategories(
    categoryName: 'Dramas',
    categoryUrl: 'dramasMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,dramas/all'),
  MoviesCategories(
    categoryName: 'Horror',
    categoryUrl: 'horrorMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,horror/all'),
  MoviesCategories(
    categoryName: 'Musical',
    categoryUrl: 'musicalMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,musical/all'),
  MoviesCategories(
    categoryName: 'Other',
    categoryUrl: 'otherMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,other/all'),
  MoviesCategories(
    categoryName: 'RealLife',
    categoryUrl: 'reallifeMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,reallife/all'),
  MoviesCategories(
    categoryName: 'Romantic',
    categoryUrl: 'romanticMovies',
    categoryLogo: 'https://loremflickr.com/g/640/640/movies,romantic/all')
];