require "test_helper"

describe MoviesController do
  describe "index" do
    it "is a real working route" do
      get movies_path
      must_respond_with :success
    end

    it "returns json" do
      get movies_path
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an empty array if no movies" do
      Movie.destroy_all
      get movies_path
      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.must_be :empty?
    end

    it "returns an array" do
      get movies_path
      body = JSON.parse(response.body)
      body.must_be_kind_of Array

    end

    it "returns all of the movies" do
      get movies_path
      body = JSON.parse(response.body)
      body.length.must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      keys = %w(id release_date title)
      get movies_path
      body = JSON.parse(response.body)
      body.each do |movie|
        movie.keys.sort.must_equal keys
      end
    end
  end

  describe "show" do
    it "can get a movie with working path" do
      get movie_path(movies(:two).id)
      must_respond_with :success
    end

    it "returns an error for an invalid id" do
      get movie_path("yolo")
      must_respond_with :not_found
    end

    it "returns json" do
      get movie_path(movies(:two).id)
      response.header['Content-Type'].must_include 'json'
    end

    it "returns a single movie with exactly the required fields" do
      keys = %w(id release_date title)
      get movie_path(movies(:two).id)
      body = JSON.parse(response.body)
      body.keys.sort.must_equal keys
      body.must_be_instance_of Hash
      body.count.must_equal 3
    end
  end
end
