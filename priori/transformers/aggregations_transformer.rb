# frozen_string_literal: true

require_relative 'base_transformer'
require 'date'

module Priori
  module Transformers
    class AggregationsTransformer < BaseTransformer
      def batch_process(rows)
        sorted = []
        sorted << aggregate_by_gender_and_last_name(rows)
        sorted << aggregate_by_birthday(rows)
        sorted << aggregate_by_last_name(rows)
        sorted.flatten!
      end

      def aggregate_by_gender_and_last_name(rows)
        rows = rows.sort_by do |row|
          [
            row[:gender],
            row[:last_name]
          ]
        end

        rows.prepend 'Output 1:'
      end

      def aggregate_by_birthday(rows)
        rows = rows.sort_by { |row| parse_epoch_seconds(row) }
        rows.prepend 'Output 2:'
        rows.prepend ' '
      end

      def aggregate_by_last_name(rows)
        rows = rows.sort_by { |row| row[:last_name] }.reverse
        rows.prepend 'Output 3:'
        rows.prepend ' '
      end

      private

      def parse_epoch_seconds(row)
        date = Date.strptime(row[:birthday], DateTransformer::DATE_FORMAT)
        date.to_time.to_i
      end
    end
  end
end
