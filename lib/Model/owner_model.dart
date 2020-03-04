class OwnerModel {
  int id;
  String login,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type;
  bool siteAdmin;

  OwnerModel(
      {this.id,
      this.nodeId,
      this.htmlUrl,
      this.eventsUrl,
      this.avatarUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.gravatarId,
      this.login,
      this.organizationsUrl,
      this.receivedEventsUrl,
      this.reposUrl,
      this.siteAdmin,
      this.starredUrl,
      this.subscriptionsUrl,
      this.type,
      this.url});

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        avatarUrl: json['avatar_url'] as String,
        url: json['url'] as String,
        eventsUrl: json['events_url'] as String,
        followersUrl: json['followers_url'] as String,
        htmlUrl: json['html_url'] as String,
        followingUrl: json['following_url'] as String,
        gistsUrl: json['gists_url'] as String,
        gravatarId: json['gravatar_id'] as String,
        login: json['login'] as String,
        organizationsUrl: json['organizations_url'] as String,
        receivedEventsUrl: json['receivedEvents_url'] as String,
        siteAdmin: json['site_admin'] as bool,
        reposUrl: json['repos_url'] as String,
        starredUrl: json['starred_url'] as String,
        subscriptionsUrl: json['subscriptions_url'] as String,
        type: json['type'] as String);
  }
}
