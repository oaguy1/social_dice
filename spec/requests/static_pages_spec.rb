require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "index page" do
    before { visit root_path }
    
    it { should have_content "Social Dice" }
    it { should have_title "Social Dice" }
  end

  describe "help page" do
    before { visit help_path }

    it { should have_content "Help" }
    it { should have_title "Help " }
  end
end
