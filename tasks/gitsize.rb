require 'rubygems'
require 'github_api'
require './models'

namespace :gitsize do
  desc "Load latest commit"
  task :latest_commit do
    Gitcommitfile.delete_all
    Gitcommit.delete_all
    
    GITHUB = {
      username: ENV['github_username'],
      password: ENV['github_password'],
      repo: 'samstarling.co.uk',
      path: '_posts',
      files: ['css', 'scss']
    }
    
    github = Github.new login: GITHUB[:username], password: GITHUB[:password]
    
    commit_id = github.repos.commits.list(GITHUB[:username], GITHUB[:repo]).first.sha
    
    github.repos.contents.get(GITHUB[:username], GITHUB[:repo], GITHUB[:path]).each do |file|
      gitcommitfile = Gitcommitfile.new(
        :gitcommit => Gitcommit.find_or_create_by_commit_id(commit_id),
        :gitfile => Gitfile.find_or_create_by_name(file['name']),
        :size => Integer(file['size'])
      )
      gitcommitfile.save
    end
  end
end