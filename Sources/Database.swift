import MySQL

class DB {

  let host = "localhost"
  let user = "root"
  let password = ""
  let db = "todo_perfect"

  func insertData() {}

  func updateData() {}

  func fetchData() {
  
    let mysql = MySQL() // Create an instance of MySQL to work with
         
    let connected = mysql.connect(host: self.host, user: self.user, password: self.password, db: self.db)
         
    guard connected else {
        // verify we connected successfully
        print(mysql.errorMessage())
        return
    }
         
    defer {
        mysql.close() //This defer block makes sure we terminate the connection once finished, regardless of the result
    }
             
     // Run the Query (for example all rows in an options table)
    let querySuccess = mysql.query(statement: "SELECT  * FROM todo LIMIT 5")
    
    // make sure the query worked
    guard querySuccess else {
        return
    }

    print(querySuccess)
           
    
  }
}
