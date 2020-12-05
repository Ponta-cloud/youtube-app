require 'google/apis/youtube_v3'
class YoutubeAPI 

  def each_link
    channel = ["UCb9h8EpBlGHv9Z896fu4yeQ","UCkB8HnJSDSJ2hkLQFUc-YrQ","UCti6dG0zSAetLGGYcgNML4Q"]
    channel.each do |link|
      youtube(link)
    end  
  end
  
  def youtube(link)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]
    options = {
      :id => link#YouTubeチャンネルのIDを指定
    }
    
    response = youtube.list_channels("snippet", options)
    response.items.each do |item|
      snippet = item.snippet
      @id = item.id
      @url = "https://www.youtube.com/channel/#{item.id}"
      @title = snippet.title
      @image = snippet.thumbnails.default.url
    end
    
    link_statistics = youtube.list_channels("statistics", options)
    link_statistics.items.each do |item|
      statistics = item.statistics
      @view = statistics.view_count
      @subscriber = statistics.subscriber_count
      @video = statistics.video_count
    end  
    id,url,title,image,view,subscriber,video = @id, @url, @title, @image, @view, @subscriber, @video
    youtuber_detail_save(id,url,title,image,view,subscriber,video) 
  end
  
  def youtuber_detail_save(id,url,title,image,view,subscriber,video) 
      youtuber = Youtuber.where(channel_data: id).first_or_initialize
      youtuber.url = url
      youtuber.name = title
      youtuber.channel_image = image
      youtuber.channel_view_count = view
      youtuber.channel_subscriber_count = subscriber
      youtuber.channel_video_count = video
      youtuber.save
  end  
  
end  



