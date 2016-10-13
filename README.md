# Perfect Todo List Example

<img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
<img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
<img src="https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat" alt="License MIT">

![](screenshot.png)

A simple todo list written with Swift [Perfect](http://perfect.org).

This example illustrates how to create a simple todo list with Swift Perfect, persisting data on MySQL database.

Check out the [live demo](http://bit.ly/2ebnw8T) running on AWS ElasticBeanstalk.

## Installation

You should use [swiftenv](https://github.com/kylef/swiftenv).

Swift version: `DEVELOPMENT-SNAPSHOT-2016-09-05-a`

`swiftenv install`

To run local project:

`make run`

then setup your MySQL credentials on `Sources/Database.swift`

```swift
  let mysql = MySQL()
  let host = "127.0.0.1"
  let user = "root"
  let password = ""
  let db = "todo_perfect"
  let table = "todo"
```

so, just run:

`make run`

## License

[MIT License](http://vsouza.mit-license.org/) © Vinicius Souza
