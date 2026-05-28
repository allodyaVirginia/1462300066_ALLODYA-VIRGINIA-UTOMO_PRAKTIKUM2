import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // FOTO PROFILE
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),

              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/profile.jpg",
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NAMA
            const Text(
              "Allodya Virginia",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // NO HP
            profileItem(
              Icons.phone,
              "No HP",
              "081234567890",
            ),

            // EMAIL
            profileItem(
              Icons.email,
              "Email",
              "allodya@gmail.com",
            ),

            // LOKASI
            profileItem(
              Icons.location_on,
              "Lokasi",
              "Surabaya, Indonesia",
            ),

            // INSTAGRAM
            profileItem(
              Icons.camera_alt,
              "Instagram",
              "https://www.instagram.com/allodyavirginia?igsh=MWx1cWMydng0ZW1jcQ==",
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET PROFILE ITEM
  static Widget profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}