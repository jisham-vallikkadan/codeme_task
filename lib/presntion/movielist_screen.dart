import 'package:codeme_task/provider/movide_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_detail_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MovieProvider>(context, listen: false).fetchMovieList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TvShows '),
        backgroundColor: Colors.black,
      ),
      body: Consumer<MovieProvider>(builder: (context, movie, _) {
        return movie.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                summary: movie.tvShows[index],
                              ),
                            ));
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      movie.tvShows[index].image?.medium ?? ''),
                                  fit: BoxFit.fill)),
                          height: 120,
                        ),
                      ),
                    ),
                    Text(
                      movie.tvShows[index].name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ],
                ),
                itemCount: movie.tvShows.length ?? 0,
              );
      }),
    );
  }
}
