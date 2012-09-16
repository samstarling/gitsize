require 'rubygems'
require 'github_api'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require './models'
require './helpers'

# 'sqlite:///db/gitsize.db' || 
#DB = 
set :database, ENV['HEROKU_POSTGRESQL_COPPER_URL']

GITHUB = {
  username: ENV['github_username'],
  password: ENV['github_password'],
  repo: 'samstarling.co.uk',
  path: '_posts',
  files: ['css', 'scss']
}

get '/' do
  @files = Gitcommitfile.all
  @config = GITHUB
  haml :index
end
