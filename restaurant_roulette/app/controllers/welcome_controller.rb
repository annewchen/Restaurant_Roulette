class WelcomeController < ApplicationController
  def index
    p "*************"
    p "Hello world"
    ping_yelp
  end

  private
  def ping_yelp(is_fancy, category_filter, radius_filter, location)
    p "Inside ping yelp"
    term = ""
    if is_fancy
      term = "expensive restaurants"
    else
      term = "cheap restaurants"
    end
    params = { term: term,
           category_filter: category_filter,
           radius_filter: radius_filter,
           sort: '2',
         }
    @response = Yelp.client.search(location, params)
    @chosen_restaurant = @response.businesses.sample
    @chosen_restaurant_details = {"name" => @chosen_restaurant.name, "phone" => @chosen_restaurant.phone, "address" => @chosen_restaurant.location.address[0]}
    p @chosen_restaurant_details
  end
end


#

