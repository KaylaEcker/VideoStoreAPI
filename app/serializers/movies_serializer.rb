class MoviesSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date
end
