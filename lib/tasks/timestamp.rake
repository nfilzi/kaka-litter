namespace :db do
  desc 'Gives you a timestamp for your migration file name'
  task :timestamp do
    puts DateTime.now.strftime('%Y%m%d%H%M%S')
  end
end
