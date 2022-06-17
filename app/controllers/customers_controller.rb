class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show]
 
  def show
    @tasks=Task.all
    @task=@tasks.find(@customer.task_id)
   
  end
  private
  def customer_params 
    params.require(:customer).permit(:name,:tel,:zip,:prefecture,:address,:room_number)
  end

 def set_customer
  #@customer=@task.customers.id
  @customer = Customer.find(params[:id])
 end
end
