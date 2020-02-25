# frozen_string_literal: true

require 'test_helper'

describe NewsTaxonomy do
  let(:iab_qtg) { NewsTaxonomy::IABQTG.new }
  let(:iptc) { NewsTaxonomy::IPTC.new }

  it 'will have a version' do
    refute_nil ::NewsTaxonomy::VERSION
  end

  # IPTC
  it 'will convert IPTC to English' do
    iptc.lookup(17_005_000).must_equal('warning')
  end

  it 'will convert English to IPTC' do
    iptc.lookup('warning').must_equal(17_005_000)
  end

  # IAB QTG
  it 'will convert IAB QTG to English' do
    iab_qtg.lookup('IAB25').must_equal('Non-Standard Content')
  end

  it 'will convert English to IAB QTG' do
    iab_qtg.lookup('Non-Standard Content').must_equal('IAB25')
  end
end
