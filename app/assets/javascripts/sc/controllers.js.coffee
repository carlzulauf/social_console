class SC.Controllers
  @load: (params) ->
    params = params || SC.Controllers.params
    if SC.Controllers[params.controller]
      console.log "Loading #{params.controller} controller"
      SC.controller = new SC.Controllers[params.controller](params)
      action = SC.controller[params.action]
      action() if action

$ ->
  SC.Controllers.load()
