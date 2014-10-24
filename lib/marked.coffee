exec = require("child_process").exec

module.exports =
  config:
    application:
      type: 'string'
      default: 'Marked 2.app'
  activate: (state) ->
    atom.workspaceView.command "marked:open", => @openMarked()

  openMarked: ->
    path = atom.workspace.getActiveEditor().buffer?.file?.path
    app = atom.config.get('marked.application')
    exec "open -a \"#{app}\" \"#{path}\"" if path?
