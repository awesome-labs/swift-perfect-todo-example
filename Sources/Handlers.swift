import PerfectLib
import PerfectHTTP
import PerfectMustache

struct IndexHandler: MustachePageHandler{

  func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
    var values = MustacheEvaluationContext.MapType()
    values["title"] = "Perfect Todo Example"
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
