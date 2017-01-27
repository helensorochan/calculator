require 'sinatra'

module Credit
  class Base
    attr_reader :total, :percent, :type, :term, :calculations

    def initialize(options)
      @total = options[:total].to_f
      @percent = options[:percent].to_f
      @type = options[:type]
      @term = options[:term].to_i
      @calculations = []
    end

    def obtain
      return obtained?
    end

    private

    def obtained?
      total*percent*term != 0
    end
  end
end