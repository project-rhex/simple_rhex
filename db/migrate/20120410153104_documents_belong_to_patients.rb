class DocumentsBelongToPatients < ActiveRecord::Migration
  def change
    add_column :documents, :patient_id, :integer
  end
end
