class QuestionsController < ApplicationController
  def create
  	@test = Test.find(params[:test_id])
  	@question = @test.questions.build(params[:question])
  	if @question.save
      if Question.where("test_id == ? ", @question.test_id).count<20
  		  redirect_to @test
      else
        redirect_to test_complete_path(id: @test)
      end
  	else
  		redirect_to root_url
  	end
  end

  def destroy
  end
end