require 'sinatra'
require "sinatra/activerecord"

require "./models/post"

get '/' do
  "Welcome to Sinatra App"
end

get '/posts' do
  @posts = Post.all

  erb :posts
end

get '/posts/new' do
  @post = Post.new

  erb :new_post
end

post '/posts' do
  @post = Post.new(params[:post])

  if @post.save
    redirect "/posts"
  else
    erb :new_post
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])

  erb :post_detail
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])

  erb :post_edit
end

put '/posts/:id' do
  @post = Post.find(params[:id])

  if @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  else
    erb :post_edit
  end
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/posts"
end