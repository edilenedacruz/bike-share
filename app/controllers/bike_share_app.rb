class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

#--------------trip------------------
  get '/trips' do
    @trips = Trip.all
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
#--------------trip------------------


  #read - all
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
    erb:"/stations/dashboard"
  end

end
