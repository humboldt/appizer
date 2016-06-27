class UI extends Nice.UI
  @start: =>
    super
    @Scope.ready =>
      'todo'

window.UI = UI
