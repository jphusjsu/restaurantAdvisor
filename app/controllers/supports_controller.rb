class SupportsController < ApplicationController
  before_action :is_admin?, only: [:all]

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(supports_params)
    if @support.save
      redirect_to root_path
    else
      flash[:danger] = @support.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def all
    @supports = Support.all
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    redirect_to all_supports_path
  end

  private
    def supports_params
      params.require(:support).permit(:name, :body)
    end

    def is_admin?
      if !current_user.try(:admin)
        flash[:danger] = "You are not authorized to do this!"
        redirect_to root_path
      end
    end
end