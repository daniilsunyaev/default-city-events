module Towns
  class EventsController < ApplicationController
    expose :town
    expose :events, from: :town

    def index
    end
  end
end
