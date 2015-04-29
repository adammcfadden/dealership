require 'sinatra'
require 'sinatra/reloader'
require './lib/vehicle'
require './lib/dealership'
also_reload './lib/*/**.rb'
require 'pry'

get ('/') do
  erb (:index)
end

post('/clear_list/:id') do
  dealership_specific = Dealership.find(params.fetch('id').to_i())
  @vehicles = dealership_specific.clear_cars()
  erb(:vehicles)
end


get ('/dealerships') do
  @dealerships = Dealership.all()
  erb (:dealerships)
end

get('/dealerships/new') do
  erb (:new_dealership)
end

post('/dealerships') do
  #put info here fetch's
  name = params.fetch('dealership_name')
  new_dealership = Dealership.new(name)
  new_dealership.save()
  @dealerships = Dealership.all()
  erb (:dealerships)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealership/:id/vehicles') do
  @id = params.fetch('id')
  dealership = Dealership.find(@id.to_i())
  @vehicles = dealership.cars()
  erb(:vehicles)
end

get('/dealership/:id/vehicle/new') do
  @id = params.fetch('id')
  erb(:add_vehicle)
end

post('/dealership/:id/vehicles') do
  @id = params.fetch('id')
  dealership = Dealership.find(@id.to_i())
  make = params.fetch('add_make')
  model = params.fetch('add_model')
  year = params.fetch('add_year')
  new_car = Vehicle.new(make, model, year)
  new_car.save()
  dealership.add_vehicle(new_car)
  @vehicles = dealership.cars()
  erb(:vehicles)
end

#need /dealership/:dealer_id/vehicles/:car_id route to view car info
