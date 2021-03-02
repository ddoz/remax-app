import 'package:bloc/bloc.dart';
import 'package:remax_app/screens/about/about_page.dart';
import 'package:remax_app/screens/agents_page.dart';
import 'package:remax_app/screens/contactus/contact_us_page.dart';
import 'package:remax_app/screens/favourite/favourite_page.dart';
import 'package:remax_app/screens/gallery_page.dart';
import 'package:remax_app/screens/home_page.dart';
import 'package:remax_app/screens/map_page.dart';
import 'package:remax_app/screens/sign_in_page.dart';

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
