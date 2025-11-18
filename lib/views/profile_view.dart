import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: const Color(0xFFFFF2D9),
      body: Stack(
        children: [
          
          Container(
            height: 280,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrangeAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

         
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),

                
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          const AssetImage('assets/images/profile_owner.jpeg'),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Talitha Alya Aurely",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text("Pengembang Aplikasi WildBite",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          )),

                      const SizedBox(height: 20),

                      
                      _infoTile(Icons.email, "Email",
                          "talithaaurely639@gmail.com"),
                      const SizedBox(height: 12),
                      _infoTile(Icons.person, "Instagram", "@talithaarly_"),
                      const SizedBox(height: 12),
                      _infoTile(Icons.location_on, "Lokasi", "Indonesia"),

                      const SizedBox(height: 25),

                     
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          icon: const Icon(Icons.email, color: Colors.white),
                          label: const Text(
                            'Hubungi Saya',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.person),
                    const SizedBox(width: 12),
                    _socialIcon(Icons.camera_alt),
                    const SizedBox(width: 12),
                    _socialIcon(Icons.language),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _infoTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.brown)),
              Text(subtitle, style: const TextStyle(color: Colors.black87)),
            ],
          )
        ],
      ),
    );
  }

  
  Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3))
          ]),
      child: Icon(icon, color: Colors.orange),
    );
  }
}
