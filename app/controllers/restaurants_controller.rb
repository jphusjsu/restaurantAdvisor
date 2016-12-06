class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :is_admin?, only: [:edit, :update, :destroy, :hide, :display, :hidden]

  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      flash[:danger] = @restaurant.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path
  end

  def search
    @restaurants = Restaurant.search(params)
  end

  def hidden
    @restaurants = Restaurant.where(hidden: true)
  end

  def hide
    @restaurant = Restaurant.find(params[:id])
    @restaurant.write_attribute(:hidden, true)
    @restaurant.save
    flash[:notice] = @restaurant.name + " is now hidden!"
    redirect_to @restaurant
  end

  def display
    @restaurant = Restaurant.find(params[:id])
    @restaurant.write_attribute(:hidden, false)
    @restaurant.save
    flash[:notice] = @restaurant.name + " is now displayed!"
    redirect_to @restaurant
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :city, :state, :zipcode, :phone, :category_id)
    end

    def is_admin?
      if !current_user.try(:admin)
        flash[:danger] = "You are not authorized to do this!"
        redirect_to root_path
      end
    end

end