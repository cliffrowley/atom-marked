exec = require("child_process").exec

{CompositeDisposable} = require 'atom'

module.exports = Marked =
  subscriptions: null

  config:
    application:
      type: 'string'
      default: 'Marked 2.app'

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-text-editor', 'marked:open': => @open()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  open: ->
    path = atom.workspace.getActiveTextEditor()?.buffer?.file?.path
    app  = atom.config.get('marked.application')

    exec "open -a \"#{app}\" \"#{path}\"" if path?
