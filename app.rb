require 'sinatra'
require 'sinatra/reloader'
require './lib/vehicle'
require './lib/dealership'
also_reload './lib/*/**.rb'
require 'pry'

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
