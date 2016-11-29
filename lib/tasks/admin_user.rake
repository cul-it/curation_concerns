desc 'Create an admin user and roles for development environment'

task :admin_user => :environment do |t, args|
  user = User.find_or_create_by(:email => "admin@example.org") do |u|
    u.password = "admin123"
    u.password_confirmation = "admin123"
  end
  user.save!

  admin = Role.find_or_create_by(:name => "admin")
  admin.users << User.find_by_user_key( "admin@example.org" )
  admin.save!
  print "created admin user and assigned to admin role"
end
