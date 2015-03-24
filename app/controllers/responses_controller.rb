class ResponsesController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @response = @question.responses.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.new(response_params)
    if @response.save
      UserMailer.response_notification(@question).deliver
      flash[:notice] = "Thank you for your answer."
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = @question.responses.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @response = @question.responses.find(params[:id])
    if @response.update(response_params)
      flash[:notice] = "Your response has been updated."
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @response = @question.responses.find(params[:id])
    @response.destroy
    flash[:notice] = "Your response has been deleted."
    redirect_to question_path(@question)
  end

  private
    def response_params
      params.require(:response).permit(:answer, :user_id)
    end
end
