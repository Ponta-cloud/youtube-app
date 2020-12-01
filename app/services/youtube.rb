require 'google/apis/youtube_v3'
class Youtube 

  def each_link
    channel = ["UCb9h8EpBlGHv9Z896fu4yeQ","UCkB8HnJSDSJ2hkLQFUc-YrQ"]
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
      puts "チャンネル名"
      puts "https://www.youtube.com/channel/#{item.id}"
      puts snippet.title
      puts snippet.thumbnails.default.url
    end
  end  
end  
