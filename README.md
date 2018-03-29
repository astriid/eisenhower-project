![Eisenhower: An application to classify tasks in Swift](https://github.com/heitzls/eisenhower-project/blob/master/logoGit.png)

![CocoaPods](https://img.shields.io/cocoapods/v/AFNetworking.svg)
![iOS](https://img.shields.io/badge/iOS-11.0-green.svg)
![swift](https://img.shields.io/badge/swift-4.0-red.svg)
![Xcode](https://img.shields.io/badge/Xcode-9.2-lightgrey.svg)

Eisenhower is a method of prioritizing tasks would have been inspired by Dwight D. Eisenhower. 
He was the 34th President of the United States of America, who would have once said: "What is important is rarely urgent and what is urgent rarely matters".


- [Features](#features)
- [Dependency manager](#dependency-manager)
- [Documentation](#documentation)
- [Requirements](#requirements)
- [Architecture](#architecture)
- [Installation](#installation)
- [Credits](#credits)


## Features

- [x] Create an account / login
- [x] Authentification with Facebook / Google
- [x] Create a task
- [x] Define the level / priority of the task 
- [x] Add peoples on 1 or more tasks
- [x] Add date for tasks
- [x] Delete tasks
- [x] Complete Documentation

## Dependency Manager

[CocoaPods](https://cocoapods.org/) is a dependency manager for Swift and Objective-C Cocoa projects. It has over 44 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.

We used :
- pod ['Alamofire'](https://github.com/Alamofire/Alamofire) - An HTTP Networking in Swift 
- pod ['Kingfisher'](https://github.com/onevcat/Kingfisher) - A library for downloading and caching images from the web.
- pod ['Hue'](https://github.com/hyperoslo/Hue) - A tools for the colors
- pod ['Firebase/Core'](https://cocoapods.org/pods/Firebase) - Simplify your iOS development, grow your user base, and monetize more
effectively with Firebase services.
- pod ['DZNEmptyDataSet'](https://github.com/Xiaoye220/EmptyDataSet-Swift) - A drop-in UITableView/UICollectionView superclass category for showing empty datasets whenever the view has no content to display. DZNEmptyDataSet with Swift.

## Documentation

We decided to use [Jazzy](https://github.com/realm/jazzy) for the documentation of our project. This allows to generate extensive documentation. This is in the "Document" folder.


## Requirements

- iOS 11
- Xcode 9.2
- Swift 4
- Portrait mode only

## Architecture

We decided to use the [MVVM architecture](https://msdn.microsoft.com/en-us/library/hh848246.aspx). MVVM is an architecture and a design method used in software engineering.
Appeared in 2004, MVVM is originally from Microsoft and adapted for application development. This method allows, like the model MVC (model-view-controller), to separate the view of logic and access to data by emphasizing the principles of binding and event.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build Alamofire 4.0+.

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 4.6'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

#### Swift 4

```swift
dependencies: [
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0")
]
```

## Credits

By [Serge Heitzler](https://github.com/heitzls), [Nicolas Ades](https://github.com/Idlic) and [Astrid Mancel](https://github.com/astriid)


