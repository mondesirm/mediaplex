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
    categoryLogo: 'images/categories/action.png'),
  MoviesCategories(
    categoryName: 'Adventure',
    categoryUrl: 'adventureMovies',
    categoryLogo: 'images/categories/action.png'),
  MoviesCategories(
    categoryName: 'Animated',
    categoryUrl: 'animatedMovies',
    categoryLogo: 'images/categories/animation.png'),
  MoviesCategories(
    categoryName: 'Comedies',
    categoryUrl: 'comediesMovies',
    categoryLogo: 'images/categories/comedy.png'),
  MoviesCategories(
    categoryName: 'Dramas',
    categoryUrl: 'dramasMovies',
    categoryLogo: 'images/categories/drama.png'),
  MoviesCategories(
    categoryName: 'Horror',
    categoryUrl: 'horrorMovies',
    categoryLogo: 'images/categories/horror.png'),
  MoviesCategories(
    categoryName: 'Musical',
    categoryUrl: 'musicalMovies',
    categoryLogo: 'images/categories/musical.png'),
  MoviesCategories(
    categoryName: 'Other',
    categoryUrl: 'otherMovies',
    categoryLogo: 'images/categories/musical.png'),
  MoviesCategories(
    categoryName: 'RealLife',
    categoryUrl: 'reallifeMovies',
    categoryLogo: 'images/categories/musical.png'),
  MoviesCategories(
    categoryName: 'Romantic',
    categoryUrl: 'romanticMovies',
    categoryLogo: 'images/categories/romance.png')
];