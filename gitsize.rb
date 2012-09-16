require 'rubygems'
require 'github_api'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require './models'

DB = 'sqlite:///db/gitsize.db' || ENV['HEROKU_POSTGRESQL_COPPER_URL']
set :database, DB

GITHUB = {
  username: ENV['github_username'],
  password: ENV['github_password'],
  repo: 'samstarling.co.uk',
  path: '_posts',
  files: ['css', 'scss']
}

get '/' do
  @commit = Gitcommit.first
  @files = Gitcommitfile.all
  @config = GITHUB
  haml :index
end
