require_relative '../models/review'

class ReviewsController
  def list(params, request)
    product_id = params['product_id']
    rating = request.params['rating']

    if product_id.nil? || product_id.strip.empty?
      return [400, { error: 'product_id requerido' }.to_json]
    end

    reviews = Review.where(product_id: product_id)
    reviews = reviews.where(rating: rating) if rating

    results = reviews.all.map do |r|
      {
        email: r.email,
        comment: r.comment,
        rating: r.rating,
        created_at: r.created_at
      }
    end

    [200, results.to_json]
  end
end
