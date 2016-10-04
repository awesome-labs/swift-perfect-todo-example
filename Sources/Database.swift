import MySQL

class DB {

  let host = "127.0.0.1"
  let user = "root"
  let password = ""
  let db = "todo_perfect"
  let table = "todo"

  func insertData(task: String) -> Bool {
  
    let status = 0
    let mysql = MySQL() // Create an instance of MySQL to work with
         
    let connected = mysql.connect(host: self.host, user: self.user, password: self.password, db: self.db)
         
    guard connected else {
        // verify we connected successfully
        print(mysql.errorMessage())
        return false
    }
         
    defer {
        mysql.close() //This defer block makes sure we terminate the connection once finished, regardless of the result
    }
             
     // Run the Query (for example all rows in an options table)
    print("INSERT INTO \(self.table) (task, status) VALUES ('\(task)', \(status))")
    return mysql.query(statement: "INSERT INTO \(self.table) (task, status) VALUES ('\(task)', \(status))")
  }

  func updateData() {}

  func fetchData() -> [[String: Any]]? {
  
    let mysql = MySQL() // Create an instance of MySQL to work with
         
    let connected = mysql.connect(host: self.host, user: self.user, password: self.password, db: self.db)
         
    guard connected else {
        // verify we connected successfully
        print(mysql.errorMessage())
        return nil
    }
         
    defer {
        mysql.close() //This defer block makes sure we terminate the connection once finished, regardless of the result
    }
             
     // Run the Query (for example all rows in an options table)
    let querySuccess = mysql.query(statement: "SELECT  * FROM todo")
    
    // make sure the query worked
    guard querySuccess else {
        return nil
    }

    let results = mysql.storeResults()!
    var resultArray = [[String:Any]]()

    while let row = results.next() {
        var item = [String: Any]()
        item["id"] = row[0]
        item["task"] = row[1]
        let status = row[2] == "1" ? "checked" : ""
        item["status"] = status
        resultArray.append(item)

    }
    return resultArray
  }
}
