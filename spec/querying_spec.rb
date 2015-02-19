describe 'querying' do 
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_sql
    @sql_runner.execute_encoded_data
  end
  after do
    File.open('lib/decoded_data.sql', 'w'){ |f| f.truncate(0) }
  end
  it 'selects all of the books names and years in the first series and order them in chronological order by year' do 
    sql = <<-SQL
      SELECT title, year
      FROM books
      WHERE series_id = 1
      ORDER BY year asc;
    SQL
    expect(@db.execute(sql)).to eq([["Game of Thrones", 1996], ["A Clash of Kings", 1998], ["A Storm of Swords", 2000]])
  end
  
  it 'returns the name and motto of the character with the longest motto' do
    sql = <<-SQL
      SELECT name, motto
      FROM characters
      ORDER BY LENGTH(motto) DESC
      LIMIT 1;
    SQL
    expect(@db.execute(sql)).to eq([["Tyrion Lanister", "A Lanister always pays is debts"]])
  end

  it 'determines the most prolific species of characters and return its value and count' do
    sql = <<-SQL
      SELECT species, COUNT(*) 
      FROM characters 
      GROUP BY species 
      ORDER BY COUNT(species) 
      DESC LIMIT 1
    SQL
    expect(@db.execute(sql)).to eq([["human", 4]])
  end

  it "selects the authors names and their series' subgenres" do 
    sql = <<-SQL
      SELECT authors.name, subgenres.name
      FROM authors
      JOIN series ON authors.id = series.author_id
      JOIN subgenres ON subgenres.id = series.subgenre_id;
    SQL
    expect(@db.execute(sql)).to eq([["George R. R. Martin", "medieval"], ["Second Author", "space opera"]])
  end

  it 'selects the series name with the most characters that are the species "human"' do 
    sql = <<-SQL
    SELECT series.title 
    FROM series JOIN characters 
    ON series.id = characters.series_id 
    GROUP BY species 
    ORDER BY COUNT(species = 'human') 
    LIMIT 1;

    SQL
    expect(@db.execute(sql)).to eq([["A Song of Ice and Fire"]])
  end

  it 'selects all of the character names and their number of books they have appeared in, in descending order' do 
    sql = <<-SQL
      SELECT characters.name, COUNT(*) 
      FROM characters JOIN character_book 
      ON characters.id = character_book.character_id 
      GROUP BY name 
      ORDER BY COUNT(*) DESC;

    SQL
    expect(@db.execute(sql)).to eq([["Character Three",3], ["Character Two", 3],["Daenerys Targaryen", 3], ["Tyrion Lanister", 3], ["Character Four", 1], ["Character One", 1], ["Eddard Stark", 1], ["Lady", 1]])
  end
end