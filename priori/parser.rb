# frozen_string_literal: true

require_relative 'sources/comma_source'
require_relative 'sources/pipe_source'
require_relative 'sources/space_source'

require_relative 'transformers/date_transformer'
require_relative 'transformers/gender_transformer'
require_relative 'transformers/aggregations_transformer'
require_relative 'transformers/delimiter_transformer'

require_relative 'destinations/textfile_destination'

module Priori
  class Parser
    def self.process
      new.process
    end

    def initialize
      @records = []
    end

    def process
      source Sources::CommaSource, 'comma_delimited.txt'
      source Sources::PipeSource, 'pipe_delimited.txt'
      source Sources::SpaceSource, 'space_delimited.txt'

      transform Transformers::DateTransformer
      transform Transformers::GenderTransformer
      transform Transformers::AggregationsTransformer, aggregate: true
      transform Transformers::DelimiterTransformer

      destination Destinations::TextfileDestination
    end

    private

    def source(source, filename)
      @records << source.new(filename).process
      @records = @records.flatten!
    end

    def transform(transformer, opts = {})
      @records = transformer.process(@records, opts)
    end

    def destination(destination)
      destination.process(@records)
    end
  end
end
