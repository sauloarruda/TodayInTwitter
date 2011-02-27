require 'spec_helper'
require 'main'

describe 'GET /' do  
  it 'it should have a form with fields for username, list and period' do
    visit '/'
    response.should have_selector('input', :name => 'username')
    response.should have_selector('input', :name => 'list')
    response.should have_selector('input', :name => 'period_start')
    response.should have_selector('input', :name => 'period_end')
    response.should have_selector('button', :name => 'commit')
  end
end
