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
    @count = Question.where("test_id = ?", @test.id).count
  end

  def complete
    @test = Test.find(params[:id])
    @results = Question.where("test_id = ?", @test.id)
    
    @win_tagpair_array = Array.new
    @results.each do |result|
      @win_tagpair = Tagpair.where("item = ?", result.win)
      @win_tagpair.each do |tagpair|
        @win_tagpair_array.push tagpair.tag_a + " & " + tagpair.tag_b
      end
    end

    @lose_tagpair_array = Array.new
    @results.each do |result|
      @lose_tagpair = Tagpair.where("item = ?", result.lose)
      @lose_tagpair.each do |tagpair|
        @lose_tagpair_array.push tagpair.tag_a + " & " + tagpair.tag_b
      end
    end
    
    @win_counts = Array.new
    @win_tagpair_array.each do |tagpair|
      @win_counts.push @win_tagpair_array.count(tagpair)
    end
    @lose_counts = Array.new
    @lose_tagpair_array.each do |tagpair|
      @lose_counts.push @lose_tagpair_array.count(tagpair)
    end

    @tagpair_array = Array.new
    @net_counts = Array.new
    @win_tagpair_array.each do |tagpair|
      if !@tagpair_array.include?(tagpair)
        @tagpair_array.push tagpair
        @net = @win_counts[@win_tagpair_array.index(tagpair)]
        if @lose_tagpair_array.include?(tagpair)
          @net = @net - @lose_counts[@lose_tagpair_array.index(tagpair)]
        end
        @net_counts.push @net
      end
    end

    @max_tagpairs = Array.new
    @tagpair_array.each do |tagpair|
      if @net_counts[@tagpair_array.index(tagpair)] > @net_counts.max - 2 && @tagpair_array.count(tagpair) > 0
        if !@max_tagpairs.include?(tagpair)
          @max_tagpairs.push(tagpair)
        end
      end
    end

    @recs = Array.new
    @max_tagpairs.each do |tagpair|
      tags = tagpair.split(" ")
      tag_a = tags.first
      tag_b = tags.last
      @rec_items = Tagpair.where("tag_a = ? and tag_b = ?", tag_a, tag_b)
      @rec_items.each do |rec_item|
        @recs.push rec_item.item
      end
    end
    @recs.shuffle!

    @winners = Array.new
    @results.each do |result|
      if !@winners.include?(result.win)
        @winners.push result.win
      end
    end

    @extras = Array.new
    @winners.each do |winner|
      if !@recs.include?(winner)
        @extras.push winner
      end
    end
    @extras.shuffle!
  end
end






