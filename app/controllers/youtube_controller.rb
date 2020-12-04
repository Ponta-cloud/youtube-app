class YoutubeController < ApplicationController

  def index
    @youtubers = Youtuber.all
  end
  
  def manabu
    @manabu= Youtuber.where(channel_data: "UCb9h8EpBlGHv9Z896fu4yeQ")
  end  
  
 def search
    selection = params[:keyword]
    @youtubers = Youtuber.sort(selection)
 end


end
