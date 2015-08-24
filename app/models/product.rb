class Product < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness:     {scope: :description},
                    length:         {minimum: 1}
  validates :price, presence: true,
                    numericality:   {greater_than: 0}

  after_initialize :set_defaults
  # before_save :capitalize_title

  def self.search(value)
    search_term = "%#{value}%"
    where(["title ILIKE :term OR description ILIKE :term", {term: search_term}])
  end

  # The scope does the same as next 3 self. methods.
  # The next two lines of code do the same thing.
  scope :recent, lambda { order(:created_at).reverse_order }
  scope :recent, -> { order(:create_at).reverse_order }

  def self.recent
    order(:created_at).reverse_order
  end

  def self.ten
    limit(10)
  end

  def self.recent_ten
    recent.ten
  end

  private

  def set_defaults
    # If nil or empty, set it to 0
    self.price ||= 1
  end

  # def capitalize_title
  #   self.title.capitalize!
  # end
end
