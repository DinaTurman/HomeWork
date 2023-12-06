class Animal {
  String label;
  String imageUrl;
  String description;
  String soundUrl;

  Animal(
      this.label,
      this.imageUrl,
      this.description,
      this.soundUrl
      );

  static List<Animal> animals = [
    Animal(
      'Горилла',
      'assets/gor.jpg',
      'Мощное примат с темным мехом. Обладает большой силой и является близким родственником человека.',
      'assets/tiger.mp3'
    ),
    Animal(
      'Жираф',
      'assets/giraffe.jpg',
      'Высокое животное с длинной шеей и пятнистой окраской. Обитает в саваннах Африки.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Коала',
      'assets/koa.jpg',
      'Млекопитающее с плюшевой внешностью и большими круглыми глазами. Питается листьями эвкалипта.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Крокодил',
      'assets/croc.jpg',
      'Пресмыкающееся с длинным телом и острыми зубами. Обитает в водоемах и на берегах рек.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Лев',
      'assets/lion.jpg',
      'Могучий хищник с гривой у самцов. Является символом силы и величия.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Панда',
      'assets/Panda.jpg',
      'Медвежий вид с черно-белой окраской. Любит питаться бамбуком и известен своей милой внешностью.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Пингвин',
      'assets/ping.jpg',
      'Полетное беспозвоночное с черно-белой окраской и крючковатым клювом. Обитает в воде и на суше.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Слон',
      'assets/slon.jpg',
      'Крупное млекопитающее с длинным хоботом. Обладает высоко развитым интеллектом и социальной структурой.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Тигр',
      'assets/tigr.jpg',
      'Крупный хищник с красивым мехом и полосами. Является одним из крупнейших представителей кошачьих.',
        'assets/tiger.mp3'
    ),
    Animal(
      'Фламинго',
      'assets/flam.jpg',
      'Птица с длинной вытянутой шеей и розовым оперением. Обитает в соленых водоемах.',
        'assets/tiger.mp3'
    ),
  ];
}