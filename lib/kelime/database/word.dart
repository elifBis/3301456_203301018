
class Word {
  final int id;
  final String word;
  final String correspond;
  final String country;

  Word({required this.id, required this.word, required this.correspond, required this.country});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'correspond': correspond,
      'country': country,
    };
  }

  @override
  String toString() {
    return 'Word{id: $id, word: $word, correspond: $correspond, country:$country }';
  }
}