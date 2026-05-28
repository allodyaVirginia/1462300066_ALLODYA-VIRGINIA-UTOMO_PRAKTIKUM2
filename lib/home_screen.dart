import 'package:flutter/material.dart';
import 'detail_movie_screen.dart';
import 'profile_screen.dart';

class Film {
  final String judul;
  final String gambar;
  final String genre;
  final String rating;
  final String durasi;
  final String deskripsi;

  Film({
    required this.judul,
    required this.gambar,
    required this.genre,
    required this.rating,
    required this.durasi,
    required this.deskripsi,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  final Film harryPotter = Film(
    judul: "Harry Potter",
    gambar: "https://m.media-amazon.com/images/I/81iqZ2HHD-L.jpg",
    genre: "Fantasy",
    rating: "8.6/10",
    durasi: "2 Jam 5 Menit",
    deskripsi: "Petualangan Harry Potter di dunia sihir Hogwarts.",
  );

  final Film avatar = Film(
    judul: "Avatar",
    gambar: "https://m.media-amazon.com/images/I/41kTVLeW1CL.jpg",
    genre: "Sci-Fi",
    rating: "9.0/10",
    durasi: "2 Jam 30 Menit",
    deskripsi: "Kehidupan dan peperangan di planet Pandora.",
  );

  final Film flash = Film(
    judul: "Flash",
    gambar: "https://m.media-amazon.com/images/I/71c05lTE03L.jpg",
    genre: "Action",
    rating: "8.8/10",
    durasi: "2 Jam",
    deskripsi: "Superhero tercepat yang dapat menembus waktu.",
  );

  final Film avangers = Film(
    judul: "Avengers",
    gambar: "https://m.media-amazon.com/images/I/81ExhpBEbHL.jpg",
    genre: "Adventure",
    rating: "8.7/10",
    durasi: "2 Jam 20 Menit",
    deskripsi: "Pertempuran para superhero melawan musuh besar.",
  );

  @override
  Widget build(BuildContext context) {

    List<Widget> halaman = [
      homeContent(),
      homeContent(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),

      appBar: AppBar(
        title: const Text(
          "MOVIE APP",
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

      // BODY
      body: halaman[selectedIndex],

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // HALAMAN HOME
  Widget homeContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),

      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: itemFilm(harryPotter),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: itemFilm(avatar),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: itemFilm(flash),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: itemFilm(avangers),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // WIDGET FILM
  Widget itemFilm(Film film) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMovieScreen(film: film),
          ),
        );
      },

      child: Column(
        children: [

          // GAMBAR FILM
          Container(
            height: 190,
            width: double.infinity,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87,
              ),

              borderRadius: BorderRadius.circular(6),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),

              child: Image.network(
                film.gambar,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // JUDUL FILM
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(4),

              border: Border.all(
                color: Colors.black,
              ),
            ),

            child: Text(
              film.judul,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}