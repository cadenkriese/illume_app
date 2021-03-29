import 'package:flutter/widgets.dart';
import 'package:illume_app/data/post.dart';
import 'package:illume_app/data/user.dart';

List<User> kMockUsers = [
  User(
    "identification",
    "Jasmine Smith",
    AssetImage("assets/sample/1.jpg"),
  ),
  User(
    "identification",
    "Vinod Nambiar",
    AssetImage("assets/sample/2.jpg"),
  ),
  User(
    "identification",
    "Mark Dalton",
    AssetImage("assets/sample/3.jpg"),
  ),
  User(
    "identification",
    "John Bowers",
    AssetImage("assets/sample/4.jpg"),
  ),
  User(
    "identification",
    "Trisha Lawrence",
    AssetImage("assets/sample/5.jpg"),
  ),
  User(
    "identification",
    "Anthony Olivio",
    AssetImage("assets/sample/6.jpg"),
  ),
];

List<Post> kMockFeed = [
  Post(
    kMockUsers[0],
    "Hi all, I'm proud to announce that I've joined Google as an engineer on their Flutter team!🤩 Unfortunately that means I'll be moving to San Francisco, I'll miss everyone in this office 😢 be sure to link with me to stay in touch!",
    DateTime(2021, 3, 21, 14, 20),
    likes: 904,
    responses: [
      Post(
        kMockUsers[1],
        "Congratulations!! 🎉",
        DateTime(2021, 3, 21, 16, 43),
      ),
      Post(
        kMockUsers[2],
        "Wow! Amazing work!",
        DateTime(2021, 3, 21, 15, 27),
      ),
      Post(
        kMockUsers[5],
        "Completely deserved! I'm sure you'll do amazing! 😄",
        DateTime(2021, 3, 21, 14, 55),
      ),
    ],
  ),
  Post(
    kMockUsers[1],
    "Just finished this billboard for a local business!",
    DateTime(2021, 3, 21, 7, 5),
    likes: 23,
    attachments: [Image.asset("assets/sample/billboard.png")],
    responses: [
      Post(
        kMockUsers[0],
        "Great work as always, Vinod!",
        DateTime(2021, 3, 21, 9, 13),
      ),
    ],
  ),
  Post(
    kMockUsers[2],
    "There's a new coffee shop in town! Who's down to go meet up and have some cold brew?️️️️️️☕",
    DateTime(2021, 3, 21, 12, 34),
    likes: 764,
  ),
  Post(
    kMockUsers[3],
    "Going to try out working at the local library today, should be productive!😎",
    DateTime(2021, 3, 21, 13, 37),
    likes: 96,
  ),
  Post(
    kMockUsers[4],
    "Hi all, I designed a free simple budget tool for my fellow small business owners! Download the Excel file below!",
    DateTime(2021, 3, 21, 17, 2),
    likes: 102,
  ),
  Post(
    kMockUsers[5],
    "Hi, if any graphic designers are in this office please let me know, I need help with a logo for my new app!",
    DateTime(2021, 3, 21, 9, 10),
    likes: 671,
    responses: [
      Post(
        kMockUsers[1],
        "Hi Anthony, I've had a lot of experience with graphic design and I'd love to work with you! Contact me at vinod@nambiar.net",
        DateTime(2021, 3, 21, 9, 43),
      ),
    ],
  ),
];
