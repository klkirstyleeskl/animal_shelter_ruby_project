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

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb( :"owners/show" )
end

post'/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

get '/owners/:id/edit' do
  @pet= Pet.all()
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Owner.find( params[:id])
  owner.delete
  redirect to '/owners'
end
