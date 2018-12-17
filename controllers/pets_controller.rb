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
  @pets = Pet.find(params['id'].to_i)
  erb( :"pets/show" )
end



# post'/pets/' do
#   @new_pet = Pet.new(params)
#   @new_pet.save()
#   erb(:create)
# end
