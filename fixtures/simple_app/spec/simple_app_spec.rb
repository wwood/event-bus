require 'spec_helper'

describe SimpleApp do
  it 'has a version number' do
    expect(SimpleApp::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
