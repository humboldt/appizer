class UI extends CMS
  @start: =>
    super
    @ready =>
      @init_nprogress()
      @init_lazyload()
      @init_cms_edit_mode()
      @init_main_navbar()
      @init_secondary_navbar()

  @init_nprogress: =>
    NProgress.configure showSpinner: false

  @init_lazyload: =>
    $('img').lazyload()

  @init_cms_edit_mode: =>
    $('.cms-add-action').addClass('glyphicon glyphicon-plus-sign')
    $('.cms-edit-action').addClass('glyphicon glyphicon-edit')
    if $('body').hasClass('cms-edit-mode')
      $('.cms-edit-mode-link').addClass('glyphicon glyphicon-eye-open')
    else
      $('.cms-edit-mode-link').addClass('glyphicon glyphicon-pencil')

  @init_main_navbar: =>
    $('.navbar-header[data-js-cms-sortable]').each ->
      $(this).on 'sortupdate', (event, ui) ->
        # move edit link after their corresponding sortable element
        sortables = $(this)
        sortables.children('[data-js-cms-sortable-id]').each ->
          sortable_link = $(this)
          unique_key_id = sortable_link.data_js()
          editable_link = sortables.children("[data-js-cms-editable-id=#{unique_key_id}]")
          editable_link.insertAfter(sortable_link)

  @init_secondary_navbar: =>
    $('.navbar-collapse [data-js-cms-sortable] li [data-js-cms-sortable-id]').each ->
      # move 'data-js-cms-sortable-id' attribute to its parent since the main sortable tag uses first level children
      unique_key_id = $(this).data_js('cms-sortable-id')
      sortable_link = $(this).parent()
      sortable_link.attr('data-js-cms-sortable-id', unique_key_id)
      $(this).removeAttr('data-js-cms-sortable-id')

      # move edit link within same li tag to make the links sortable together
      editable_link = $("[data-js-cms-editable-id=#{unique_key_id}]")
      sortable_link.html(sortable_link.html() + editable_link[0].outerHTML)
      editable_link.parent().remove()


window.UI = UI
