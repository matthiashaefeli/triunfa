namespace :chat do 
    task clear_history: :environment do 
        puts "Starting to clear chat and talk history (posts older than 15 days)."
        clear(Chat)
        clear(Talk)
        puts "Finished"
    end 
end

def clear(forum)
    oldest_posts = forum.where("created_at < ?", 15.days.ago)
    for post in oldest_posts
        post.delete
    end
end