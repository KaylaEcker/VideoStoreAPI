require "test_helper"

describe RentalsController do
  let(:rental_data) {
    {
      customer_id: 1,
      movie_id: 1,
      due_date: "2018-12-25"
    }
  }
describe "checkout" do
  it "is a real working route" do
    post rentals_check_out_path, params: {key: "value"}
    must_respond_with :bad_request
  end

  it "returns json" do
    post rentals_check_out_path, params: rental_data
    response.header['Content-Type'].must_include 'json'
  end

  it "returns an array" do

  end

  it "returns bad_request for invalid requests" do

  end

  it "returns bad_request if movie doesn't have inventory" do

  end

  it "returns a rental with exactly the correct required fields" do

  end

end

end
