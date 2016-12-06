class ComplaintsController < ApplicationController
  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @complaint = Complaint.new(restaurant: @restaurant)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @complaint = current_user.complaints.build(complaint_params)
    @complaint.restaurant = @restaurant
    @complaint.save
    redirect_to @restaurant
  end

  def all
    @restaurant = Restaurant.find(params[:restaurant_id])
    @complaints = Complaint.where(restaurant: @restaurant)
  end

  def all_complaints
    @complaints = Complaint.all
  end

  private
    def complaint_params
      params.require(:complaint).permit(:body)
    end
end