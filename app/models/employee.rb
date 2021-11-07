class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.name == "Ashish"
      record.errors.add :base, "Ashish  is not allowed "
    end
  end
end
class Employee < ApplicationRecord
  belongs_to :company
  after_initialize do |user|
    puts "=============You have initialized an object!=================="
  end
  after_find do |user|
    puts "You have found an object!"
  end
  private
  def my_call_back_method
    puts '=========================in around save========================================'
    yield # User saved
    puts '==========================================out around save==========================='
  end
  around_create  :my_call_back_method
  before_validation :message1, on: :create      #filters
  after_validation :message2, on: [ :create, :update ]           #filters
  validates :age,presence:true
  before_validation :ensure_student_name_has_a_value                     #filters
  validates_with GoodnessValidator
  validates :name,uniqueness: true
  validates :name,length: { minimum:2,maximum: 1000,too_long: "%{count} characters is the maximum allowed" }
  validates :age,numericality: true,uniqueness: { scope: :age, message: "age  is not same for two employee" }
  before_save :merge_name                                           #filters
  after_destroy :update_log                                               #filters
  def merge_name
    self.name=self.name+" at"+self.company.name
  end
  def update_log
    logger.info "==================Alas ! A Book has been deleted id is  #{self.id} and name #{self.name}"
  end
  private
  def ensure_student_name_has_a_value
    if name.nil?
      self.name="ashish"
    end
  end
  def message1
    logger.info "======================creation start====================="
  end
  def message2
    logger.info "======================created======================"
  end
end


