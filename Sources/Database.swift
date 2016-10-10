import MySQL

class DB {
  var mysql = MySQL()
  let host = "127.0.0.1"
  let user = "root"
  let password = ""
  let db = "todo_perfect"
  let table = "todo"
  var connected = false

  init()  {
    self.mysql = MySQL()
    self.connected = self.mysql.connect(host: self.host, user: self.user, password: self.password, db: self.db)
    if !self.connected {
        print(mysql.errorMessage())
    }
  }

  func insertData(task: String) -> Bool {
    let status = 0
    guard self.connected else {
        print(self.mysql.errorMessage())
        return false
    }
    return self.mysql.query(statement: "INSERT INTO \(self.table) (task, status) VALUES ('\(task)', \(status))")
  }

  func updateData(id: String?, status: Int) -> Bool {

    guard let taskId = id else {
      return false
    }
    return self.mysql.query(statement: "UPDATE \(self.table) SET status=\(status) WHERE id=\(taskId)")
  }

  func fetchData() -> [[String: Any]]? {

    let querySuccess = self.mysql.query(statement: "SELECT  * FROM todo ORDER BY id DESC LIMIT 10")
    guard querySuccess else {
        return nil
    }
    let results = self.mysql.storeResults()!
    var resultArray = [[String:Any]]()

    while let row = results.next() {
        var item = [String: Any]()
        item["id"] = row[0]
        item["task"] = row[1]
        item["status"] = row[2] == "1" ? "checked" : ""
        resultArray.append(item)
    }
    return resultArray
  }
}
