class Youtuber < ApplicationRecord
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'channel_view_count'
      return all.order(channel_view_count: :DESC)
    when 'channel_subscriber_count'
      return all.order(channel_subscriber_count: :DESC)
    when 'channel_video_count'
      return all.order(channel_video_count: :DESC)
    end
  end  
end
