class Session {
  String accessToken;
  String refreshToken;
  int expiryDuration;

  Session(this.accessToken, this.refreshToken, this.expiryDuration);

  setAccessToken(String accessToken) {this.accessToken = accessToken;}
  setRefreshToken(String refreshToken) {this.refreshToken = refreshToken;}
  setExpiryDuration(int expiryDuration) {this.expiryDuration = expiryDuration;}


}