# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  desc 'Gives you a timestamp for your migration file name'
  task :timestamp do
    puts DateTime.now.strftime('%Y%m%d%H%M%S')
  end
end
