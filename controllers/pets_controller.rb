require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/pet.rb')
also_reload( '../models/*' )

get '/pets' do
  @pets = Pet.all()
  erb (:"pets/index" )
end

get '/pets/new' do
  erb(:"pets/new")
end

get '/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb( :"pets/show" )
end

post '/pets' do # create
  @pet = Pet.new( params )
  @pet.save()
  redirect to '/pets'
end

get '/pets/:id/edit' do
  @owners = Owner.all()
  @pet = Pet.find(params['id'])
  erb(:"pets/edit")
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to "/pets"
end

post '/pets/:id/delete' do
  pet = Pet.find( params[:id])
  pet.delete
  redirect to '/pets'
end
