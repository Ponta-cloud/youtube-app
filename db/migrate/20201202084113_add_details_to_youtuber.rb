class AddDetailsToYoutuber < ActiveRecord::Migration[5.2]
  def change
    add_column :youtubers, :channel_data, :string
    add_column :youtubers, :channel_subscriber_count, :integer
    add_column :youtubers, :channel_video_count, :integer
    add_column :youtubers, :channel_image, :string
    add_column :youtubers, :channel_view_count, :integer
  end
end
