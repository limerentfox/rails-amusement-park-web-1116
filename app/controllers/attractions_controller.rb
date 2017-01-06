class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)

    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
  end

  def show

    @attraction = Attraction.find(params[:id])
  end

  def destroy
  end

  def update_user

    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    flash[:message] = @ride.take_ride

    redirect_to user_path(@user)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
