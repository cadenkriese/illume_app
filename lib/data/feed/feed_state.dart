part of 'feed_cubit.dart';

class FeedState extends Equatable {
  const FeedState._({this.feed = const []});
  final List<Post> feed;

  const FeedState.loading() : this._();
  const FeedState.initialized(List<Post> schedule) : this._(feed: schedule);

  @override
  List<Object> get props => [feed];
}

class Post {
  User poster;
  String content;
  List<Image> attachments;
  Post(this.poster, this.content, this.attachments);
}
