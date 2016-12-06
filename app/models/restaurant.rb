class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :complaints
  belongs_to :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state, zipcode].join(', ')
  end

  def self.search(params)
    restaurants = Restaurant.where(hidden: false)
    restaurants = restaurants.where(category_id: params[:category].to_i) #TO-DO: change so category is optional
    restaurants = restaurants.where("name like ? or description like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%") if params[:keyword].present?
    begin
      restaurants = restaurants.near(params[:location], 15) if params[:location].present?
    rescue
      restaurants = []
    end
    #TO-DO: filter restaurants that are open
    restaurants
  end
end