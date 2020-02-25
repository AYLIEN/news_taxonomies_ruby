# frozen_string_literal: true

require 'json'
module Taxonomy
  class IPTC
    attr_accessor :lookup_hash

    def initialize
      json_file_pwd = File.expand_path('iptc.json', File.dirname(__FILE__))
      @lookup_hash = JSON.parse(IO.read(json_file_pwd))
    end

    def lookup(string)
      is_iptc = string[0..1].upcase.eql?('iptc')
      is_iptc ? iptc_to_desc(string) : desc_to_iptc(string)
    end

    def iptc_to_desc(iptc)
      result = @lookup_hash.find { |i| i['code'].eql?(iptc) }
      result.nil? ? iptc : result['desc']
    end

    def desc_to_iptc(desc)
      result = @lookup_hash.invert.find { |i| i['desc'].eql?(desc) }
      result.nil? ? desc : result['code']
    end
  end
end