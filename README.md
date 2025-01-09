# Red Clan Network
[![Learn More](https://github.com/RanaSharjeelShji/Rana-Sharjeel-Ali/blob/main/assets/renderpro.gif)](https://youtube.com/@coderedclan?si=GAD268WHb1z-Iker)
# About
`render_pro` is a Dart package to render images on background. Now no need to show loaders or Shimmer effects on network images.
Render Pro give smooth experince to your network images
## Features

- **Image Type**: It supports all kind of image types.

### Render_Pro Example
Create a list of network URLs
```dart
 List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrX7nxND2CUn9u_vklCWYEzIzbuNHzQfLmIw&s',
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCy16nhIbV3pI1qLYHMJKwbH2458oiC9EmA&s",
    "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZz_aEaEAX0yAzanEe_wfwTHlzCnad7IkNKzHs4NS-NIZ66QfCRVILJRZvhgfMEP_txgU&usqp=CAU",
    "https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-waterfall-free-image.jpeg?w=600&quality=80",
    "https://thumbs.dreamstime.com/b/incredibly-beautiful-sunset-sun-lake-sunrise-landscape-panorama-nature-sky-amazing-colorful-clouds-fantasy-design-115177001.jpg",
    'https://images.samsung.com/levant/smartphones/galaxy-s24-ultra/images/galaxy-s24-ultra-highlights-color-carousel-global-mo.jpg?imbypass=true',
    'https://img.freepik.com/premium-photo/aesthetic-sky-background_636537-267412.jpg',
  ];```

Call this method to load images before the screen where you need to show images
```dart
    RenderPro.init(imageUrls);
```
### Show images in views
Use RenderProImage widget to show preloaded network Images with same URLs.
```
 RenderProImage(
      width: double.infinity,
      url: placeholderImageUrls[index],
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      placeholder: CircularProgressIndicator(),
),
```

[![Learn More](https://github.com/RanaSharjeelShji/equal_space/blob/main/example/asset/banner.jpg?raw=true)](https://www.youtube.com/channel/UCnM_HfTRzP_XRdyYmfvTsGQ)
### Contributors


[![Learn More](https://yt3.googleusercontent.com/9A0wEzTcikgC4mV4t0wfGrEQUWuKqcPI_thgqBGkRlDpRSbMHwAnKoAl0HmEoVoikNs7CgCGpg=s176-c-k-c0x00ffffff-no-rj)](https://www.youtube.com/channel/UCnM_HfTRzP_XRdyYmfvTsGQ)
[![Learn More](https://github.com/RanaSharjeelShji/equal_space/blob/main/example/asset/image%20(4).png?raw=true)](https://github.com/RanaSharjeelShji)

- **Rana Sharjeel Ali Flutter Developer** 


