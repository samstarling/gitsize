require 'github_api'
require 'sinatra'
require 'haml'

GIGA_SIZE = 1073741824.0
MEGA_SIZE = 1048576.0
KILO_SIZE = 1024.0

def readable_file_size(size, precision=1)
  case
  when size == 1
    "1 byte"
  when size < KILO_SIZE
    "%d bytes" % size
  when size < MEGA_SIZE
    "%.#{precision}f KB" % (size / KILO_SIZE)
  when size < GIGA_SIZE
    "%.#{precision}f MB" % (size / MEGA_SIZE)
  else 
    "%.#{precision}f GB" % (size / GIGA_SIZE)
  end
end

module Gitsize
  class GithubFile
    attr_reader :name, :size

    def initialize name, size
      @name = name
      @size = size
    end

    def class
      if size > 2000
        "too-big"
      else
        "normal"
      end
    end

    def friendly_size
      readable_file_size @size
    end
  end
end

GITHUB = {
  username: ENV['github_username'],
  password: ENV['github_password'],
  repo: 'samstarling.co.uk',
  path: '_posts',
  files: ['css', 'scss']
}

get '/' do
  github = Github.new login: GITHUB[:username], password: GITHUB[:password]
  @files = Array.new
  github.repos.contents.get(GITHUB[:username], GITHUB[:repo], GITHUB[:path]).each do |file|
    ghf = Gitsize::GithubFile.new file['name'], file['size']
    @files << ghf
  end
  
  haml :index
end
