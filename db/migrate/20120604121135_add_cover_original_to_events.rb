class AddCoverOriginalToEvents < ActiveRecord::Migration
  def change
    add_column :events, :cover_original_url,    :string
    add_column :events, :cover_original_author, :string
  end
end
