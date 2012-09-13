require "github_api"
require "sinatra"

GITHUB = {
  username: ENV['github_username'],
  password: ENV['github_password'],
  repo: 'samstarling.co.uk',
  path: '_posts'
}

get '/' do
  content_type 'text/plain'

  github = Github.new login: GITHUB[:username], password: GITHUB[:password]
  x = Array.new
  github.repos.contents.get(GITHUB[:username], GITHUB[:repo], GITHUB[:path]).each do |file|
    x << "#{file['size']} - #{file['name']}\n"
  end
  x
end
