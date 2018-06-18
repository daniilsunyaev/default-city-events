module Towns
  class EventsController < ApplicationController
    expose :towns
    expose :town
    expose :events, from: :town
    expose :filter, id: :filter_id

    def index
    end
  end
end
