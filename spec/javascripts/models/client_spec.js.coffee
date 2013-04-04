#= require config
#= require application

describe "Client", ->
  it "Gives the full name", ->
    client = Embertest.Client.createRecord
      firstName: "John"
      lastName: "Doe"

    client.get('fullName').should.equal "John Doe"
