class Sura {
  final int id;
  final String nameEn;
  final String nameAr;
  final int verses;

  Sura({required this.id, required this.nameEn, required this.nameAr, required this.verses});
}

class Hadith {
  final String title;
  final String content;

  Hadith({required this.title, required this.content});
}