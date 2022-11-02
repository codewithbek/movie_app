class Movie {
  final String name;
  final String imagePath;

  final String videoPath;

  final String category;
  final int year;
  final Duration duration;
  Movie({
    required this.name,
    required this.imagePath,
    required this.videoPath,
    required this.category,
    required this.year,
    required this.duration,
  });

  static List<Movie> movies = [
    Movie(
        name: "Yuri Boyka",
        imagePath: "https://i.ytimg.com/vi/XGmae-CNj5w/maxresdefault.jpg",
        videoPath: "assets/videos/example.mp4",
        category: "Thriller",
        year: 2010,
        duration: const Duration(hours: 2, minutes: 35)),
    Movie(
        name: "Smoking",
        imagePath:
            "https://c8.alamy.com/compde/awjbya/der-smoking-2002-dream-works-film-mit-jackie-chan-und-jennifer-love-hewitt-awjbya.jpg",
        videoPath: "assets/videos/example.mp4",
        category: "Comedy",
        year: 2016,
        duration: const Duration(hours: 1, minutes: 50)),
    Movie(
        name: "Doctor Strange",
        imagePath:
            "https://4.bp.blogspot.com/-fMTD9jY9ygs/WEIhoFUvw2I/AAAAAAAAAY8/iL1hZOYRqk4LWXXblPtHTluSpAivRaXvACLcB/s1600/doctor-strange.png",
        videoPath: "assets/videos/example.mp4",
        category: "Fantastic",
        year: 2022,
        duration: const Duration(hours: 2, minutes: 30)),
    Movie(
        name: "No Way Home",
        imagePath:
            "https://www.thecosmiccircus.com/wp-content/uploads/2022/06/tobeyyyyy-e1654915118777.jpg",
        videoPath: "assets/videos/example.mp4",
        category: "Fantastic",
        year: 2022,
        duration: const Duration(hours: 1, minutes: 40)),
    Movie(
        name: "Student of The Year",
        imagePath:
            "https://filmfare.wwmindia.com/content/2019/may/studentoftheyear2tarasutariatigershroffananyapanday11557475661.jpg",
        videoPath: "assets/videos/example.mp4",
        category: "Romantic",
        year: 2018,
        duration: const Duration(hours: 1, minutes: 40)),
    Movie(
        name: "Krrish",
        imagePath:
            "https://www.koimoi.com/wp-content/new-galleries/2022/08/krrish-4-major-update-001.jpg",
        videoPath: "assets/videos/example.mp4",
        category: "Fantastic",
        year: 2012,
        duration: const Duration(hours: 1, minutes: 40)),
  ];
}
