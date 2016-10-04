import PerfectLib
import PerfectHTTP
import PerfectMustache

var dbHandler = DB()

struct IndexHandler: MustachePageHandler{


  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    var values = MustacheEvaluationContext.MapType()
    values["title"] = "Perfect Todo Example"
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
    var values = MustacheEvaluationContext.MapType()
    values["title"] = "Perfect Todo Example"
    values["added"] = "Task added!"
    values["tasks"] = dbHandler.fetchData()
    let request = contxt.webRequest
    if let taskName = request.param(name: "task_name"){
      values["task-name"] = taskName
      let _ = dbHandler.insertData(task: taskName)
    }
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
    var values = MustacheEvaluationContext.MapType()
    values["title"] = "Perfect Todo Example"
    values["added"] = "Task added!"
    let request = contxt.webRequest
    if let taskName = request.param(name: "task_name"){
      values["task-name"] = taskName
    }
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
