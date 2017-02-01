require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/conditions' do
    @conditions = Condition.paginate(:page => params[:page], :per_page => 30)
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:id], params[:condition])
    redirect "conditions/#{@condition.id}"
  end

  delete '/conditions/:id' do
    @condition = Condition.destroy(params[:id])
    redirect "conditions"
  end

  get '/weather-dashboard' do
    @conditions = Condition.all
    erb :"conditions/dashboard"
  end

  get '/trips' do
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    @trip = Trip.new
    erb :"trips/new"
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect "/trips"
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    erb:"/trips/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb:"stations/index"
  end

  #create - new station
  get '/stations/new' do
    @station = Station.new
    erb:"stations/new"
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  #read - one

  #update -one
  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb:"/stations/edit"
  end

  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb:"/stations/show"
  end

  #delete - one from show
  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

  #delete - one from index?

  #station-dashboard

  get '/station-dashboard' do
    @stations = Station.all
    @all_stations = Station.total_count_of_stations
    @average = Station.average_bikes_available_per_station
    @max_dock_count = Station.most_bikes_available_at_a_station
    @min_dock_count = Station.fewest_bikes_available_at_a_station
    @min_dock_name = Station.minimum_dock_count_name
    @max_dock_name = Station.maximum_dock_count_name
    @recent = Station.most_recently_installed_station
    @oldest = Station.oldest_station



    erb:"/stations/dashboard"
  end

end
