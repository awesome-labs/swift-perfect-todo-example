# Perfect Todo List Example

<img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
<img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
<img src="https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat" alt="License MIT">

![](screenshot.png)

A simple todo list written with Swift [Perfect](http://perfect.org).

This example illustrates how to create a simple todo list with Swift Perfect, persisting data on MySQL database.

Check out the [live demo](http://bit.ly/2ebnw8T) running on AWS ElasticBeanstalk.

## Installation

It's recommended to use Swift 3.0.1

then setup your MySQL credentials on `Sources/Database.swift`

```swift
  let mysql = MySQL()
  let host = "127.0.0.1"
  let user = "root"
  let password = ""
  let db = "todo_perfect"
  let table = "todo"
```


`database.sql` file has instructions to create database and tables with sample data:

example: `mysql -u yourusername -p yourpassword yourdatabase
< database.sql `

after all, just run:

`make run`

## License

[MIT License](http://vsouza.mit-license.org/) © Vinicius Souza
