require 'peeps'

describe Peeps do
  describe '.all' do
    it "returns all peeps" do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is my first peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('You cant lock me down!!!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('#overit');")

      peeps = Peeps.all

      expect(peeps).to include('This is my first peep!')
      expect(peeps).to include('You cant lock me down!!!')
      expect(peeps).to include('#overit')
    end
  end

  describe '.create' do
    it "creates a new tweet" do
      Peeps.create(message: "This is my first peep!")
      expect(Peeps.all).to include 'This is my first peep!'
    end
  end
end
