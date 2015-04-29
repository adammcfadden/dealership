require 'sinatra'
require 'sinatra/reloader'
require './lib/vehicle'
also_reload './lib/*/**.rb'

get ('/') do
  erb (:index)
end

post('/clear_list') do
  @vehicles = Vehicle.clear()
  erb(:vehicles)
end

get ('/vehicles') do
  @vehicles = Vehicle.all()
  erb (:vehicles)
end

post('/vehicles') do
  make = params.fetch('add_make')
  model = params.fetch('add_model')
  year = params.fetch('add_year')
  new_vehicle = Vehicle.new(make, model, year)
  new_vehicle.save()
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/vehicle/:key') do
  @vehicle = Vehicle.find(params.fetch('key'))
  erb(:vehicle)
end

get ('/add_vehicle') do
  erb (:add_vehicle)
end
