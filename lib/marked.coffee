exec = require("child_process").exec

module.exports =
  activate: (state) ->
    atom.workspaceView.command "marked:open", => @openMarked()

  openMarked: ->
    path = atom.workspace.getActiveEditor().buffer?.file?.path
    exec "open -a Marked.app #{path}" if path?
