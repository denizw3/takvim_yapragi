import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takvim Yaprağı',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(username: 'deniz'),
        '/category': (context) => CategoryScreen(),
        '/health': (context) => HealthScreen(),
        '/music': (context) => MusicScreen(),
        '/art': (context) => ArtScreen(),
        '/astrology': (context) => AstrologyScreen(),
        '/math': (context) => MathScreen(),
        '/space': (context) => SpaceScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '🍃',
                style: TextStyle(fontSize: 100),
              ),
              SizedBox(height: 20),
              Text(
                'Takvim Yaprağı',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Kullanıcı Adı',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Şifre',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == 'deniz' && password == '12345') {
                    Navigator.pushReplacementNamed(context, '/home', arguments: username);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kullanıcı adı veya şifre hatalı!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: const Color.fromARGB(255, 195, 129, 207),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Giriş Yap'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: Text(
                  'Şifreni mi unuttun?',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Hesabın yok mu? Kayıt ol',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ol'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Kullanıcı Adı',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'E-Posta',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'Şifre',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Kayıt olma işlemleri burada gerçekleştirilecek
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifremi Unuttum'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: 'E-Posta',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Şifre yenileme işlemleri burada gerçekleştirilecek
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({required this.username});

  final List<String> dailyInfos = [
   "Dünyadaki en büyük çöl, Antarktika Çölü'dür.",

   "Güneş'in ışınlarının Dünya'ya ulaşması 8 dakika sürer..",
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomInfo = dailyInfos[random.nextInt(dailyInfos.length)];

    // Tarih ve gün adını almak için DateFormat kullanımı
    final String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final String dayOfWeek = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(formattedDate),
                Text(dayOfWeek),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hoş Geldin, $username!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Bugün öğreneceğiniz bilgi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 10),
            Text(
              '📚',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                randomInfo,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/category');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 240, 116, 158),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Daha Fazla Bilgi Edin'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 240, 116, 158),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text('🩺', style: TextStyle(fontSize: 24)),
            title: Text('Sağlık'),
            onTap: () {
              Navigator.pushNamed(context, '/health');
            },
          ),
          ListTile(
            leading: Text('🎵', style: TextStyle(fontSize: 24)),
            title: Text('Müzik'),
            onTap: () {
              Navigator.pushNamed(context, '/music');
            },
          ),
          ListTile(
            leading: Text('🎨', style: TextStyle(fontSize: 24)),
            title: Text('Sanat'),
            onTap: () {
              Navigator.pushNamed(context, '/art');
            },
          ),
          ListTile(
            leading: Text('♒', style: TextStyle(fontSize: 24)),
            title: Text('Astroloji'),
            onTap: () {
              Navigator.pushNamed(context, '/astrology');
            },
          ),
          ListTile(
            leading: Text('✏️', style: TextStyle(fontSize: 24)),
            title: Text('Matematik'),
            onTap: () {
              Navigator.pushNamed(context, '/math');
            },
          ),
          ListTile(
            leading: Text('🚀', style: TextStyle(fontSize: 24)),
            title: Text('Uzay'),
            onTap: () {
              Navigator.pushNamed(context, '/space');
            },
          ),
        ],
      ),
    );
  }
}

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sağlık 🩺'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• Bir insan vücudundaki damarların toplam uzunluğu yaklaşık 100.000 km\'dir. (Bu Dünya\'nın etrafını 2.5 kere dolanabilir demek.)',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• İnsan vücudundaki en büyük organ deridir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Göz bebeği, gözün iris(renkli) kısmının ortasında bulunan boşluktur.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Müzik 🎵'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• Bir saniyede oluşan titreşimlerin sayısına ses frekansı denir. Birimi hertz (Hz)\'dir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Standart bir piyanoda 52 beyaz tuş ve 36 siyah tuş olmak üzere toplam 88 tuş vardır.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Ludwig van Beethoven; Zamanın en ünlü piyanist ve bestecilerindendir. Alman müzisyen işitme engellidir.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class ArtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanat 🎨'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• Sanat tarihinde önemli yer edinen Mitoloji; Tarihin derinliklerindeki kültür, inanç, tanrılar, doğaüstü varlıklar ve evrenin yaratılışına dair efsaneleri içeren bir disiplindir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Heykel sanatının tarihte ilk örneklerinin ortaya çıktığı dönem Paleolitik Çağ olarak bilinmektedir. 🗿',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• 🎨 Ünlü ressam Van Gogh\'un en bilinen eseri “Yıldızlı Gece” tablosunu  ruh sağlığı merkezinde tedavi gördüğü dönemde yapmıştır.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class AstrologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astroloji ♒'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• Kova burcu ♒; Aklın rehberliğinde yol alan duygularından çok mantığı ile hareket etmenin çoğu alanda kendisini güçlü kıldığı bir burçtur.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Astroloji nedir? Gök cisimlerinin hareketlerini ve göreceli konumlarını inceleyerek canlı veya cansız varlıkların bunlardan nasıl etkileneceğini araştırır.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Çakra; İnsan bedeninde yedi temel enerji merkezi bulunur. Her bir merkez çakra (döngü, girdap) olarak tanımlanır. Her bir çakra yedi farklı renk ile temsil edilir.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class MathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matematik ✏️'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• J.Carl Friedrich Gauss (1777-1855); Gauss formülünün mucidi olan Alman matematikçiye katkılardan dolayı "Matematikçilerin prensi" denmiştir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Matematik ve fizikte öneme sahip olan Pi Sayısı en son 71 basamağa ulaşmıştı.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• 2024 Dünya Satranç Şampiyonası; Çinli Ding Liren ile Adaylar Turnuvası\'nın galibi Gukesh D arasında oynanacaktır.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class SpaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uzay 🚀'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '• Güneş Sistemi\'nin en büyük gezegeni beşinci sırada bulunan Jüpiter\'dir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Halkalı gezegen olarak bilinen gezegen; Satürn\' dür.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '• Plüton; Gezegenler sınıfından 2006 yılında çıkarılarak Cüce gezegen sınıfına dahil edilmiştir.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}





