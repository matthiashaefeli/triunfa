namespace :chat do 
    task clear_history: :environment do 
        oldest_chats = Chat.where("created_at < ?", 15.days.ago)
        for chat in oldest_chats
            chat.delete
        end
    end 
end
