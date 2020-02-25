# frozen_string_literal: true

require 'json'
module NewsTaxonomy
  class IPTC
    attr_accessor :lookup_hash

    def initialize
      json_file_pwd = File.expand_path('iptc.json', File.dirname(__FILE__))
      @lookup_hash = JSON.parse(IO.read(json_file_pwd))
    end

    def lookup(key)
      is_iptc = key.is_a?(Integer)
      is_iptc ? iptc_to_desc(key) : desc_to_iptc(key)
    end

    def iptc_to_desc(iptc)
      result = @lookup_hash.find { |i| i['code'].eql?(iptc) }
      result.nil? ? iptc : result['desc']
    end

    def desc_to_iptc(desc)
      result = @lookup_hash.find { |i| i['desc'].eql?(desc) }
      result.nil? ? desc : result['code']
    end
  end
end
