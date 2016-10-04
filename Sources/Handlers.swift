import PerfectLib
import PerfectHTTP
import PerfectMustache



struct IndexHandler: MustachePageHandler{

  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    let dbHandler = DB()
    var values = MustacheEvaluationContext.MapType()
    values["tasks"] = dbHandler.fetchData()
    contxt.extendValues(with: values)
    do {
  			try contxt.requestCompleted(withCollector: collector)
  	} catch {
  			let response = contxt.webResponse
  			response.status = .internalServerError
  			response.appendBody(string: "\(error)")
  			response.completed()
  	}
  }
}

struct NewTaskHandler: MustachePageHandler{

  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    let dbHandler = DB()
    let request = contxt.webRequest
    var values = MustacheEvaluationContext.MapType()
    if let taskName = request.param(name: "task_name"){
      values["task-name"] = taskName
      let _ = dbHandler.insertData(task: taskName)
    }
    values["tasks"] = dbHandler.fetchData()
    contxt.extendValues(with: values)
    do {
  			try contxt.requestCompleted(withCollector: collector)
  	} catch {
  			let response = contxt.webResponse
  			response.status = .internalServerError
  			response.appendBody(string: "\(error)")
  			response.completed()
  	}
  }
}

struct TaskDoneHandler: MustachePageHandler{

  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    let dbHandler = DB()
    let request = contxt.webRequest
    let taskId = request.param(name: "id")
    var taskStatus: Int?
    if let status = request.param(name: "status") {
      taskStatus = Int(status)
    }
    let _ = dbHandler.updateData(id: taskId, status: taskStatus!)
    var values = MustacheEvaluationContext.MapType()
    values["tasks"] = dbHandler.fetchData()
    contxt.extendValues(with: values)
    do {
  			try contxt.requestCompleted(withCollector: collector)
  	} catch {
  			let response = contxt.webResponse
  			response.status = .internalServerError
  			response.appendBody(string: "\(error)")
  			response.completed()
  	}
  }
}
