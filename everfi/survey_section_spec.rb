require 'spec_helper'

describe SurveySection do

  before(:each) do
    @survey = Factory(:survey)
    @attrs = {
      :title => "Survey Title",
      :description => "Survey Description",
    }
  end

  it "should create new instance given valid attributes" do
    @survey.survey_sections.create!(@attrs)
  end

  describe "survey association" do
    before(:each) do
      @survey_section = @survey.survey_sections.create(@attrs)
    end

    it "should respond to survey" do
      @survey_section.should respond_to(:survey)
    end

    it "should have the correct survey" do
      @survey_section.survey_id.should == @survey.id
      @survey_section.survey.should == @survey
    end
  end 
end
