fs = require 'fs'

module.exports = AtomSaveAll =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', "atom-save-all:saveAll", => @saveAll()

  deactivate: ->

  saveAll: ->
    current = atom.workspace?.getActiveEditor?()
    current ?= atom.workspace?.getActiveTextEditor?()
    if current? and current.getURI?()? and current.isModified?() and paneItem?.getPath?()? and (!fs.existsSync(paneItem.getPath()) or !fs.statSync(current.getPath()).isFile())
      current.save()

    for paneItem in atom.workspace.getPaneItems()
      if paneItem.getURI?()? and paneItem.isModified?() and paneItem?.getPath?()? and fs.existsSync(paneItem.getPath()) and fs.statSync(paneItem.getPath()).isFile()
        paneItem.save()
