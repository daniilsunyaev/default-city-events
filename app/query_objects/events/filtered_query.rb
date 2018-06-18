module Events
  class FilteredQuery
    def initialize(options, relation = Event.all)
      @options = options || {}
      @relation = relation
    end

    def all
      by_town
      by_min_starts_at
      by_max_starts_at
    end

    private

    def by_town
      return @relation if town.blank?
      @relation = @relation.where(town: town)
    end

    def by_min_starts_at
      return @relation if min_starts_at.blank?
      @relation = @relation.where("starts_at > ?", min_starts_at)
    end

    def by_max_starts_at
      return @relation if max_starts_at.blank?
      @relation = @relation.where("starts_at < ?", max_starts_at)
    end

    def town
      @options[:town] || filter && filter.town
    end

    def max_starts_at
      @options[:max_starts_at] || filter && filter.max_starts_at
    end

    def min_starts_at
      @options[:min_starts_at] || filter && filter.min_starts_at
    end

    def filter
      @options[:filter]
    end
  end
end
