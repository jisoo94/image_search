import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    expect(
      viewModel.photoStream,
      emitsInAnyOrder([
        equals([]),
        equals(result),
        equals(result),
        
      ]),
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g2e3a1bf52c557c7a293ef53443b793f4e09b1f61a8dcdd11c306ef85e7f7ebf5272c0df2962ba3f5cc9dcc4a589fbdde_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g2d0858e42a7f8c8c7c4ed46ee83525e90cfc65c2c3c6e477ed32ff74c90d4a4c7c93e3080c89c35bec2c2d31dd55bdc304ca541233056400d26218a519fac530_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 535869,
    "downloads": 325044,
    "collections": 1343,
    "likes": 2428,
    "comments": 205,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g8a236509d69a1c749dfba6ac08aee0c7a3753ccbdb23c5f9253efa37a9131c8c465280b500639b55f41d25d0016ea26ae216241233a60dbc9181f7f4e978c86e_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g08228a3e82d6c42f51df3a266ca3bc247282a1b1ec590afb6ee8c6e723268865fd9fb9665039fb42d4acb17e7134c0949545ff882c578d160cf60b5c30454eac_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 774497,
    "downloads": 571217,
    "collections": 1459,
    "likes": 1120,
    "comments": 285,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
