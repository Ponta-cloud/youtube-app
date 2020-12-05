class YoutubeController < ApplicationController

  def index
    @youtubers = Youtuber.all
  end
  
  def show
    @youtubers_data = Youtuber.where(id: params[:id])
  end  
  
  def search
    selection = params[:keyword]
    @youtubers = Youtuber.sort(selection)
  end

end
