require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/owner.rb')
also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index" )
end

get '/owners/new' do
  @pets = Pet.all()
  erb(:"owners/new")
end

post'/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb( :"owners/show" )
end
