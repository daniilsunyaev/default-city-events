module Events
  class MatchingFiltersQuery
    def initialize(event, relation = Filter.all)
      @event = event
      @relation = relation
    end

    def all
      by_topic
      by_town
      by_min_starts_at
      by_max_starts_at
    end

    private

    def by_topic
      @relation = @relation.where(topic_id: topics_ids)
    end

    def by_town
      @relation = @relation.where(town_id: town_ids)
    end

    def by_min_starts_at
      return @relation if @event.starts_at.blank?
      @relation = @relation
        .where("min_starts_at < ?", @event.starts_at)
        .or(
          @relation.where(min_starts_at: nil)
        )
    end

    def by_max_starts_at
      return @relation if @event.starts_at.blank?
      @relation = @relation
        .where("max_starts_at > ?", @event.starts_at)
        .or(
          @relation.where(max_starts_at: nil)
        )
    end

    def topics_ids
      @topics_ids ||= @event.topics.pluck(:id).push(nil).uniq
    end

    def town_ids
      @town_ids ||= [@event.town.id, nil]
    end
  end
end
