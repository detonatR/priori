# frozen_string_literal: true

require 'English'

module Priori
  module Destinations
    class TextfileDestination
      def self.process(rows)
        destination = new
        rows.each { |row| destination.write(row) }
        destination.close
      end

      def initialize(filename: 'output.txt')
        @file = File.open(filename, 'w')
      end

      def write(row)
        @file << row
        @file.write $INPUT_RECORD_SEPARATOR.to_s
        print '.'
      end

      def close
        @file.close
        puts 'Finished parsing data'
      end
    end
  end
end
