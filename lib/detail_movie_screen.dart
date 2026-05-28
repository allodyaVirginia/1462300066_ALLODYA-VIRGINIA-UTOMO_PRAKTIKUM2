import 'package:flutter/material.dart';
import 'home_screen.dart';

class DetailMovieScreen extends StatelessWidget {
  final Film film;

  const DetailMovieScreen({
    super.key,
    required this.film,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(

        // TOMBOL KEMBALI KE HOME
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "MOVIE DETAIL",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,

        shape: const Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GAMBAR FILM
            Container(
              height: 240,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),

                child: Image.network(
                  film.gambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // INFORMASI FILM
            movieInfo("Judul Film", film.judul),
            movieInfo("Genre", film.genre),
            movieInfo("Durasi", film.durasi),
            movieInfo("Rating", film.rating),

            const SizedBox(height: 18),

            const Text(
              "Deskripsi Film",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 12),

              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),

              child: Text(
                film.deskripsi,
                textAlign: TextAlign.justify,

                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(),

            // BUTTON TRAILER
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                onPressed: () {},

                child: const Text(
                  "WATCH TRAILER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // BUTTON TIKET
            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),

                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),

                onPressed: () {},

                child: const Text(
                  "BUY TICKET",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget movieInfo(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.only(bottom: 8),

      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),

      child: Row(
        children: [

          Text(
            "$title : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

          Expanded(
            child: Text(
              value,

              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}