class TestsController < ApplicationController
  def new
  	@test = Test.new
  end

  def create
  	@test = Test.new(params[:test])
    if @test.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def show
  	@test = Test.find(params[:id])
    @question = @test.questions.build
  end

  def complete
    @test = Test.find(params[:id])
    @results = Question.where("test_id = ?", @test.id)
    @results.each do |result|
      @tagpair = Tagpair.where("item = ?", result.win)
    end
  end
end