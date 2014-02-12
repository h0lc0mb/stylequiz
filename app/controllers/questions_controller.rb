class QuestionsController < ApplicationController
  def create
  	@test = Test.find(params[:test_id])
  	@question = @test.questions.build(params[:question])
  	if @question.save
  		redirect_to @test
  	else
  		redirect_to root_url
  	end
  end

  def destroy
  end
end