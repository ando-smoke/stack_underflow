class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      respond_to do |format|
        format.html do
          flash[:notice] = @question.title + " successfully created!"
          redirect_to questions_path
        end

        format.js do
          flash.now[:notice] = @question.title + " successfully created!"
        end
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js do
          flash.now[:alert] = "Error in new question entry. Try again."
        end
      end
    end
  end

  def show
    @question = Question.find(params[:id])
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
