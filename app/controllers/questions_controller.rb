class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = @question.title + " successfully created!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @response = @question.responses.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = @question.title + " successfully updated!"
      redirect_to question_path(@question)
    else
      redirect_to :back
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "This question has been destroyed forever!"
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
