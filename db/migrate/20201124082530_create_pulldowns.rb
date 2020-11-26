class CreatePulldowns < ActiveRecord::Migration[6.0]
  def change
    create_table :pulldowns do |t|
      t.integer    :category_id          , null: false
      t.integer    :status_id            , null: false
      t.integer    :burden_id            , null: false
      t.integer    :area_id              , null: false
      t.integer    :guideline_id         , null: false
      t.timestamps
    end
  end
end
