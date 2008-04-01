class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_lines

  acts_as_commentable

  NEW = 'new'
  APPROVED = "approved"
  REJECTED = "rejected"
  
  def self.new_orders
    find(:all, :conditions => {:status => Order::NEW})
  end


  def add(quantity, model)
    o = OrderLine.new(:quantity => quantity, 
                      :order_id => id, 
                      :model_id => model.to_i)
                      
    order_lines << o
  end
  
  
end
