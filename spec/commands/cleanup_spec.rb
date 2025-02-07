require 'spec_helper'
require 'command_helper'

describe "Invoking the 'mina deploy:cleanup' command" do
  before :each do
    Dir.chdir root('test_env')
  end

  it "should cleanup old deployments", :ssh => true do
    3.times { mina 'deploy' }

    mina 'deploy:cleanup'

    Dir["deploy/releases/*"].length.should == 2
  end
end
