# frozen_string_literal: true

require_relative 'base_transformer'

module Priori
  module Transformers
    class DateTransformer < BaseTransformer
      DATE_FORMAT = '%m/%d/%Y'

      def process(row)
        row[:birthday] = format_date(row)
        row
      end

      private

      def format_date(row)
        formatted = row[:birthday].gsub('-', '/')
        date = Date.strptime(formatted, DATE_FORMAT)
        date.strftime(DATE_FORMAT)
      end
    end
  end
end
