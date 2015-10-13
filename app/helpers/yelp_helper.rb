module YelpHelper
  def YelpHelper.ping_yelp(is_fancy, category_filter, radius_filter, is_vegetarian, location)
    p "Inside ping yelp"
    params = {sort:'2'}

    term = "restaurants"
    if is_fancy == true
      term = "expensive restaurants"
    elsif is_fancy == false
      term = "cheap restaurants"
    end
    params[:term] = term

    if radius_filter != nil
      params[:radius_filter] = radius_filter
    end

    if category_filter != nil
      params[:category_filter] = category_filter
    end

    if is_vegetarian == true
      if params[:category_filter]
        params[:category_filter] += ",vegetarian"
      else
        params[:category_filter] = "vegetarian"
      end
   end


    # params = { term: "restaurants",
    #        category_filter: "thai",
    #        radius_filter: "1000",
    #        sort: '2'
    #         }

   p params
   p location
    @response = Yelp.client.search(location, params)
    @chosen_restaurant = @response.businesses.sample
    @response.businesses.each do |business|
      p business.phone
    end

    @chosen_restaurant_details = {
      "name" => @chosen_restaurant.name,
      "phone" => @chosen_restaurant.phone,
      "address" => @chosen_restaurant.location.address[0]
    }
    p "chosen restaurent details: #{@chosen_restaurant_details}"
    @chosen_restaurant_details
  end
end
