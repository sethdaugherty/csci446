class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
		
		# Drop the authors column and replace it with a foreign key 
		add_column :articles, :author_id, :int
		# Lets try to move the authors into our new authors table	
		@articles = Article.find(:all)
		@articles.each do |article|
			author = Author.create(:name => article.author)
			author.save
			article.author_id = author.id
			article.save
		  
		end
		remove_column :articles, :author
  end

  def self.down
    # Add the data back into the author column
		add_column :articles, :author, :string
		@articles = Article.find(:all)
		@articles.each do |article|
			author = Author.find(:first, :conditions => ["id = ?", article.author_id])
			article.author = author
			article.save
		end
		remove_column :articles, :author_id
    drop_table :authors

  end
end
