# frozen_string_literal: true

require_relative 'base_source'

module Priori
  module Sources
    class PipeSource < BaseSource
      private

      def attributes_from(row)
        row.split(' | ')
      end

      def columns
        %i[
          last_name
          first_name
          middle_initial
          gender
          color
          birthday
        ]
      end
    end
  end
end
