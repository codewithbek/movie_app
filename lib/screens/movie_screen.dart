import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieScreend extends StatelessWidget {
  const MovieScreend({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackgroud(context, movie),
          _buildMovieInformation(context),
          _buildAction(context)
        ],
      ),
    );
  }

  Positioned _buildAction(BuildContext context) {
    return Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: const Color(0XFFFF7272),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.425, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Add to ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const TextSpan(text: "Watchlist"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: Colors.white,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.425, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Container()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: "Start ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const TextSpan(text: "Watching"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m ",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 25,
                unratedColor: Colors.white,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) {
                  return const Icon(Icons.star, color: Colors.amber);
                },
                onRatingUpdate: (rating) {}),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Student of the Year 2 is a 2018 Indian Hindi-language teen romantic action comedy film written by Arshad Sayed and directed by Punit Malhotra. A standalone sequel to the 2012 film Student of the Year, it stars Tiger Shroff, Tara Sutaria, Ananya Panday and Aditya Seal. and tells the story of Rohan Sachdev, a college student in his quest to become the Student of the Year. The film was produced by Karan Johar, Yash Johar and Apoorva Mehta under the banner Dharma Productions, with Fox Star Studios serving as distributor and co-producer.",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
              maxLines: 8,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackgroud(context, movie) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF000B49),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFF000B49),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }
}
