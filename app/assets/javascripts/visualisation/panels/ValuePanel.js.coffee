class @ValuePanel extends @Panel
  constructor: (json, app, socket) ->
    super(json, app, socket, 'ValuePanel')

    @key = json.properties.key

    if !@key?
      throw "No key set for Value Panel."

    @title = json.properties.title
    @unit = json.properties.unit
    @currentValue = json.properties.default || 0
    
    @render()
    @socket.add_subscription(@key, this)
  update: (key, newValue) =>
    @currentValue = Math.round(newValue * 1000) / 1000
    newHtml = $(@template(@renderHash()))
    @html.replaceWith(newHtml)
    @html = newHtml
  renderHash: =>
    @mergeHashes super(), {value:this.currentValue, title:this.title, unit:this.unit}