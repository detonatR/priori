# frozen_string_literal: true

module Priori
  module Sources
    class BaseSource
      def initialize(source)
        @rows = File.read(File.dirname(__FILE__) + "/files/#{source}").split("\n")
      end

      def process
        records = []

        @rows.each do |row|
          hash = {}
          attributes = attributes_from(row)
          attributes.each_with_index do |attribute, index|
            hash[columns[index]] = attribute
          end

          records << hash
        end

        records
      end

      private

      def attributes_from(*)
        'implement me!'
      end

      def columns
        'implement me!'
      end
    end
  end
end
