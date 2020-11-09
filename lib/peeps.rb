require 'pg'

class Peeps

  def self.all
    setup_connection
    peeps = @connection.exec("SELECT * FROM peeps")
    peeps.map { |peep| peep['message'] }
  end

  def self.create(message:)
    setup_connection
    @connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end
