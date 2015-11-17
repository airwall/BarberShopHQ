class CreateBarbers < ActiveRecord::Migration
  def change
  	create_table :barbers do |t|
  		t.text :name
  		
  		t.timestamps null: false
  	end

  	Barbers.create :name => 'Jassie Pinkman'
  	Barbers.create :name => 'Walter White'
  	Barbers.create :name => 'Gus Fring'
  	
  end
end
