class SC.Controllers.Users
  constructor: (@params) ->

  show: ->
    $(".inspector pre").each (i, el) ->
      new InspectorJSON(element: el)
