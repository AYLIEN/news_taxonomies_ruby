# frozen_string_literal: true

require 'json'
module Taxonomy
  class IABQTG
    attr_accessor :lookup_hash

    def initialize
      json_file_pwd = File.expand_path('iab-qtg.json', File.dirname(__FILE__))
      @lookup_hash = JSON.parse(IO.read(json_file_pwd))
    end

    def lookup(string)
      is_iab = string[0..2].upcase.eql?('IAB')
      is_iab ? iab_to_desc(string) : desc_to_iab(string)
    end

    def iab_to_desc(iab)
      result = @lookup_hash.find { |i| i['iab_code'].eql?(iab) }
      result.nil? ? iab : result['desc']
    end

    def desc_to_iab(desc)
      result = @lookup_hash.find { |i| i['desc'].eql?(desc) }
      result.nil? ? desc : result['iab_code']
    end
  end
end