class EventFilterForm
  constructor: (@el) ->
    @applyFilterRadioButton = @el.find("#js-apply-filter")
    @saveFilterRadioButton = @el.find("#js-save-filter")
    @filterNameField = @el.find("#js-filter-name")
    @submitButton = @el.find(":submit")

    @applyFilterRadioButton.click @onApplyClick
    @saveFilterRadioButton.click @onSaveClick

    @applyFilterRadioButton.trigger("click")

  onApplyClick: (e) =>
    @el.attr("action", $(e.target).data("url"))
    @el.attr("method", $(e.target).data("method"))
    @filterNameField.prop("disabled", true)
    @submitButton.prop("value", "Apply Filter")

  onSaveClick: (e) =>
    @el.attr("action", $(e.target).data("url"))
    @el.attr("method", $(e.target).data("method"))
    @filterNameField.prop("disabled", false)
    @submitButton.prop("value", "Save Filter")

$ ->
  if $(".js-filter-form").length > 0
    new EventFilterForm($ ".js-filter-form")
