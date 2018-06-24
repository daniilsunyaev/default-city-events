class EventFilterForm
  constructor: (@el) ->
    @applyFilterRadioButton = @el.find("#js-apply-filter")
    @saveFilterRadioButton = @el.find("#js-save-filter")
    @loadFilterRadioButton = @el.find("#js-load-filter")

    @filterNameField = @el.find("#js-filter-name")
    @filterSelect = @el.find("#js-select-filter")
    @filterFields = @el.find("#js-filter-fields :input")
    @submitButton = @el.find(":submit")

    @applyFilterRadioButton.click @onApplyClick
    @saveFilterRadioButton.click @onSaveClick
    @loadFilterRadioButton.click @onLoadClick

    @applyFilterRadioButton.trigger("click")

  onApplyClick: (e) =>
    @el.attr("action", $(e.target).data("url"))
    @el.attr("method", $(e.target).data("method"))
    @filterNameField.prop("disabled", true)
    @filterFields.prop("disabled", false)
    @filterSelect.prop("disabled", true)
    @submitButton.prop("value", "Apply Filter")

  onSaveClick: (e) =>
    @el.attr("action", $(e.target).data("url"))
    @el.attr("method", $(e.target).data("method"))
    @filterNameField.prop("disabled", false)
    @filterFields.prop("disabled", false)
    @filterSelect.prop("disabled", true)
    @submitButton.prop("value", "Save Filter")

  onLoadClick: (e) =>
    @el.attr("action", $(e.target).data("url"))
    @el.attr("method", $(e.target).data("method"))
    @filterNameField.prop("disabled", true)
    @filterFields.prop("disabled", true)
    @filterSelect.prop("disabled", false)
    @submitButton.prop("value", "Filter With Selected")

$ ->
  if $(".js-filter-form").length > 0
    new EventFilterForm($ ".js-filter-form")
