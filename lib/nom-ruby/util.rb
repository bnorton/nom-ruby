module Nom
  class Util
    def self.page(options)
      start = options[:start].present? ? options[:start] : 0
      limit = options[:limit].present? ? options[:limit] : 15
      start = 0 if start < 0
      [start, limit]
    end
  end
end