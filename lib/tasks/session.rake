
namespace :sessions do
    desc "Clear ActiveRecord sessions"
    task :clear => :environment do
        sql = 'TRUNCATE sessions;'
        ActiveRecord::Base.connection.execute(sql)


    end
end



# desc "Clear expired sessions"
# task :clear_expired_sessions => :environment do
#     sql = 'DELETE FROM sessions WHERE updated_at < DATE_SUB(NOW(), INTERVAL 1 DAY);'
#     ActiveRecord::Base.connection.execute(sql)
# end

# namespace :chat do 
#     task clear_history: :environment do 
#         oldest_chats = Chat.where("created_at < ?", 15.days.ago)
#         for chat in oldest_chats
#             chat.delete
#         end
#     end 
# end


# sql = "DELETE FROM sessions WHERE updated_at < (CURRENT_TIMESTAMP - INTERVAL '1 days');"
# ActiveRecord::Base.connection.execute(sql)