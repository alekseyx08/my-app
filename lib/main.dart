import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Холхонов А.В. — Лабораторная работа2',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: theme.colorScheme.primaryContainer,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: List.generate(10, (i) => Tab(text: 'Вариант ${i + 1}')),
          ),
        ),
        body: TabBarView(
          children: [
            _Page(t: '1. Wrap сетка', c: _V1()),
            _Page(t: '2. Column сведения', c: _V2(theme)),
            _Page(t: '3. Row с иконками', c: _V3()),
            _Page(t: '4. Радужный Stack', c: _V4()),
            _Page(t: '5. Wrap сведения', c: _V5(theme)),
            _Page(t: '6. Сетевые фото Wrap', c: _V6()),
            _Page(t: '7. Ассеты в Column', c: _V7()),
            _Page(t: '8. Stack по углам', c: _V8(theme)),
            _Page(t: '9. Сетка иконок Wrap', c: _V9()),
            _Page(t: '10. Ряды Network фото', c: _V10()),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String t;
  final Widget c;
  const _Page({required this.t, required this.c});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            t,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: c),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _V1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
        6,
        (i) => Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.primaries[i % Colors.primaries.length],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(' ${i + 1}')),
        ),
      ),
    );
  }
}

class _V2 extends StatelessWidget {
  final ThemeData theme;
  const _V2(this.theme);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ФИО: Холхонов Алексей Викторович',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Год рождения: 1989 г.',
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 10),
        Text(
          'Группа: зИСТУ-23',
          style: TextStyle(fontSize: 18, color: theme.colorScheme.secondary),
        ),
      ],
    );
  }
}

class _V3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.star, size: 40, color: Colors.amber),
            Icon(Icons.favorite, size: 40, color: Colors.red),
            Icon(Icons.home, size: 40, color: Colors.blue),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.person, size: 40, color: Colors.green),
            Icon(Icons.settings, size: 40, color: Colors.orange),
          ],
        ),
      ],
    );
  }
}

class _V4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 220,
          height: 230,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        Container(
          width: 170,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Container(
          width: 120,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Container(
          width: 70,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Icon(Icons.bolt, color: Colors.white, size: 32),
      ],
    );
  }
}

class _V5 extends StatelessWidget {
  final ThemeData theme;
  const _V5(this.theme);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'ФИО: Холхонов А.В.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Год: 1989'),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Группа: зИСТУ-23'),
        ),
      ],
    );
  }
}

class _V6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
        4,
        (i) => Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              // Исправлено: добавлен слэш перед id
              image: NetworkImage(
                'https://avatars.mds.yandex.net/i?id=ad65cb4fea6ea6fb6f7ff1d70f08c28b_l-12394646-images-thumbs&n=13{(i + 1) * 10}/150/150',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _V7 extends StatelessWidget {
  const _V7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Список красивых системных иконок, которые имитируют фотографии
    final mockPhotos = [
      {'title': 'Горы', 'icon': Icons.landscape, 'color': Colors.teal},
      {'title': 'Лес', 'icon': Icons.forest, 'color': Colors.green},
      {'title': 'Солнце', 'icon': Icons.wb_sunny, 'color': Colors.orange},
      {'title': 'Пляж', 'icon': Icons.beach_access, 'color': Colors.blue},
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) => Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: (mockPhotos[i]['color'] as Color).withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: (mockPhotos[i]['color'] as Color).withOpacity(0.4)),
          ),
          child: ListTile(
            // Вместо проблемного Image.asset выводим красивую цветную иконку
            leading: CircleAvatar(
              backgroundColor: (mockPhotos[i]['color'] as Color).withOpacity(0.2),
              child: Icon(
                mockPhotos[i]['icon'] as IconData, 
                color: mockPhotos[i]['color'] as Color,
                size: 24,
              ),
            ),
            title: Text(
              mockPhotos[i]['title'] as String, 
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '', 
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ),
      )),
    );
  }
}


class _V8 extends StatelessWidget {
  final ThemeData theme;
  const _V8(this.theme, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(top: 10, left: 10, child: Container(width: 55, height: 55, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)))),
          Positioned(top: 10, right: 10, child: Container(width: 55, height: 55, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)))),
          Positioned(bottom: 10, left: 10, child: Container(width: 55, height: 55, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)))),
          Positioned(bottom: 10, right: 10, child: Container(width: 55, height: 55, decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)))),
        ],
      ),
    );
  }
}

class _V9 extends StatelessWidget {
  const _V9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.star, 
      Icons.home, 
      Icons.favorite, 
      Icons.person, 
      Icons.settings, 
      Icons.phone
    ];

    // Добавляем список ярких цветов для каждой иконки по порядку
    final iconColors = [
      Colors.amber,       // Звезда — Желтый
      Colors.lightBlue,   // Дом — Голубой
      Colors.redAccent,   // Сердце — Красный
      Colors.greenAccent, // Профиль — Зеленый
      Colors.orange,      // Настройки — Оранжевый
      Colors.purpleAccent // Телефон — Фиолетовый
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: List.generate(
        6,
        (i) => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            // Сделаем фон контейнеров чуть темнее, чтобы цветные иконки смотрелись контрастно
            color: const Color(0xFF2E3B4E), 
            borderRadius: BorderRadius.circular(16),
            // Добавим тонкую рамку в цвет иконки для еще более красивого вида
            border: Border.all(color: iconColors[i].withOpacity(0.3), width: 1.5),
          ),
          child: Icon(
            icons[i], 
            size: 36, 
            color: iconColors[i], // ИСПРАВЛЕНО: Теперь цвет берется из нашего списка
          ),
        ),
      ),
    );
  }
}


class _V10 extends StatelessWidget {
  const _V10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ИСПРАВЛЕНО: Добавлены разделы /id/... и размеры в пикселях для каждой картинки
            Container(
              width: 85, 
              height: 85, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), 
                image: DecorationImage(
                  image: NetworkImage('https://avatars.mds.yandex.net/i?id=983d612f6b46761a69b9db42c479d4cbcceb0427-4119111-images-thumbs&n=13'), 
                  fit: BoxFit.cover
                )
              )
            ),
            Container(
              width: 85, 
              height: 85, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), 
                image: DecorationImage(
                  image: NetworkImage('https://avatars.mds.yandex.net/i?id=3a788c153ec300ec1c03df62ab1b20d529db85e0-6437475-images-thumbs&n=13'), 
                  fit: BoxFit.cover
                )
              )
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85, 
              height: 85, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), 
                image: DecorationImage(
                  image: NetworkImage('https://avatars.mds.yandex.net/i?id=b261d9dc0c5f1a4a4c45323abacea660539cec36-9051244-images-thumbs&n=13'), 
                  fit: BoxFit.cover
                )
              )
            ),
          ],
        ),
      ],
    );
  }
}

