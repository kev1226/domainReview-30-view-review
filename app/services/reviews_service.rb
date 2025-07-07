require_relative '../../config/database'

class ReviewsService
  def initialize
    @collection = DB[:reviews]
  end

  def get_reviews(product_id, rating = nil)
    query = { product_id: product_id }
    query[:rating] = rating.to_i if rating

    @collection.find(query).map do |doc|
      {
        email: doc['email'],
        comment: doc['comment'],
        rating: doc['rating'],
        created_at: doc['created_at']
      }
    end
  end
end
