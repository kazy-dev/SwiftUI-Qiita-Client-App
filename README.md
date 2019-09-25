# SwiftUI-Qiita-Client-App

このアプリはQiitaの[こちら](https://qiita.com/you_matz/items/a3d640be2a8feaf698bd)の記事を参考にSwiftUI学習目的で作成したサンプルアプリです。
入力したタグにヒットした最新記事50件をリスト表示します。

## Gif
<div align="center">
  <img src="https://github.com/kazy-dev/SwiftUI-Qiita-Client-App/blob/master/SwiftUI-Qiita-Client-App/Resources/SwiftUI-Qiita-Cliant-App_Screen_Movie.gif" width="300">
</div>

## Screenshot
<img src="https://github.com/kazy-dev/SwiftUI-Qiita-Client-App/blob/master/SwiftUI-Qiita-Client-App/Resources/image1.png">

## 環境
Xcode 11  
iOS 13.0  
SwiftUI  
Combine  

## 概要
基本的には、Qiita記事を参考にフォルダ構成を変更し、APIをQiita用に修正しただけのアプリです。
記事内に記載があるように大元のプロジェクトは、raywenderlichによって作成されているリポジトリが基盤となっています。

### ディレクトリ構成

```swift
- API/
 - QiitaFetcher.swift
   
- Protcol/
 - QiitaFetchable.swift
   
- Models/
 - QiitaData  
   
- Views/
 - QiitaRow  
 - QiitaContentView  
   
- ViewModels/
 - QiitaContentViewModel  
 - QiitaRowViewModel  
   
- Utils/
 - Errors  
 - QiitaError  

```

## 謝辞
最新のSwiftUIについてのこうしたチュートリアルはとても貴重なもので大変勉強になりました。  
SwiftUIのバグなどもあるようでまだまだ安定しないフレームワークではありますが、
Objective-CからSwiftに移行したように今後SwiftUIが主流になる可能性は多いにあるので、これからも日々キャッチアップに努めたいと思います。  
チュートリアルを提供してくださったraywenderlich氏、またそれを紹介して和訳してくださった@takkiiさんありがとうございました。  

## 参考
・raywenderlichによるMVVM-with-Combine-Tutorial-for-iOSのリポジトリ  
https://github.com/manchan/MVVM-with-Combine-Tutorial-for-iOS

・Qiitaの記事 MVVM with Combineチュートリアル for iOS(@takkiiさんの記事)  
https://qiita.com/you_matz/items/a3d640be2a8feaf698bd  

・Qiitaの記事 SwiftでQiitaのAPIを表示させる。(@dddiskさんの記事)  
https://qiita.com/dddisk/items/09b46c65434c117f1287  
  
・Qiita API v2 公式ドキュメント  
https://qiita.com/api/v2/docs  

