class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.integer      :foreigner_id
      t.integer      :menu_id

			t.boolean		   :is_eval
			t.string		   :content

      t.timestamps null: false
    end
  end

end
