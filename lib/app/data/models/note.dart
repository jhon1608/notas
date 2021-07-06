import 'package:intl/intl.dart';

class Note {
  final int id;
  final String title;
  final String description;
  final DateTime createTime;
  int favorite;
  int trash;

  Note({
    required this.createTime,
    this.id = 1,
    required this.title,
    required this.description,
    this.favorite = 0,
    this.trash = 0,
  });
  copy({
    DateTime? createTime,
    int? id,
    String? title,
    String? description,
    int? favorite,
    int? trash,
  }) {
    return Note(
      createTime: createTime ?? this.createTime,
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      trash: trash ?? this.trash,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createTime': createTime.toString(),
      'favorite': favorite,
      'trash': trash,
    };
  }

  String createTimeFormat2() {
    DateTime now = DateTime.now();

    String dt = new DateFormat("dd/MM/yyyy hh:ss").format(createTime);
    return dt;
  }

  String createTimeFormat() {
    DateTime now = DateTime.now();
    Duration dife = now.difference(createTime);
    print(dife);
    Duration min = Duration(minutes: 1);
    Duration hora = Duration(hours: 1);
    Duration day = Duration(days: 1);
    if (dife < min) {
      return "Ahora mismo";
    }

    if (dife < hora) {
      return "Hace ${dife.inMinutes} min";
    }
    if (dife < day) {
      return "Hace ${dife.inHours} hs";
    }
    return "Hace ${dife.inDays} days";

    // String dt = new DateFormat("dd-MM-yyyy hh:ss").format(createTime);
    // return dt;
  }
}
