class FiltersController < ApplicationController
  expose :filter, parent: :current_user

  def create
    filter.save
    respond_with filter, location: events_path(filter_id: filter.id)
  end

  private

  def filter_params
    params.require(:filter).permit(
      :town_id,
      :name,
      :topic_id,
      :max_starts_at,
      :min_starts_at
    )
  end
end
