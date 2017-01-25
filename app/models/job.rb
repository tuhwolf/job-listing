class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  # validates :contact_email, presence: true
  validates :company, presence: true
  validates :location, presence: true

  has_many :resumes
  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user

  scope :recent, -> { order('created_at DESC') }
  scope :lower, -> { order('wage_lower_bound DESC') }
  scope :upper, -> { order('wage_upper_bound DESC') }
  scope :published, -> { where(is_hidden: false) }

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
end
