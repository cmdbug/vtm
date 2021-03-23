[![Maven Central](https://img.shields.io/maven-central/v/org.mapsforge/vtm.svg)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.mapsforge%22)
[![Build Status](https://travis-ci.org/mapsforge/vtm.svg?branch=master)](https://travis-ci.org/mapsforge/vtm)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](http://www.gnu.org/licenses/lgpl-3.0)

## 由于会访问外网可能会出现无法显示地图等问题，不是代码原因。可以通过Logcat查看对应的访问地址等信息。 ##

## 请遵守相关国家或地区的规定！
- 在不破坏已有成果的前提下尝试编辑地图！
- 不要上传、编辑、记录损害国家主权与领土完整的任何地理信息。
- 不要上传、编辑、记录可能危害国家安全的任何地理信息。
- 不要上传、编辑、记录与军事与国家安全相关的任何地理信息。
- 不要上传、编辑、记录敏感地区的地理信息。

### 开源地图，欢迎学习或使用的码农们去 https://www.openstreetmap.org/ 注册个账号完善下地图信息。

# V™

VTM was developed within the [OpenScienceMap](https://github.com/opensciencemap) project.

**This fork continues VTM development. And provides compatibility with latest [Mapsforge](https://github.com/mapsforge/mapsforge).**

See the **[integration guide](docs/Integration.md)** and [changelog](docs/Changelog.md). And read through [how to contribute](.github/CONTRIBUTING.md) guidelines.

If you have any questions or problems, don't hesitate to ask our public [mailing list](https://groups.google.com/group/mapsforge-dev) for help.

## Features
- Java map library
- OpenGL vector-tile rendering
- Themeable vector layers
- Support for multiple tile sources:
  - OpenScienceMap vector tiles
  - Mapsforge vector maps
  - Mapbox vector tiles (e.g. Mapzen, Nextzen, OpenMapTiles)
  - GeoJSON vector tiles (e.g. Mapzen, Nextzen)
  - Raster tiles: any quadtree-scheme tiles as texture
- Backends:
  - Android
  - iOS (libGDX/RoboVM, [instructions](docs/ios.md))
  - Desktop (libGDX/LWJGL, [instructions](docs/desktop.md))
  - HTML5/WebGL (libGDX/GWT, [instructions](docs/web.md))

### Projects
- **vtm** core library
- **vtm-android** Android backend
- **vtm-android-example** Android examples
- **vtm-gdx** common libGDX backend
- **vtm-android-gdx** Android libGDX backend
- **vtm-desktop** Desktop libGDX backend
- **vtm-playground** Desktop examples
- **vtm-ios** iOS libGDX backend
- **vtm-ios-example** iOS examples
- **vtm-web** HTML5/GWT libGDX backend
- **vtm-web-app** HTML5/GWT application

## WebGL Demo
[OpenScienceMap](http://opensciencemap.org/s3db/#scale=17,rot=61,tilt=51,lat=53.075,lon=8.807) view of Bremen.
- Hold right mouse button to change view direction.

## Applications
- VTM is used by many [applications](docs/Applications.md).

## Maps
- Mapsforge [map providers](docs/Mapsforge-Maps.md).

## Credits
This library contains code from several projects:
- **Android** (Apache 2.0): some Matrix code, TimSort (http://source.android.com)
- **libGDX** (Apache 2.0): AsyncTask, MathUtils, Interpolation, PixmapPacker (https://github.com/libgdx)
- **mapsforge** (LGPL3): based on 0.2.4 (https://github.com/mapsforge/mapsforge)
- **osmdroid** (Apache 2.0): some overlay classes (https://github.com/osmdroid/osmdroid)
- **tessellate** (SGI Free Software License B 2.0): (https://github.com/cscheid/tessellate)

## Screenshots

<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_163543.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_163641.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_164002.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_164326.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_153348.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_153603.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_154325.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_154352.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_154521.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_155046.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_155233.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_155830.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_160212.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_091237.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112212.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112234.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112329.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112337.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112345.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112354.png"/>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112401.png"/>
</div>
<div>
<img width="270" height="480" src="./docs/screenshots/Screenshot_112534.png"/>
</div>

| Android       | iOS           |
| ------------- | ------------- |
|<img src="docs/images/android.png" width="1000">|<img src="docs/images/ios.png" width="1000">|

| Desktop       |
| ------------- |
|![Desktop](docs/images/desktop.png)|

| Browser       |
| ------------- |
|![Browser](docs/images/browser.png)|
