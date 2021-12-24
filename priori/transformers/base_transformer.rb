# frozen_string_literal: true

module Priori
  module Transformers
    class BaseTransformer
      def self.process(rows, opts = {})
        transformer = new

        if opts[:aggregate]
          transformer.batch_process(rows)
        else
          rows.map { |row| transformer.process(row) }
        end
      end

      def process(*)
        'implement me!'
      end

      def batch_process(*)
        'implement me for aggregates!'
      end
    end
  end
end
