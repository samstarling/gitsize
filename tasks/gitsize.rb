require 'rubygems'
require 'github_api'
require './models'

namespace :gitsize do
  desc "Load latest commit"
  task :latest_commit do
    Gitcommitfile.delete_all
    
    GITHUB = {
      username: ENV['github_username'],
      password: ENV['github_password'],
      repo: 'samstarling.co.uk',
      path: '_posts',
      files: ['css', 'scss']
    }
    
    github = Github.new login: GITHUB[:username], password: GITHUB[:password]
    @files = Array.new
    @config = GITHUB 
    github.repos.contents.get(GITHUB[:username], GITHUB[:repo], GITHUB[:path]).each do |file|
      gitfile = Gitfile.find_or_create_by_name(file['name'])
      gitcommit = Gitcommit.new
      gitcommit.save
      puts file['size']
      gitcommitfile = Gitcommitfile.new(
        :gitcommit => gitcommit,
        :gitfile => gitfile,
        :size => Integer(file['size'])
      )
      gitcommitfile.save
    end
  end
end