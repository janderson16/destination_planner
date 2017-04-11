require 'rails_helper'

describe "Destinations API" do
  it "sends a list of destinations" do
    Fabricate.times(3, :destination)

    get '/api/v1/destinations'

    expect(response).to be_success

    destinations = JSON.parse(response.body)

    expect(destinations.count).to eq(3)
  end

  it "sends a single destination" do
    id = Fabricate(:destination).id

    get "/api/v1/destinations/#{id}"

    destination = JSON.parse(response.body)

    expect(response).to be_success

    expect(destination["id"]).to eq(id)
  end

  it "creates a single destination" do
    destination_params = { name: "stuff", zip: "12345", description: "stuff2"}

    post "/api/v1/destinations", params: {destination: destination_params}
    destination = Destination.last

    assert_response :success
    expect(response).to be_success
    expect(destination.name).to eq(destination_params[:name])
  end

  it "can update a single destination" do
    id = Fabricate(:destination).id
    previous_name = Destination.last.name
    destination_params = { name: "new" }

    put "/api/v1/destinations/#{id}", params: {destination: destination_params}

    destination = Destination.find_by(id: id)

    expect(response).to be_success
    expect(destination.name).to_not eq(previous_name)
    expect(destination.name).to eq("new")
  end

  it "can delete a single destination" do
    destination = Fabricate(:destination)

    expect(Destination.count).to eq(1)

    delete "/api/v1/destinations/#{destination.id}"

    expect(response).to be_success
    expect(Destination.count).to eq(0)
    expect{Destination.find(destination.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
