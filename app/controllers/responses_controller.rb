class ResponsesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.new(response_params)
    if @response.save
      flash[:notice] = "Thank you for your answer."
    else
      flash[:alert] = "Your answer did not submit. Try again."
    end
    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = @question.responses.find(params[:id])
  end


  private
    def response_params
      params.require(:response).permit(:answer)
    end


end
