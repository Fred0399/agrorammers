import 'package:flutter/foundation.dart';

class User {
   int id;
   String socialId;
   String email;
   String name;
   String imageUrl;
  User({
    @required this.id,
    @required this.socialId,
    @required this.email,
    this.name,
    this.imageUrl,
  });
}
