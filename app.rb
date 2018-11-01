require 'sinatra'
require "sinatra/activerecord"

require "./models/post"

get '/' do
  @post = Post.first
  "#{@post.title} - #{@post.content}"
end
