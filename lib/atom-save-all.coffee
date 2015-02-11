module.exports = AtomSaveAll =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', "atom-save-all:saveAll", => @saveAll()

  deactivate: ->

  saveAll: ->
    for paneItem in atom.workspace.getPaneItems()
      if paneItem.getURI?()? and paneItem.isModified?()
        paneItem.save()
