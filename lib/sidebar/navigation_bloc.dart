import 'package:bloc/bloc.dart';
import 'package:remax_app/screen/about_page.dart';
import 'package:remax_app/screen/agents_page.dart';
import 'package:remax_app/screen/contact_us_page.dart';
import 'package:remax_app/screen/favourite_page.dart';
import 'package:remax_app/screen/gallery_page.dart';
import 'package:remax_app/screen/home_page.dart';
import 'package:remax_app/screen/map_page.dart';
import 'package:remax_app/screen/sign_in_page.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  FavoritePageClickedEvent,
  GalleryPageClickedEvent,
  AboutPageClickedEvent,
  AgentsPageClickedEvent,
  ContactUsPageClickedEvent,
  MapPageClickedEvent,
  SignInPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyHomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield MyHomePage();
        break;
      case NavigationEvents.FavoritePageClickedEvent:
        yield FavoritePage();
        break;
      case NavigationEvents.AboutPageClickedEvent:
        yield AboutPage();
        break;
      case NavigationEvents.AgentsPageClickedEvent:
        yield AgentsPage();
        break;
      case NavigationEvents.GalleryPageClickedEvent:
        yield GalleryPage();
        break;
      case NavigationEvents.ContactUsPageClickedEvent:
        yield ContactUsPage();
        break;
      case NavigationEvents.MapPageClickedEvent:
        yield MapPage();
        break;
      case NavigationEvents.SignInPageClickedEvent:
        yield SignInPage();
        break;
    }
  }
}
