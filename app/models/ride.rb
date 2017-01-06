class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    @user = self.user
    if @user.tickets < self.attraction.tickets && @user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif @user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif @user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      #update tickets
      @user.update(tickets: @user.tickets - self.attraction.tickets)
      #update happiness
      @user.update(happiness: @user.happiness + self.attraction.happiness_rating)
      #update nausea
      @user.update(nausea: @user.nausea + self.attraction.nausea_rating)
      "Thanks for riding the #{self.attraction.name}!"

    end
  end
end
