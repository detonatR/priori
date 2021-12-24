# frozen_string_literal: true

require_relative 'base_transformer'

module Priori
  module Transformers
    class DelimiterTransformer < BaseTransformer
      def process(row)
        return row if row.is_a? String

        record_hash(row).values.join(' ')
      end

      private

      def record_hash(row)
        {
          last_name: row[:last_name],
          first_name: row[:first_name],
          gender: row[:gender],
          birthday: row[:birthday],
          color: row[:color]
        }
      end
    end
  end
end
