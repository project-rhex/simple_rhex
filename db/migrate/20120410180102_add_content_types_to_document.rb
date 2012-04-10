class AddContentTypesToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :content_type, :string
    add_column :documents, :file_size, :integer
  end
end
