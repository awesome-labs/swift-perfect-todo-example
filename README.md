# Perfect Todo List Example

<img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
<img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
<img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
<img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="vsouza Twitter">

![](screenshot.png)

A simple todo list written with Perfect.

This example illustrates how to create a simple todo list with Swift Perfect, persisting data on MySQL database.

## Installation

You should use [swiftenv](https://github.com/kylef/swiftenv).

`swiftenv install`

then setup your MySQL credentials on Database.swift

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

## MySQL

The `database.sql` file contains Database structure.

## License

[MIT License](http://vsouza.mit-license.org/) © Vinicius Souza
