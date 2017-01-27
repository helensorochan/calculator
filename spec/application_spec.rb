require 'spec_helper'
require File.expand_path '../../application.rb', __FILE__

describe 'Application' do
  it 'should show page with form' do
    get '/'
    expect(last_response.body).to include('Calculator')
  end

  it 'should show empty result' do
    post '/credit'
    expect(last_response.body).to include('There is nothing to display')
  end
end