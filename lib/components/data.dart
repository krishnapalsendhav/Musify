const _wavUrl1 = 'https://pagalworld.com.se/files/download/id/5103';
const _wavUrl2 = 'https://pagalworld.com.se/files/download/id/5816';
const _mp3Url1 = 'https://pagalworld.com.se/files/download/id/5054';
const _mp3Url2 = 'https://pagalworld.com.se/files/download/id/6132';
const _mysong1 =
    'https://pagalnew.com/mp3-songs/bollywood-mp3-songs/nain-ta-heere-lisa-jugjugg-jeeyo-128-kbps-sound.mp3';
const _mysong2 =
    'https://pagalnew.com/mp3-songs/indipop-mp3-songs/har-har-shambhu-shiv-mahadeva-jeetu-sharma-128-kbps-sound.mp3';
const _mysong3 =
    'https://dns4.vippendu.com/download/128k-lphd/Shiva-Ashtakam.mp3';
const _fitoor = 'https://pagalworld.com.se/files/download/id/6479';

const _meriJaan = 'spotify:track:4iEGv5Ne6HuCkFCjzxdWQK';

class MyData {
  static int current = 0;
  static bool playing = false;

  static List<bool> liked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> songs = [
    _fitoor,
    _meriJaan,
    _mp3Url1,
    _mysong1,
    _mysong2,
    _mysong3,
    _mp3Url2,
    _wavUrl1,
    _wavUrl2,
  ];
  List<String> songName = [
    "Fitoor",
    "Meri Jaan",
    "Dhoka",
    "Nain Ta Tere",
    "Har Har Shambhu",
    "Shiv Ashtakam",
    "Sun Bhi Le",
    "Shrivalli",
    "Mehbooba"
  ];
  List<String> images = [
    "https://www.pagalvvorld.com/wp-content/uploads/2022/07/Fitoor-Shamshera-mp3-image-300x300.jpg",
    "https://www.pagalvvorld.com/wp-content/uploads/2022/07/Fitoor-Shamshera-mp3-image-300x300.jpg",
    "https://i0.wp.com/urbanasian.com/wp-content/uploads/2022/02/WhatsApp-Image-2022-02-09-at-1.36.26-PM.jpeg?fit=1000%2C1000&ssl=1",
    "https://i0.wp.com/www.lyricsupgrade.com/wp-content/uploads/2022/06/Nain-Ta-Heere-Lyrics-JugJugg-Jeeyo.jpg",
    "https://imgk.timesnownews.com/story/Shiv_aarti.jpg?tr=w-400,h-300,fo-auto",
    "https://rukminim1.flixcart.com/image/416/416/k0mqtu80/sticker/a/2/j/glossy-vinyl-41x38cm-with-strong-gumming-wall-sticker-medium-41-original-imaffj9papmafebh.jpeg?q=70",
    "https://filmfare.wwmindia.com/thumb/content/2022/apr/arijitsingh11650885572.jpg?width=1200&height=900",
    "https://pbs.twimg.com/media/FBjZzbEVEAQ7RkZ.jpg:large",
    "https://pbs.twimg.com/media/FQSzVQ4X0AIRVCw.jpg:large"
  ];
  List<String> artist = [
    "Neeti Mohan feat. Arjit Singh",
    "Neeti Mohan feat. Arjit Singh",
    "Arjit Singh",
    "Guru Randhawa",
    "Jeetu Sharma",
    "Ramesh Bhai Ojha",
    "Arjit Singh",
    "Javed Ali",
    "Ananya Bhat"
  ];
}
