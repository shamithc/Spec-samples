require 'spec_helper'

describe Response do
  before(:each) do
    @response_set = Factory(:response_set)
    @question = Factory(:question)
    @answer = Factory(:answer)
    @attr = {
      :string_value => "This is my name",
      :integer_value => 10,
      :float_value => 10.5,
      :answer_id => @answer.id,
      :question_id => @question.id
    }
  end

  it "should create an instance given valid attrs" do
    @response_set.responses.create! @attr
  end

  it "should require a response_set" do
    no_rs_res = Response.new @attr
    no_rs_res.should_not be_valid
  end

  it "should require an answer" do
   no_answer_res = @response_set.responses.build @attr.merge(:answer_id => nil)
   no_answer_res.should_not be_valid
  end

  it "should require a question" do
    no_question_res = @response_set.responses.build @attr.merge(:question_id => nil)
    no_question_res.should_not be_valid
  end

  it "should require integer_value to be a integer number" do
    @response_set.responses.build(@attr.merge(:integer_value => 9.5)).
      should_not be_valid
  end

  it "should require float_value to be a float number" do
    @response_set.responses.build(@attr.merge(:float_value => "not a float")).
      should_not be_valid
  end

  describe "response_set associations" do
    before(:each) do
      @response = @response_set.responses.create! @attr
    end

    it "should respond to .response_set" do
      @response.should respond_to(:response_set)
    end

    it "should have the correct response_set" do
      @response.response_set_id.should == @response_set.id
      @response.response_set.should == @response_set
    end
  end

  describe "answer associations" do
    before(:each) do
      @response = Factory(:response,
                          :response_set => @response_set,
                          :answer => @answer)
    end

    it "should respond to .answer" do
      @response.should respond_to(:answer)
    end

    it "should have the correct answer" do
      @response.answer_id.should == @answer.id
      @response.answer.should == @answer
    end
  end

  describe "question associations" do
    before(:each) do
      @response = Factory(:response,
                          :response_set => @response_set,
                          :question => @question)
    end

    it "should respond to .question" do
      @response.should respond_to(:question)
    end

    it "should have the correct question" do
      @response.question_id.should == @question.id
      @response.question.should == @question
    end
  end
end

# This part is used to test all model level methods for response
describe "model level methods for Response" do 
  before(:each) do 
    # @survey = FactoryGirl.create(:survey)
    @survey = Factory(:survey)
    @user1 = Factory(:user_k12_student) 
    @user2 = Factory(:user_k12_student)
    @response_set1 = Factory(:response_set,
                    user_id: @user1.id,
                    survey_id: @survey.id)
    @response_set2 = Factory(:response_set,
                    user_id: @user2.id,
                    survey_id: @survey.id)
    @survey_section = Factory(:survey_section,
                      survey_id: @survey.id)
    @question = Factory(:question,
                        survey_section_id: @survey_section.id,
                        display_type: "radio")
    @answer1 = Factory(:answer,
                        question_id: @question.id)
    @answer2 = Factory(:answer,
                        question_id: @question.id)
  end

  # To test the method "update_assesment_analytics"
  xit "should calculate assessment percentage" do 
    Response.create!(:answer_id => @answer1.id, :question_id => @question.id, :response_set_id => @response_set1.id)
    @updated_answer1 = Answer.find(@answer1.id)
    @updated_answer1.assessment_percentage.should eql 100
    Response.create!(:answer_id => @answer2.id, :question_id => @question.id, :response_set_id => @response_set2.id)
    @updated_answer2 = Answer.find(@answer2.id)   
    @updated_answer2.assessment_percentage.should eql 50
  end

end
