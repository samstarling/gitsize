require 'rubygems'
require 'github_api'
require 'sinatra'
require 'sinatra/activerecord'
require 'haml'
require './models'
require './helpers'

set :database, 'sqlite:///db/gitsize.db'

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
