# frozen_string_literal: true

require_relative 'base_transformer'

module Priori
  module Transformers
    class GenderTransformer < BaseTransformer
      def process(row)
        row[:gender] = format_gender(row)
        row
      end

      private

      def format_gender(row)
        case row[:gender]
        when 'M' then 'Male'
        when 'F' then 'Female'
        else row[:gender]
        end
      end
    end
  end
end
