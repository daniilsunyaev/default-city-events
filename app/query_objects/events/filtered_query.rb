module Events
  class FilteredQuery
    def initialize(options, relation = Event.all)
      @options = options || {}
      @relation = relation
    end

    def all
      by_town
    end

    private

    def by_town
      return @relation if town.blank?
      @relation.where(town: town)
    end

    def town
      @options[:town]
    end
  end
end
