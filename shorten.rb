#!/usr/bin/ruby

require 'uri'

class Shorten
  attr_accessor :input

  def initialize(input=nil)
    @input = input
  end

  def asin(input)
    path=URI(input).path
    if s=path.match(/tg\/[^\/]*\/(\-)\/([^\/]*)/) || path.match(/\/(product|ASIN|dp)\/+([^\/]*)/)
      s[2]
    end
  end

  def result
    "http://amzn.com/#{asin(input)}"
  end

  def self.result(input)
    new(input).result
  end
end

if __FILE__ == $0
  puts Shorten.result(ARGV[0]||"{query}")
end
