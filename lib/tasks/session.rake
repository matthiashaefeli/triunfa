namespace :sessions do
  
    desc "Clear the sessions table"
    task :clear => [:environment, 'db:load_config'] do
        online_false(Admin)
        online_false(Student)
        online_false(Teacher)
      ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{ActiveRecord::SessionStore::Session.table_name}"
    end
  
    desc "Trim old sessions from the table (default: > 30 days)"
    task :trim => [:environment, 'db:load_config'] do
      cutoff_period = (ENV['SESSION_DAYS_TRIM_THRESHOLD'] || 30).to_i.days.ago
      ActiveRecord::SessionStore::Session.
        where("updated_at < ?", cutoff_period).
        delete_all
    end

  end

def online_false(user)
    users = user.where(online: true)
    for user in users
        user.online= false
        user.save
    end
end

