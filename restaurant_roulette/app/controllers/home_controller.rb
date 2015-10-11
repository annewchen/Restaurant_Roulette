def ping_yelp
    parameters = {term: params[:term], category_filter: params[:vegetarian],category_filter: params[:cuisine], radius_filter: params[:radius_filter]  }
    render json: Yelp.client.search('San Francisco', parameters)
  end
end
