require 'spec_helper'

describe "StaticPages" do

  subject { page }
  
  describe "index page" do
    before { visit root_path }
    
    it { should have_content "Social Dice" }
    it { should have_title "Social Dice" }
  end
end
