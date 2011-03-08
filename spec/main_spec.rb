require 'spec_helper'
require 'main'

describe 'GET /' do  
  it 'should have a form with fields for username, list and period' do
    visit '/'
    response.should have_selector('form',   :action => '/timeline')
    response.should have_selector('input',  :name => 'username')
    response.should have_selector('input',  :name => 'list')
    response.should have_selector('input',  :name => 'period_start')
    response.should have_selector('input',  :name => 'period_end')
    response.should have_selector('button', :name => 'commit')
  end
end

describe 'POST /timeline' do
  it 'should receive username, list, period start and end parameters' do
    visit '/'
    username, list, period_start, period_end = 'jerasoftware', 'equipe', '2010-02-18', '2010-02-24'
    fill_in :username,      :with => username
    fill_in :list,          :with => list
    fill_in :period_start,  :with => period_start
    fill_in :period_end,    :with => period_end
    submit_form 'form'
    timeline = mock()
    Timeline.stub!(:new).and_return(timeline)
    Timeline.should_receive(:new).with(username, list, period_start, period_end)
    #timeline.should_receive(:each)
  end
end
