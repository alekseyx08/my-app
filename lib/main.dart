import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _variant = 1;

  static const _names = {
    1: 'Вариант 1: Wrap с контейнерами',
    2: 'Вариант 2: Column с текстом о себе',
    3: 'Вариант 3: Column с Row из иконок',
    4: 'Вариант 4: Stack с радугой',
    5: 'Вариант 5: Wrap с текстами',
    6: 'Вариант 6: Wrap с картинками',
    7: 'Вариант 7: Column с ассетами',
    8: 'Вариант 8: Stack по углам',
    9: 'Вариант 9: Wrap с иконками',
    10: 'Вариант 10: Column с Row картинок',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Холхонов Алексей Викторович'),
        actions: [
          DropdownButton<int>(
            value: _variant,
            dropdownColor: Colors.white,
            items: _names.keys
                .map((v) => DropdownMenuItem(
                      value: v,
                      child: Text(_names[v]!),
                    ))
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => _variant = v);
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_variant) {
      case 1:
        return _variant1();
      case 2:
        return _variant2();
      case 3:
        return _variant3();
      case 4:
        return _variant4();
      case 5:
        return _variant5();
      case 6:
        return _variant6();
      case 7:
        return _variant7();
      case 8:
        return _variant8();
      case 9:
        return _variant9();
      case 10:
        return _variant10();
      default:
        return const SizedBox();
    }
  }

  // ---------- Вариант 1: Wrap, контейнеры с размером, цветом и отступом ----------
  Widget _variant1() {
    return Center(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(6, (index) {
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8.0),
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(child: Text('Контейнер $index')),
          );
        }),
      ),
    );
  }

  // ---------- Вариант 2: Column, сведения о себе со стилями и отступами ----------
  Widget _variant2() {
    Widget line(String text) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          line('ФИО: Холхонов Алексей Викторович'),
          line('Год рождения: 1989'),
          line('Группа: зИСТУ-23'),
          line('Университет: ЧИ БГУ'),
        ],
      ),
    );
  }

  // ---------- Вариант 3: Column с Row иконок, выравнивание по ширине ----------
  Widget _variant3() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 40),
              Icon(Icons.favorite, color: Colors.red, size: 40),
              Icon(Icons.home, color: Colors.blue, size: 40),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.music_note, color: Colors.purple, size: 40),
              Icon(Icons.camera_alt, color: Colors.green, size: 40),
              Icon(Icons.phone, color: Colors.orange, size: 40),
              Icon(Icons.email, color: Colors.teal, size: 40),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.pets, color: Colors.brown, size: 40),
              Icon(Icons.flight, color: Colors.indigo, size: 40),
              Icon(Icons.sunny, color: Colors.deepOrange, size: 40),
            ],
          ),
        ],
      ),
    );
  }

  // ---------- Вариант 4: Stack с цветами радуги, всё по центру ----------
    Widget _variant4() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 250, height: 250, color: Colors.red),
          Container(width: 210, height: 210, color: Colors.orange),
          Container(width: 170, height: 170, color: Colors.yellow),
          Container(width: 130, height: 130, color: Colors.green),
          Container(width: 90, height: 90, color: Colors.blue),
          Container(width: 50, height: 50, color: Colors.indigo),
          Container(width: 25, height: 25, color: Colors.purple),
        ],
      ),
    );
  }


  // ---------- Вариант 5: Wrap с контейнерами-текстами о себе ----------
  Widget _variant5() {
    Widget info(String text, Color color) => Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        );

    return Center(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          info('ФИО: Холхонов Алексей Викторович', Colors.amber),
          info('Год рождения: 1989', Colors.lightGreen),
          info('Группа: зИСТУ-23', Colors.lightBlue),
          info('Город: Чита', Colors.pinkAccent),
        ],
      ),
    );
  }

  // ---------- Вариант 6: Wrap с картинками из интернета ----------
 Widget _variant6() {
    const urls = [
      'https://yapx.ru/album/eQz1V',
      'https://yapx.ru/album/eQz2T',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Gull_portrait_ca_usa.jpg/240px-Gull_portrait_ca_usa.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Tour_Eiffel_Wikimedia_Commons_%28cropped%29.jpg/240px-Tour_Eiffel_Wikimedia_Commons_%28cropped%29.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/240px-Good_Food_Display_-_NCI_Visuals_Online.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedSunrise01.jpg/240px-RedSunrise01.jpg',
    ];
    return Center(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(6, (index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                urls[index],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ---------- Вариант 7: Column с картинками из ассетов ----------
  // Нужны файлы assets/image1.jpg ... image5.jpg и блок assets: в pubspec.yaml
  Widget _variant7() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image${index + 1}.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // ---------- Вариант 8: Stack, контейнеры по углам ----------
  Widget _variant8() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(width: 100, height: 100, color: Colors.orange),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(width: 60, height: 60, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Вариант 9: Wrap с контейнерами и иконками ----------
  Widget _variant9() {
    const icons = [
      Icons.star,
      Icons.favorite,
      Icons.home,
      Icons.music_note,
      Icons.camera_alt,
      Icons.phone,
    ];
    return Center(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(6, (index) {
          return Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8.0),
            color: Colors.primaries[index % Colors.primaries.length],
            child: Icon(icons[index], color: Colors.white, size: 48),
          );
        }),
      ),
    );
  }

  // ---------- Вариант 10: Column с Row контейнеров-картинок ----------
  Widget _variant10() {
    Widget pic(String url) => Container(
          margin: const EdgeInsets.all(4.0),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
          ),
        );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pic('https://picsum.photos/seed/a1/100/100'),
              pic('https://picsum.photos/seed/a2/100/100'),
              pic('https://picsum.photos/seed/a3/100/100'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pic('https://picsum.photos/seed/b1/100/100'),
              pic('https://picsum.photos/seed/b2/100/100'),
              pic('https://picsum.photos/seed/b3/100/100'),
            ],
          ),
        ],
      ),
    );
  }
}
